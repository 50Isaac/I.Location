ESX = nil

RegisterCommand("co", function(source, args, rawcommand)
    local pos = GetEntityCoords(PlayerPedId())
    print(pos.x..","..pos.y..","..pos.z)
end, false)

Citizen.CreateThread(function()
    while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(5000)
    end
end)


local IsaacMenu = {
    Base = {Header = {"commonmenu", "interaction_bgd"}, Title = "Location", Color = {color_black}, HeaderColor = {255, 255, 255}}, 
    Data = {currentMenu = "Vendeur :"}, 
    Events = {
        onSelected = function(self, _, btn, JMenu, menuData, currentButton, currentSlt, result)
            if btn.name == "~r~Fermer le menu" then
                ESX.ShowNotification('~r~Vous avez férmé le menu')
                CloseMenu()

            elseif btn.name == "Faggio" then
                    TriggerServerEvent('Location:Faggio3')
                    ESX.ShowNotification('Vous avez payez ~r~250$')
                    Citizen.Wait(1)
                    spawnCar("faggio3")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Scooter ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
                elseif btn.name == "Blista" then
                    TriggerServerEvent('Location:Blista')
                    ESX.ShowNotification('Vous avez payez ~r~500$')
                    Citizen.Wait(1)
                    spawnCar("blista")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Blista ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
                elseif btn.name == "Panto" then
                    TriggerServerEvent('Location:Panto')
                    ESX.ShowNotification('Vous avez payez ~r~250$')
                    Citizen.Wait(1)
                    spawnCar("panto")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Panto ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
                elseif btn.name == "Sanchez" then
                    TriggerServerEvent('Location:Sanchez')
                    ESX.ShowNotification('Vous avez payez ~r~250$')
                    Citizen.Wait(1)
                    spawnCar("sanchez")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Sanchez ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
                elseif btn.name == "Scorcher" then
                    TriggerServerEvent('Location:Scorcher')
                    ESX.ShowNotification('Vous avez payez ~r~50$')
                    Citizen.Wait(1)
                    spawnCar("scorcher")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Scorcher ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
                elseif btn.name == "Bmx" then
                    TriggerServerEvent('Location:Bmx')
                    ESX.ShowNotification('Vous avez payez ~r~50$')
                    Citizen.Wait(1)
                    spawnCar("bmx")
                    ESX.ShowAdvancedNotification("Location", "Votre ~b~Bmx ~w~à été livré avec ~g~succés ~w~!", "", "CHAR_ARTHUR", 1)
                    ESX.ShowAdvancedNotification("Location", "Bonne route !", "", "CHAR_ARTHUR", 1)
                    CloseMenu(true)
        end
    end
        
    },
    
    Menu = {
        ["Vendeur :"] = {
            b = {
                {name = "Voiture", ask = ">>", askX = true},
                {name = "Moto", ask = ">>", askX = true},
                {name = "Vélo", ask = ">>", askX = true},
                {name = "~r~Fermer le menu", ask = ">>", askX = true},
            }
        },
        ["voiture"] = {
            b = {
                {name = "Blista", ask = "~g~500$", askX = true},
                {name = "Panto", ask = "~g~250$", askX = true},
            }
        },
        ["moto"] = {
            b = {
                {name = "Sanchez", ask = "~g~500$", askX = true},
                {name = "Faggio", ask = "~g~250$", askX = true},
            }
        },
        ["vélo"] = {
            b = {
                {name = "Scorcher", ask = "~g~50$", askX = true},
                {name = "Bmx", ask = "~g~50$", askX = true},
            }
        },
    }
}

function spawnCar(car)
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(50)
    end

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), false))
	local vehicle = CreateVehicle(car, -505.62, -259.17, 35.51, 290.0, true, false)
  
    
    SetEntityAsNoLongerNeeded(vehicle)
	SetModelAsNoLongerNeeded(vehicleName) 

	SetVehicleNumberPlateText(vehicle, "Location")
        
end

local pos = { 
    {x = -508.85,   y = -255.07,  z = 35.83}, ----- LA POS DU MENU
    }
    Citizen.CreateThread(function()
      while true do
          Citizen.Wait(0)
          for k in pairs(pos) do
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pos[k].x, pos[k].y, pos[k].z)
              if dist <= 10.0 then
                --DrawMarker(6, -508.85, -255.07, 35.83-0.98, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 255, 255, 100) ----- LA POSE DU MARKER (POINT)
            else
                 Citizen.Wait(500)
          end 
              if dist <= 1.0 then
                  ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder ~g~parlé au vendeur.") ------------ La Notification 
           if IsControlJustPressed(1,51)  then        -------------- LA TOUCHE DU MENU
                      CreateMenu(IsaacMenu) 
          end
              end
          end
      end  
    end)

    Citizen.CreateThread(function()
        local hash = GetHashKey("cs_andreas")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "cs_andreas", -508.85, -255.07, 35.83-1.20, -340.0, true, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
    end)
    
    local v1 = vector3(-508.85, -255.07, 35.83-0.00)
    
    function Draw3DText(x, y, z, text)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        local p = GetGameplayCamCoords()
        local distance = GetDistanceBetweenCoords(p.x, p.y, p.z, x, y, z, 1)
        local scale = (1 / distance) * 2
        local fov = (1 / GetGameplayCamFov()) * 100
        local scale = scale * fov
        if onScreen then
            SetTextScale(0.0, 0.35)
            SetTextFont(0)
            SetTextProportional(1)
            SetTextColour(255, 255, 255, 255)
            SetTextDropshadow(0, 0, 0, 0, 255)
            SetTextEdge(2, 0, 0, 0, 150)
            SetTextDropShadow()
            SetTextOutline()
            SetTextEntry("STRING")
            SetTextCentre(1)
            AddTextComponentString(text)
            DrawText(_x,_y)
        end
    end
    
    local distance = 20
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if Vdist2(GetEntityCoords(PlayerPedId(), false), v1) < distance then
                Draw3DText(v1.x,v1.y,v1.z, "Location de vehicule")
            end
        end
    end)