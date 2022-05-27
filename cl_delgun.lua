local toggle = false

RegisterNetEvent('fine:delgunOn')
AddEventHandler('fine:delgunOn', function()
	toggle = true
	showNotification("~g~Vehicle Delete Gun Enabled!")
end)

RegisterNetEvent('fine:delgunOff')
AddEventHandler('fine:delgunOff', function()
	toggle = false
	showNotification("~r~Vehicle Delete Gun Disabled!")
end)

-- asynchrone function

Citizen.CreateThread(function()
	local playerPed = GetPlayerPed()
	local delgun = "weapon_snspistol_mk2"
	
	while true do
		Citizen.Wait(0)
		if toggle then
			giveDelgun(playerPed)
			if IsPlayerFreeAiming(playerPed) then
				local entity = getEntity(PlayerId())
				local vehicle = GetVehicleIndexFromEntityIndex(entity)
				if IsPedShooting(playerPed) then
					SetEntityAsMissionEntity(entity, true, true)
					DeleteEntity(entity)
					DeleteVehicle(vehicle)
				end
			end
		else
			removeDelgun()
		end
	end
end)

-- functions

function giveWeapon(hashKey) -- give weapon
    GiveWeaponToPed(GetPlayerPed(), GetHashKey(hash), 250, false, false)
end

function weaponComponent(weaponHash, component) -- give component
    if HasPedGotWeapon(GetPlayerPed(), GetHashKey(weaponHash), false) then
        GiveWeaponComponent(GetPlayerPed(), GetHashKey(weaponHash), GetHashKey(component))
    end
end

function giveDelgun() -- give delgun to ped
	giveWeapon(delgun)
        weaponComponent(delgun, "COMPONENT_SNS_PISTOL_MK2_CAMO_IND_01_SLIDE")
        weaponComponent(delgun, "COMPONENT_AT_PI_SUPP_02")
        weaponComponent(delgun, "COMPONENT_SNSPISTOL_MK2_CLIP_02")
        weaponComponent(delgun, "COMPONENT_AT_PI_RAIL_02")
        weaponComponent(delgun, "COMPONENT_AT_PI_FLSH_03")
	SetPedInfiniteAmmo(playerPed, true, delgun)
end

function removeDelgun() -- remove delgun from ped
	SetPedInfiniteAmmo(playerPed, false, delgun)
	RemoveWeaponFromPed(playerPed, delgun)
end

function getEntity(player) -- get if player is free aiming
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

function showNotification(text) -- notification
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end
