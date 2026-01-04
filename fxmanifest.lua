fx_version 'cerulean'
game 'gta5'

author 'RP-Alpha'
description 'RP-Alpha Cityhall and ID System'
version '1.1.0'

dependency 'rpa-lib'

shared_script 'config.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}

client_script 'client/main.lua'
server_script 'server/main.lua'

lua54 'yes'
