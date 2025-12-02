advancement revoke @s only ds_dragon_whistle:whistle-use

#comment this line to allow dragon players to use the whistle
execute if data entity @s "neoforge:attachments"."dragonsurvival:dragon_handler".dragon_species run return run title @s actionbar {"text":"You can't use whistle as a dragon","color":"red"}

playsound minecraft:block.note_block.flute master @a ~ ~ ~ 1 2
#comment this to disable cooldowns
execute if score @s dsdw_whistle_cooldown matches 1.. run return fail
#alternatively change cooldown there (in seconds)
scoreboard players set @s dsdw_whistle_cooldown 10

#get UUID of the linked entity
data modify storage dsdw_temp UUID set from entity @s SelectedItem.components."minecraft:custom_data".linkedUUID
#teleport that entity to player
function ds_dragon_whistle:use-macro with storage dsdw_temp
