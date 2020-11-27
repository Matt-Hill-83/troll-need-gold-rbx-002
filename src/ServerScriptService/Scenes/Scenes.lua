local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
getStartPosition = function(parent, child)
    local childSize = child.Size
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
    local wallTemplate = Utils.getFromTemplates("SceneBase")

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
                suffix = "Clone--" .. i
            })

        Bridges.destroyBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local frameConfig = sceneConfig.frames[pageNum]
        local sceneProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene
        }

        Characters.addCharactersToScene(sceneProps)

        Location.addLocation({scene = clonedScene, sceneConfig = sceneConfig})

        function updateButtonActiveStatus(props)
            print('updateButtonActiveStatus===============================')
            local clonedScene2 = props.clonedScene
            local pageNum2 = props.pageNum
            local numPages2 = props.numPages

            local nextButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "NextPageButton")
            nextButton.Active = pageNum2 < numPages2
            nextButton.Text = nextButton.Active and
                                  Constants.buttonLabels.NextPage or "---"

            local prevButton = Utils.getFirstDescendantByName(clonedScene2,
                                                              "PrevPageButton")
            prevButton.Active = pageNum2 > 1
            prevButton.Text = prevButton.Active and
                                  Constants.buttonLabels.PrevPage or "---"

            local pageNumLabel = Utils.getFirstDescendantByName(clonedScene2,
                                                                "PageNumLabel")

            pageNumLabel.Text = "<b>" .. "Page: " .. "</b>" .. pageNum2 ..
                                    " of " .. numPages2

        end

        updateButtonActiveStatus({
            pageNum = pageNum,
            clonedScene = clonedScene,
            numPages = numPages
        })

        function updateFrameItems(props)

            print('updateFrameItems' .. ' - start');
            print(updateFrameItems);
            print('updateFrameItems' .. ' - end');
            local pageNum2 = props.pageNum
            local clonedScene2 = props.clonedScene
            local numPages2 = props.numPages
            local sceneConfig2 = props.sceneConfig
            print('numPages2' .. ' - start');
            print(numPages2);
            print('numPages2' .. ' - end');
            print('pageNum2' .. ' - start');
            print(pageNum2);
            print('pageNum2' .. ' - end');
            local buttonPressed = false
            if not buttonPressed then
                buttonPressed = true
                updateButtonActiveStatus(
                    {
                        pageNum = pageNum2,
                        clonedScene = clonedScene2,
                        numPages = numPages2
                    })

                local newFrameConfig = sceneConfig2.frames[pageNum2]
                local newSceneProps = {
                    frameConfig = newFrameConfig,
                    clonedScene = clonedScene2
                }
                Characters.addCharactersToScene(newSceneProps)
                buttonPressed = false
            end
        end

        function incrementPage(props)

            local pageNum1 = props.pageNum
            local clonedScene1 = props.clonedScene
            local numPages1 = props.numPages
            local sceneConfig1 = props.sceneConfig
            local index = props.i
            print('index' .. ' - start');
            print(index);
            print('index' .. ' - end');

            print('clonedScene1' .. ' - start');
            print(clonedScene1);
            print('clonedScene1' .. ' - end');
            print('numPages1' .. ' - start');
            print(numPages1);
            print('numPages1' .. ' - end');

            if pageNum < numPages1 then
                pageNum = pageNum + 1
                updateFrameItems({
                    pageNum = pageNum,
                    clonedScene = clonedScene1,
                    numPages = numPages1,
                    sceneConfig = sceneConfig1
                })
            end
        end

        function decrementPage()
            if pageNum > 1 then
                pageNum = pageNum - 1
                updateFrameItems({
                    pageNum = pageNum,
                    clonedScene = clonedScene,
                    numPages = numPages
                })
            end
        end

        local function onIncrementPage()
            incrementPage({
                i = i,
                pageNum = pageNum,
                clonedScene = clonedScene,
                numPages = numPages,
                sceneConfig = sceneConfig
            })
        end

        -- textButton.MouseButton1Click:Connect(onActivated)

        local nextButton = Utils.getFirstDescendantByName(clonedScene,
                                                          "NextPageButton")
        nextButton.MouseButton1Click:Connect(onIncrementPage)

        local prevButton = Utils.getFirstDescendantByName(clonedScene,
                                                          "PrevPageButton")
        prevButton.MouseButton1Click:Connect(decrementPage)

    end
end

return module
