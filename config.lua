-- |||||||||||||||||||||||||||||||||||||||||
-- ||                                     ||
-- ||                                     ||
-- ||  ░S░.░H░.░ ░D░e░v░e░l░o░p░m░e░n░t░  ||
-- ||                                     ||
-- ||                                     ||
-- |||||||||||||||||||||||||||||||||||||||||

Config = Config or {}

Config.Notify = "standalone" -- Use default for the default built in notify & use okok for okok's Notify system
Config.DrawText = "ox" -- Use "cd" for cd_drawtextui, use "okok" for okok's Drawtext UI system, use "ox" for ox_lib drawtext

Config.DisableAirroll = "true"

Config.FixZone = {
    ['lscustoms'] = {
        ['Zone'] = {
            ['Shape'] = {
                  vector2(-349.26071166992, -137.51861572266),
                  vector2(-343.29443359375, -122.9235610962),
                  vector2(-319.43041992188, -130.90051269532),
                  vector2(-323.29330444336, -142.21282958984),
                  vector2(-329.58682250976, -140.05908203125),
                  vector2(-331.56750488282, -144.76124572754)
            },
            ['minZ'] = 36.00,
            ['maxZ'] = 42.5,
        },
        label = 'LS Customs',
        showBlip = true,
        blipcoords = vector3(-337.66, -135.82, 38.4),
        blipName = 'LS Customs',
        blipColor = 5,
        type = 'public',
        debug = false
    },
    ['lsroute68'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1184.9598388672, 2645.193359375),
  				vector2(1185.1394042968, 2634.9343261718),
  				vector2(1170.7985839844, 2633.7963867188),
  				vector2(1171.537109375, 2645.2270507812)
            },
            ['minZ'] = 36.80,
            ['maxZ'] = 39.9,
        },
        label = 'LS Route 68',
        showBlip = true,
        blipcoords = vector3(1183.5, 2639.61, 44.39),
        blipName = 'LS Route 68',
        blipColor = 5,
        type = 'public',
        debug = false
    },
    ['lspaleto'] = {
        ['Zone'] = {
            ['Shape'] = {
 				vector2(99.34967803955, 6623.2534179688),
 				vector2(106.83222198486, 6615.984375),
 				vector2(116.36199188232, 6625.4135742188),
  				vector2(109.64653778076, 6632.9443359375)
            },
            ['minZ'] = 29.80,
            ['maxZ'] = 33.9,
        },
        label = 'LS Paleto',
        showBlip = true,
        blipcoords = vector3(106.5, 6626.25, 38.43),
        blipName = 'LS Customs',
        blipColor = 5,
        type = 'public',
        debug = false
    },
    ['lsairport'] = {
        ['Zone'] = {
            ['Shape'] = {
 				vector2(-1147.499633789, -1989.7635498046),
 				vector2(-1171.4123535156, -2014.0239257812),
 				vector2(-1158.607421875, -2026.8586425782),
 				vector2(-1137.9178466796, -2007.1674804688),
 				vector2(-1141.4733886718, -2004.0098876954),
 				vector2(-1142.6553955078, -2004.6982421875),
 				vector2(-1149.2607421875, -1998.0162353516),
 				vector2(-1144.4552001954, -1992.8653564454)
            },
            ['minZ'] = 11.1,
            ['maxZ'] = 15.2,
        },
        label = 'LS Airport',
        showBlip = true,
        blipcoords = vector3(-1147, -2000.4, 19.57),
        blipName = 'LS Customs',
        blipColor = 5,
        type = 'public',
        debug = false
    },
    ['lsbridge'] = {
        ['Zone'] = {
            ['Shape'] = {
 				vector2(724.07153320312, -1092.41015625),
 				vector2(724.54467773438, -1063.3995361328),
 				vector2(738.82250976562, -1063.1137695312),
 				vector2(738.95428466796, -1095.3974609375)
            },
            ['minZ'] = 20.1,
            ['maxZ'] = 24.2,
        },
        label = 'LS Bridge',
        showBlip = true,
        blipcoords = vector3(733, -1086.7, 30.82),
        blipName = 'LS Customs',
        blipColor = 5,
        type = 'public',
        debug = false
    }
}