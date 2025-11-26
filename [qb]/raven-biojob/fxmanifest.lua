

fx_version 'cerulean'
game 'gta5'

description 'Bio Job'
author 'Raven'
version '1.0.0'

shared_script '@qb-core/shared.lua'
shared_script 'config.lua'

client_script 'client.lua'
server_script 'server.lua'

dependencies {
    'qb-core',
    'ox_target',
    'ox_inventory'
}

