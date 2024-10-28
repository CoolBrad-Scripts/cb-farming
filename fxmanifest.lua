fx_version 'cerulean'
game 'gta5'

name "CB-Farming"
description "Fruit/Vegetable picking script for FiveM RP servers"
author "Cool Brad Scripts"
version "1.1.0"

lua54 'yes'
use_experimental_fxv2_oal 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'@qbx_core/modules/playerdata.lua', -- For QBOX users
	'client/framework.lua',
	'client/notify.lua',
	'client/*.lua'
}

server_scripts {
	'server/framework.lua',
	'server/*.lua'
}
