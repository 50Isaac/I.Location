ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('Location:Blista')
AddEventHandler('Location:Blista', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    xPlayer.removeMoney(500)
end)

RegisterNetEvent('Location:Panto')
AddEventHandler('Location:Panto', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 250
    xPlayer.removeMoney(250)
end)

RegisterNetEvent('Location:Sanchez')
AddEventHandler('Location:Sanchez', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 500
    xPlayer.removeMoney(500)
end)

RegisterNetEvent('Location:Fagio3')
AddEventHandler('Location:Fagio3', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 250
    xPlayer.removeMoney(250)
end)

RegisterNetEvent('Location:Scorcher')
AddEventHandler('Location:Scorcher', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    xPlayer.removeMoney(50)
end)

RegisterNetEvent('Location:Bmx')
AddEventHandler('Location:Bmx', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    xPlayer.removeMoney(50)
end)