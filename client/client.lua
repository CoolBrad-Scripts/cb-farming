QBCore = exports['qb-core']:GetCoreObject()
local blipsCreated = {}

for treeType, treeData in pairs(Config.Trees) do
    if Config.ShowAllBlips then
        -- Show a blip for every tree coordinate
        for i, tree in ipairs(treeData.coords) do
            local point = lib.points.new({
                coords = tree.coords,
                distance = 2,
                dunak = 'nerd',
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
                        local gaveItem = lib.callback.await('cb-farming:server:PickItem', false, treeType, i)
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
                dunak = 'nerd',
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
                        local gaveItem = lib.callback.await('cb-farming:server:PickItem', false, treeType, i)
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