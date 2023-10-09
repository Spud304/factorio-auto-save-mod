-- control.lua

save_happened = false

script.on_init(function()
    global.save_seed = math.floor(game.create_random_generator()() * 100000)
    global.current_save_number = 0
end)

script.on_event(defines.events.on_tick,
function(event)
    current_time = game.get_surface("nauvis").daytime
    if current_time >= .02 and current_time <= .025 and save_happened == false then
        save_happened = true
        game.auto_save(tostring(global.save_seed) .. "-" .. tostring(global.current_save_number))
        global.current_save_number = global.current_save_number + 1
    end
    if current_time >= .026 then
        save_happened = false
    end
end)