execute unless data entity @a[nbt={UUID:$(UUID)}] "neoforge:attachments"."dragonsurvival:dragon_handler".dragon_species run return run title @s actionbar {"text":"The linked player is not a dragon anymore","color":"red"}

$tp @e[nbt={UUID:$(UUID)}] @s
