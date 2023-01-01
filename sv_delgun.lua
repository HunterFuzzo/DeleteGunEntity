ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("delgun", function(source, args)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local playerGroup = xPlayer.getGroup() 

    if playerGroup ~= "admin" and playerGroup ~= "superadmin" then 
        ESX.ShowNotification("~r~You don't have the necessary permissions")
        return
    end

    if #args ~= 1 then
        ESX.ShowNotification("~r~An argument is missing or there are too many arguments")
        return
    end

    if args[1] ~= "on" and args[1] ~= "off" then
        ESX.ShowNotification("~r~Argument is incorrect or invalid")
        return
    end

    if args[1] == "on" then
        TriggerClientEvent('fine:delgunOn', _src)
    end

    if args[1] == "off" then
        TriggerClientEvent('fine:delgunOff', _src)
    end 
end)
