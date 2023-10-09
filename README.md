# factorio-auto-save-mod

Quick little mod created to create an autosave in factorio once every ingame day

savefile format is `_autosave-{gameseed}-{save_number}`

where the gameseed is a random number generated based off off the seed of the created game
and the save number is a counter that increments each time a save is created, creating something like this

```
_autosave-634-0
_autosave-634-1
_autosave-634-2
...
```