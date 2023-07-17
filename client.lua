-- |||||||||||||||||||||||||||||||||||||||||
-- ||                                     ||
-- ||                                     ||
-- ||  ░S░.░H░.░ ░D░e░v░e░l░o░p░m░e░n░t░  ||
-- ||                                     ||
-- ||                                     ||
-- |||||||||||||||||||||||||||||||||||||||||

local FixZones = {}
local IsInsideFixZone = false

-- Threads
CreateThread(function()
    for _, fixzone in pairs(Config.FixZone) do
        if fixzone.showBlip then
            local FixZone = AddBlipForCoord(fixzone.blipcoords.x, fixzone.blipcoords.y, fixzone.blipcoords.z)
            local blipColor = fixzone.blipColor ~= nil and fixzone.blipColor or 3
            SetBlipSprite(FixZone, 72)
            SetBlipDisplay(FixZone, 4)
            SetBlipScale(FixZone, 0.8)
            SetBlipAsShortRange(FixZone, true)
            SetBlipColour(FixZone, blipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.FixZoneNameAsBlipName and fixzone.label or fixzone.blipName)
            EndTextCommandSetBlipName(FixZone)
        end
    end
end)

CreateThread(function()
    for fixzoneName, fixzone in pairs(Config.FixZone) do
        if(fixzone.type == 'public') then
            CreateFixPolyZone(fixzoneName)
        end
    end
    CreateFixZone()
end)

CreateThread(function()
    while true do
        Wait(10)
        if IsInsideFixZone then
            if IsControlJustPressed(0, 38) then
                TriggerEvent("sh-repair:repairvehicle")
            end
        end
    end
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if IsEntityInAir(veh) then
            DisableControlAction(0, 59, true)  -- Disable leaning left/right (A/D)
            DisableControlAction(0, 60, true)  -- Disable leaning forward/backward (W/S)
        else
            if IsEntityInAir(veh) then
                EnableControlAction(0, 59, true)
                EnableControlAction(0, 60, true)
            end
        end
        Wait(0)
    end
end)

-- Events
RegisterNetEvent('sh-repair:repairvehicle', function()
    local ped = PlayerPedId()
    local timer = math.random(6000, 10000)
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        if Config.Notify == "default" then
            notification("~g~A Mechanic is repairing your vehicle.")
            FreezeEntityPosition(veh, true)
            Wait(timer)
            notification("~g~Your vehicle has been fixed!")
            FreezeEntityPosition(veh, false)
            SetVehicleEngineHealth(veh, 1000)
            SetVehicleEngineOn(veh, true, true)
            SetVehicleFixed(veh)
        elseif Config.Notify == "okok" then
            exports['okokNotify']:Alert('Mechanic Shop', 'A mechanic is repairing your vehicle..', 5000, 'info', true)
            FreezeEntityPosition(veh, true)
            Wait(timer)
            exports['okokNotify']:Alert('Mechanic Shop', 'Your vehicle has been repaired!', 7000, 'success', true)
            FreezeEntityPosition(veh, false)
            SetVehicleEngineHealth(veh, 1000)
            SetVehicleEngineOn(veh, true, true)
            SetVehicleFixed(veh)
        end
    else
        if Config.Notify == "default" then
            notification("~o~You need to be in a vehicle to do this!")
        elseif Config.Notify == "okok" then
            exports['okokNotify']:Alert('Mechanic Shop', 'You need to be in a vehicle!', 6000, 'error', true)
        end
    end
end)

RegisterNetEvent('sh-repair:repair', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped, false)
        if Config.Notify == "default" then
            notification("~g~You are looking at your engine.")
            Wait(math.random(5000,9000))
            SetVehicleEngineHealth(veh, 1000)
            SetVehicleEngineOn(veh, true, true)
            notification("~o~You fixed some loose screws and got it working, Get to a Mechanic Shop!")
        elseif Config.Notify == "okok" then
            exports['okokNotify']:Alert('Investigating..', 'You are looking at your engine..', 6000, 'info', false)
            Wait(math.random(5000,9000))
            SetVehicleEngineHealth(veh, 1000)
            SetVehicleEngineOn(veh, true, true)
            exports['okokNotify']:Alert('Looks Okay...', 'You fixed some loose screws and got it working, Get to a Mechanic Shop!', 8000, 'warning', true)
        end
    else
        if Config.Notify == "default" then
            notification("~r~Looks like you are not in a vehicle!")
        elseif Config.Notify == "okok" then
            exports['okokNotify']:Alert('Uh oh...', 'Looks like you are not in a vehicle!', 6000, 'error', false)
        end
    end
end)

-- Functions
function CreateFixZone()
    local combo = ComboZone:Create(FixZones, {name = 'fixzones', debugPoly=false})
    combo:onPlayerInOut(function(isPointInside, l, zone)
        if isPointInside then
            CurrentFixZone = zone.name
            if Config.DrawText == "cd" then
                TriggerEvent('cd_drawtextui:ShowUI', 'show', "Press [E] to fix vehicle.")
            elseif Config.DrawText == "okok" then
                exports['okokTextUI']:Open('[E] Repair Vehicle', 'darkblue', 'right')
            elseif Config.DrawText == "ox" then
                lib.showTextUI('[E] - Repair Vehicle')
            end
            IsInsideFixZone = true
        else
            CurrentFixZone = nil
            if Config.DrawText == "cd" then
                TriggerEvent('cd_drawtextui:HideUI')
            elseif Config.DrawText == "okok" then
                exports['okokTextUI']:Close()
            elseif Config.DrawText == "ox" then
                lib.hideTextUI()
            end
            IsInsideFixZone = false
        end
    end)
end

function CreateFixPolyZone(fixzone)
    local zone = PolyZone:Create(Config.FixZone[fixzone].Zone.Shape, {
        name = fixzone,
        minZ = Config.FixZone[fixzone].Zone.minZ,
        maxZ = Config.FixZone[fixzone].Zone.maxZ,
        debugPoly = Config.FixZone[fixzone].debug
    })
    FixZones[#FixZones+1] = zone
end

function notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

-- Commands

RegisterCommand('repair', function()
    TriggerEvent('sh-repair:repair')
end)
