ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local playerGroup = nil

RegisterCommand("delgun", function(source, args, rawcommand)
	if args[1] == nil then
		ESX.ShowNotification("~r~An argument is missing")
		return
	end

	if args[1] ~= "on" or "off" then
		ESX.ShowNotification("~r~Argument is incorrect or invalid")
		return
	end

	local xPlayer = ESX.GetPlayerFromId(source)
	local playerGroup = xPlayer.getGroup()

	if playerGroup ~= "user" then
		if args[1] == "on" then
			TriggerClientEvent('fine:delgunOn', source)
		end
	else
		if args[1] == "off" then
			TriggerClientEvent('fine:delgunOff', source)
		then
	end
	CancelEvent()
end)
