-- check if the player has permission

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("delgun", function(source, args)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
	local playerGroup = xPlayer.getGroup() 

	if args[1] == nil then
		ESX.ShowNotification("~r~An argument is missing")
		return
	end

	if args[1] ~= "on" or "off" then
		ESX.ShowNotification("~r~Argument is incorrect or invalid")
		return
	end

	if playerGroup ~= "user" then
		if args[1] == "on" then
			TriggerClientEvent('fine:delgunOn', _src)
		end

		if args[1] == "off" then
			TriggerClientEvent('fine:delgunOff', _src)
		end
	else
		CancelEvent()
	end
end)
