-- control.lua

save_happened = false
local previous_time = nil

script.on_init(function()
    global.save_seed = math.floor(game.create_random_generator()() * 100000)
    global.current_save_number = 0
    global.day_counter = 0
end)

script.on_event(defines.events.on_tick,
function(event)
    current_time = game.get_surface("nauvis").daytime
    if previous_time ~= nil then
        if current_time < previous_time then
            global.day_counter = global.day_counter + 1
        end
    end
    if current_time >= .02 and current_time <= .025 then
        if save_happened == false and global.day_counter % settings.global["auto-save-frequency"].value == 0 then
            save_happened = true
            game.auto_save(tostring(global.save_seed) .. "-" .. tostring(global.current_save_number))
            global.current_save_number = global.current_save_number + 1
        end
    end
    if current_time >= .026 then
        save_happened = false
    end
    previous_time = current_time
end)