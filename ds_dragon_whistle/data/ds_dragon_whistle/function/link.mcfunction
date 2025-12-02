
advancement revoke @s only ds_dragon_whistle:whistle-link

#comment this to allow dragon players to link with the whistle
execute if data entity @s "neoforge:attachments"."dragonsurvival:dragon_handler".dragon_species run return run title @s actionbar {"text":"You can't link whistles as a dragon","color":"red"}


data modify storage dsdw_temp CustomItemData set from entity @s SelectedItem.components."minecraft:custom_data"
data modify storage dsdw_temp linkUUID set value []
data modify storage dsdw_temp Name set value "None"


execute as @a[distance=0.01..8] if data entity @s "neoforge:attachments"."dragonsurvival:dragon_handler".dragon_species run tag @s add dsdw_isDragon

#uncomment this to make all players linkable
#tag @a add dsdw_isDragon
#uncomment this to make all entities linkable (can get messy and break things)
#tag @e add dsdw_isDragon

execute unless entity @e[distance=0.01..8,tag=dsdw_isDragon] run title @s actionbar {"text":"No dragon players in radius. Removed the link.","color":"red"}
execute if entity @e[distance=0.01..8,tag=dsdw_isDragon] run title @s actionbar {"text":"Successfully created a link with a dragon","color":"green"}

#get entity's UUID
data modify storage dsdw_temp linkUUID set from entity @n[distance=0.01..8,tag=dsdw_isDragon] UUID

#get player's name
execute as @n[distance=0.01..8,tag=dsdw_isDragon] run loot spawn ~ ~ ~ loot ds_dragon_whistle:get-skull
data modify storage dsdw_temp Name set from entity @n[type=item,distance=0,nbt={Item:{id:"minecraft:player_head"}}] Item.components."minecraft:profile".name
kill @n[type=item,distance=0,nbt={Item:{id:"minecraft:player_head"}}]

tag @e remove dsdw_isDragon

function ds_dragon_whistle:link-new-whistle with storage dsdw_temp