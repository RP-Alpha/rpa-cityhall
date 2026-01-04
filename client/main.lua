local display = false

-- Helper function to load model with timeout
local function LoadModel(model, timeout)
    timeout = timeout or 5000
    local hash = type(model) == 'string' and GetHashKey(model) or model
    
    if not IsModelValid(hash) then
        return false
    end
    
    RequestModel(hash)
    local startTime = GetGameTimer()
    while not HasModelLoaded(hash) do
        if GetGameTimer() - startTime > timeout then
            return false
        end
        Wait(10)
    end
    return true
end

RegisterNetEvent('rpa-cityhall:client:open', function()
    SetNuiFocus(true, true)
    display = true
    SendNUIMessage({ action = 'open' })
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    display = false
    cb('ok')
end)

RegisterNUICallback('requestService', function(data, cb)
    TriggerServerEvent('rpa-cityhall:server:requestService', data.service)
    cb('ok')
end)

-- City Hall Location and NPC
local cityhallNPC = nil
local Config_CityHall = {
    coords = vector3(-548.9, -204.0, 38.2),
    heading = 210.0,
    npcModel = 's_f_m_shop_high',
    blip = {
        sprite = 498,
        color = 2,
        scale = 0.8,
        label = "City Hall"
    }
}

CreateThread(function()
    -- Spawn NPC
    if LoadModel(Config_CityHall.npcModel) then
        local hash = GetHashKey(Config_CityHall.npcModel)
        cityhallNPC = CreatePed(4, hash, Config_CityHall.coords.x, Config_CityHall.coords.y, Config_CityHall.coords.z - 1.0, Config_CityHall.heading, false, true)
        FreezeEntityPosition(cityhallNPC, true)
        SetEntityInvincible(cityhallNPC, true)
        SetBlockingOfNonTemporaryEvents(cityhallNPC, true)
        
        -- Add target to NPC
        exports['rpa-lib']:AddTargetModel(Config_CityHall.npcModel, {
            options = {
                {
                    label = "Access City Services",
                    icon = "fas fa-landmark",
                    action = function()
                        TriggerEvent('rpa-cityhall:client:open')
                    end
                }
            }
        })
    else
        -- Fallback: Add a target zone if NPC fails
        exports['rpa-lib']:AddTargetZone('cityhall_desk', Config_CityHall.coords, vector3(2, 2, 2), {
            options = {
                {
                    label = "Access City Services",
                    icon = "fas fa-landmark",
                    action = function()
                        TriggerEvent('rpa-cityhall:client:open')
                    end
                }
            }
        }, false)
    end
    
    -- Add blip
    local blip = AddBlipForCoord(Config_CityHall.coords.x, Config_CityHall.coords.y, Config_CityHall.coords.z)
    SetBlipSprite(blip, Config_CityHall.blip.sprite)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, Config_CityHall.blip.scale)
    SetBlipColour(blip, Config_CityHall.blip.color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config_CityHall.blip.label)
    EndTextCommandSetBlipName(blip)
end)

-- Debug command
RegisterCommand('cityhall', function()
    TriggerEvent('rpa-cityhall:client:open')
end, false)
