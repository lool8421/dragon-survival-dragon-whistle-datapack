#delete an old whistle with old entity UUID
$clear @s echo_shard[minecraft:custom_data=$(CustomItemData)] 1

#give a new one with new data
$give @s echo_shard[max_stack_size=1, \
food={saturation:0,nutrition:0,eat_seconds:9999999,can_always_eat:1b}, \
custom_name='{"text":"Dragon Whistle","color":"yellow","italic":false}', \
lore=['[{"text":"Linked: ","color":"dark_aqua","italic":false},{"text":"$(Name)","color":"aqua"}]'], \
custom_data={ds_dragon_whistle:1b,linkedUUID:$(linkUUID)} \
]

