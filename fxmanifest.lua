-- |||||||||||||||||||||||||||||||||||||||||
-- ||                                     ||
-- ||                                     ||
-- ||  ░S░.░H░.░ ░D░e░v░e░l░o░p░m░e░n░t░  ||
-- ||                                     ||
-- ||                                     ||
-- |||||||||||||||||||||||||||||||||||||||||

fx_version 'cerulean'
game 'gta5'

author 'S.H. Development'
description 'Simple /repair command script'
version '1.1'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua'
}

shared_script 'config.lua'

lua54 'yes'