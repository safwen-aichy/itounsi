



fx_version 'cerulean'
game 'gta5'

author 'Raven'
description 'Raven CCTV System'
version '1.0.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@qb-core/server/lib.lua',
    'server.lua'
}

dependencies {
    'qb-core',
    'qb-menu',
    'progressbar'
}
