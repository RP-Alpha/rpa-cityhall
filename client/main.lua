-- Placeholder
RegisterNetEvent('rpa-cityhall:client:open', function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'open' })
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('requestService', function(data, cb)
    TriggerServerEvent('rpa-cityhall:server:requestService', data.service)
    cb('ok')
end)
