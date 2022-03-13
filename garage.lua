local QBCore = exports['qb-core']:GetCoreObject()

local debug = false

Citizen.CreateThread(function()
    exports['qb-target']:AddBoxZone("JobGarage", vector3(0, 0, 0), 0, 0, { name = "JobGarage", heading=0, debugPoly=debug, minZ=0, maxZ=0 }, 
        { options = { { event = "ScriptNameHere:Menu:Garage", icon = "far fa-clipboard", label = "JOBNAMEHERE Garage", job = "JOBNAMEHERE", }, },
            distance = 2.0
    })
end)

RegisterNetEvent('ScriptNameHere:garage')   -- Make sure to insert the script name
AddEventHandler('ScriptNameHere:garage', function(bs)
    local vehicle = bs.vehicle
    local coords = vector4(0, 0, 0, 0)  -- Position Vehicle Spawns
        if vehicle == 'panto' then   -- Vehicle Hash
            QBCore.Functions.SpawnVehicle(vehicle, function(veh)
                SetVehicleNumberPlateText(veh, "BUSINESSNAME"..tostring(math.random(1000, 9999))) -- To have a specific Number Plate on Vehicle
                exports['lj-fuel']:SetFuel(veh, 100.0)  -- Change for the Fuel script your using
                SetEntityHeading(veh, coords.w)
                TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
            end, coords, true)
        end
end)

RegisterNetEvent('ScriptNameHere:storecar')
AddEventHandler('ScriptNameHere:storecar', function()
    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    NetworkFadeOutEntity(car, true,false)
    Citizen.Wait(2000)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('ScriptNameHere:Menu:Garage', function()
    exports['qb-menu']:openMenu({
        { header = "| JOBNAMEHERE Garage |", isMenuHeader = true },
        { header = "• Panto", txt = "Fast and Reliable", params = { event = "ScriptNameHere:garage", args = { vehicle = 'panto', } } },  -- Vehicle Hash
        { header = "• Store Vehicle", txt = "Store Vehicle Inside Garage", params = { event = "ScriptNameHere:storecar", args = {      } } },  
        { header = "• Close Menu", txt = "",  params = {  event = "qb-menu:client:closeMenu" } },
    })
end)
