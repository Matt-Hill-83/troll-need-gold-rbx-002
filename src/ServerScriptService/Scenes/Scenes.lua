local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.Utils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
getStartPosition = function(parent, child)
    local childSize = child.Size
    -- local desiredOffsetFromParentEdge = -childSize / 2
    -- local desiredOffsetFromParentEdge = Vector3.new(0, 0, 0)
    local desiredOffsetFromParentEdge = Vector3.new(-4, 0, -4)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, 1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, 1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    return RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

function getNewPosition(props)
    local coordinates = props.coordinates
    local gapX = Constants.islandLength + Constants.bridgeLength
    local newX = -(gapX + Constants.buffer) * coordinates.col
    local newZ = coordinates.row *
                     (Constants.islandLength + Constants.bridgeLength +
                         Constants.buffer)
    return Vector3.new(newX, 0, -newZ)
end

function module.addScenes(props)
    local parent = props.parent
    local sceneConfigs = props.sceneConfigs

    local sceneTemplateModel = Utils.getFromTemplates("SceneTemplate")
    local wallTemplate = Utils.getFromTemplates("WallTemplate")

    local startPosition = getStartPosition(parent, wallTemplate)

    for i, sceneConfig in ipairs(sceneConfigs) do
        local numPages = #sceneConfig.frames
        local pageNum = 1

        local newPosition = getNewPosition(
                                {
                coordinates = sceneConfig.coordinates,
                template = wallTemplate
            })

        local clonedScene = Utils.cloneModel(
                                {
                model = sceneTemplateModel,
                position = newPosition + startPosition,
                suffix = "-clone--" .. i
            })

        Bridges.destroyBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local newWall = clonedScene.PrimaryPart

        local frameConfig = sceneConfig.frames[pageNum]
        local sceneProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene
        }

        -- Image
        -- Image
        local locationModelImage = Utils.getFromTemplates("LocationModelImage")
        local imageLabelFront = Utils.getFirstDescendantByName(
                                    locationModelImage, 'ImageLabel')
        local imageId = Utils.getDecalIdFromName({name = sceneConfig.name})
        imageLabelFront.Image = 'rbxassetid://' .. imageId

        -- Label
        -- Label
        local locationModelLabel = Utils.getFromTemplates("LocationModelLabel")
        local textLabel = Utils.getFirstDescendantByName(locationModelLabel,
                                                         'TextLabel')
        textLabel.Text = Utils.getDisplayNameFromName({name = sceneConfig.name})

        Characters.addCharactersToScene(sceneProps)

        function incrementPage()
            print('in   crementPage')
            local newPageNum = pageNum + 1
            print('newPageNum' .. ' - start');
            print(newPageNum);
            print('numPages' .. ' - start');
            print(numPages);
            print('numPages' .. ' - end');
            if newPageNum <= numPages then
                pageNum = newPageNum
                print('incrementPage------------------yes')

                local children = newWall:GetChildren()
                -- TODO - fix this
                -- TODO - fix this
                -- TODO - fix this

                for _, item in pairs(children) do
                    local match1 = string.match(item.Name, "Items-")
                    local match2 = string.match(item.Name, "Characters-")
                    local match3 = string.match(item.Name, "Dialog-")
                    if item:IsA('Part') and (match1 or match2 or match3) then
                        item:Destroy()
                    end
                end

                local newFrameConfig = sceneConfig.frames[pageNum]
                local newSceneProps = {
                    frameConfig = newFrameConfig,
                    clonedScene = clonedScene
                }
                Characters.addCharactersToScene(newSceneProps)
            end
        end

        function decrementPage()
            local newPageNum = pageNum - 1
            print('decrementPage')
            print('newPageNum' .. ' - start');
            print(newPageNum);
            if newPageNum > 1 then

                print('decrementPage=----------yes')
                pageNum = newPageNum

                local children = newWall:GetChildren()

                for _, item in pairs(children) do
                    local match1 = string.match(item.Name, "Items-")
                    local match2 = string.match(item.Name, "Characters-")
                    local match3 = string.match(item.Name, "Dialog-")
                    if item:IsA('Part') and (match1 or match2 or match3) then
                        item:Destroy()
                    end
                end

                local newFrameConfig = sceneConfig.frames[pageNum]
                local newSceneProps = {
                    frameConfig = newFrameConfig,
                    clonedScene = clonedScene
                }
                Characters.addCharactersToScene(newSceneProps)
            end
        end

        -- 
        -- 
        local nextPageButtonTemplate = Utils.getFirstDescendantByName(
                                           clonedScene, "NextPageButton")
        local nextButton = Utils.getFirstDescendantByName(
                               nextPageButtonTemplate, "TextButton")
        nextButton.MouseButton1Click:Connect(incrementPage)
        -- 
        -- 
        -- 
        -- 
        local prevPageButtonTemplate = Utils.getFirstDescendantByName(
                                           clonedScene, "PrevPageButton")
        local prevButton = Utils.getFirstDescendantByName(
                               prevPageButtonTemplate, "TextButton")
        prevButton.MouseButton1Click:Connect(decrementPage)
        -- 
        -- 
    end
end

return module
