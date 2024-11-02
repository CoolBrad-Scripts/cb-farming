QBCore = exports['qb-core']:GetCoreObject()
local blipsCreated = {}
local spawnedCows = {}

for treeType, treeData in pairs(Config.Trees) do
    if Config.ShowAllBlips then
        -- Show a blip for every tree coordinate
        for i, tree in ipairs(treeData.coords) do
            local point = lib.points.new({
                coords = tree.coords,
                distance = 2,
            })

            local blip = AddBlipForCoord(tree.coords.x, tree.coords.y, tree.coords.z)
            SetBlipSprite(blip, treeData.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, treeData.blip.scale)
            SetBlipColour(blip, treeData.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(treeData.blip.label)
            EndTextCommandSetBlipName(blip)

            function point:nearby()
                lib.showTextUI(tree.label)
                if IsControlJustReleased(0, 38) then
                    if lib.progressBar({
                        duration = 10000,
                        label = "Picking...",
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = treeData.anim.dict,
                            clip = treeData.anim.clip,
                            flag = treeData.anim.flag
                        }
                    }) then
                        local location = vector3(tree.coords.x, tree.coords.y, tree.coords.z)
                        local gaveItem = lib.callback.await('cb-farming:server:PickItem', false, treeType, location)
                        if gaveItem then
                            Notify('Farming', 'You picked ' .. GetItemLabel(treeType), 'success')
                        end
                    else
                        Notify('Farming', 'This tree has already been picked!', 'error')
                    end
                end
            end

            function point:onExit()
                lib.hideTextUI()
            end
        end
    else
        -- Show only one blip per tree type
        if not blipsCreated[treeType] then
            local firstTree = treeData.coords[1]

            local blip = AddBlipForCoord(firstTree.coords.x, firstTree.coords.y, firstTree.coords.z)
            SetBlipSprite(blip, treeData.blip.sprite)
            SetBlipDisplay(blip, 4)
            SetBlipScale(blip, treeData.blip.scale)
            SetBlipColour(blip, treeData.blip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(treeData.blip.label)
            EndTextCommandSetBlipName(blip)

            blipsCreated[treeType] = true
        end

        for i, tree in ipairs(treeData.coords) do
            local point = lib.points.new({
                coords = tree.coords,
                distance = 2,
            })

            function point:nearby()
                lib.showTextUI(tree.label)
                if IsControlJustReleased(0, 38) then
                    if lib.progressBar({
                        duration = 10000,
                        label = "Picking...",
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            move = true,
                            car = true,
                            combat = true,
                        },
                        anim = {
                            dict = treeData.anim.dict,
                            clip = treeData.anim.clip,
                            flag = treeData.anim.flag
                        }
                    }) then
                        local location = vector3(tree.coords.x, tree.coords.y, tree.coords.z)
                        local gaveItem = lib.callback.await('cb-farming:server:PickItem', false, treeType, location)
                        if gaveItem then
                            Notify('Farming', 'You picked ' .. GetItemLabel(treeType), 'success')
                        end
                    else
                        Notify('Farming', 'This tree has already been picked!', 'error')
                    end
                end
            end

            function point:onExit()
                lib.hideTextUI()
            end
        end
    end
end

local function spawnCowPed(model, coords, heading, cow)
    local cowPed = CreatePed(5, model, coords.x, coords.y, coords.z, heading, true, true)
    
    if DoesEntityExist(cowPed) then
        table.insert(spawnedCows, cowPed)
        FreezeEntityPosition(cowPed, true)
        SetEntityInvincible(cowPed, true)
        SetBlockingOfNonTemporaryEvents(cowPed, true)
        -- Delay to ensure the ped is fully initialized before performing actions
        Wait(100)
        exports.ox_target:addLocalEntity(cowPed, {
            {
                label = "Milk Cow",
                icon = "fa-solid fa-heart",
                distance = 2,
                onSelect = function()
                    local canMilk = lib.callback.await('cb-farming:server:CanMilkCow', false)
                    if canMilk == "Allowed" then
                        if lib.progressBar({
                            duration = Config.Cows.milkDuration,
                            label = 'Milking Cow',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                            },
                            anim = {
                                dict = 'amb@code_human_cower@female@react_cowering',
                                clip = 'base_back_left'
                            },
                        }) then
                            local gaveItem = lib.callback.await('cb-farming:server:MilkCow', false, cow)
                            if gaveItem then
                                Notify("Farming", "You milked the cow!", "success")
                            end
                        else
                            print('Do stuff when cancelled')
                        end
                    elseif canMilk == "Missing" then
                        Notify("Farming", "You are missing required items!", "error")
                    elseif canMilk == "Cooldown" then
                        Notify("Farming", "This cow has already been milked!", "error")
                    end
                end,
            }
        })
    else
        lib.print.error("Failed to create the cow ped at " .. tostring(coords))
    end
end

lib.callback.register('cb-farming:client:MilkCowsMinigame', function()
    return MilkCowsMinigame()
end)

function SpawnCows()
    local cowModel = `a_c_cow`

    -- Load the model
    RequestModel(cowModel)
    local tries = 0
    while not HasModelLoaded(cowModel) and tries < 10 do
        Wait(500)
        tries = tries + 1
    end

    if HasModelLoaded(cowModel) then
        for _, cowData in ipairs(Config.Cows.spawnCows) do
            local coords = vector3(cowData.coords.x, cowData.coords.y, cowData.coords.z)
            spawnCowPed(cowModel, coords, cowData.coords.w or 0.0, _)
        end
        SetModelAsNoLongerNeeded(cowModel)
    else
        print("[ERROR] Model failed to load after several attempts!")
    end
end

function DeleteCows()
    for _, cowPed in ipairs(spawnedCows) do
        if DoesEntityExist(cowPed) then
            DeleteEntity(cowPed)
        end
    end
    spawnedCows = {}
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SpawnCows()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteCows()
end)