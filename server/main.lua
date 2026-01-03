RegisterNetEvent('rpa-cityhall:server:requestService', function(service)
    local src = source
    local cost = 0
    if service == 'id_card' then cost = 50
    elseif service == 'driver_license' then cost = 500
    elseif service == 'weapon_license' then cost = 5000 end
    
    local player = exports['rpa-lib']:GetFramework().Functions.GetPlayer(src)
    if player.Functions.RemoveMoney('cash', cost) then
        player.Functions.AddItem(service, 1) -- Assumes item name matches service
        exports['rpa-lib']:Notify(src, "Purchased " .. service, "success")
    else
        exports['rpa-lib']:Notify(src, "Not enough cash", "error")
    end
end)
