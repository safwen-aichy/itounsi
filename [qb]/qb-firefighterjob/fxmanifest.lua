



fx_version 'cerulean'
game 'gta5'

author 'Raven'
description 'Firefighter Job'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
