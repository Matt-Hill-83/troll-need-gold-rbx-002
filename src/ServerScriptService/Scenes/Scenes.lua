local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local Buttons = require(Sss.Source.Buttons.Buttons)
local Location = require(Sss.Source.Location.Location)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
getStartPosition = function(props)
    local parent = props.parent
    local child = props.child
    local gridPadding = props.gridPadding

    local childSize = child.Size
    local desiredOffsetFromParentEdge = Vector3.new(-gridPadding / 2, 0,
                                                    -gridPadding / 2)
    -- local desiredOffsetFromParentEdge = Vector3.new(-4, 0, -4)

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
    local questConfig = props.questConfig
    local gridPadding = props.gridPadding
    local questFolder = props.questFolder

    -- 

    local sceneTemplateModel = Utils.getFirstDescendantByName(questFolder,
                                                              "SceneTemplate")
    local wallTemplate =
        Utils.getFirstDescendantByName(questFolder, "SceneBase")
    print('sceneTemplateModel' .. ' - start');
    print(sceneTemplateModel);
    print('sceneTemplateModel' .. ' - end');

    -- local sceneTemplateModel = Utils.getFromTemplates("SceneTemplate")
    -- local wallTemplate = Utils.getFromTemplates("SceneBase")

    local startPosition = getStartPosition(
                              {
            gridPadding = gridPadding,
            parent = parent,
            child = wallTemplate
        })

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
                -- position = CFrame.new(newPosition + startPosition) *
                --     CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0),

                position = CFrame.new(newPosition + startPosition),
                suffix = "Clone--" .. i
            })
        clonedScene.Name = clonedScene.Name .. i

        Utils.unAttachAllChildParts(clonedScene)
        local weld = Instance.new("WeldConstraint")
        weld.Parent = workspace
        weld.Part0 = parent
        weld.Part1 = clonedScene.PrimaryPart
        weld.Name = 'zzz-scene weld'
        print('clonedScene.Name' .. ' - start');
        print(clonedScene.Name);
        print('clonedScene.Name' .. ' - end');

        print('questFolder' .. ' - start');
        print(questFolder);
        print('questFolder' .. ' - end');
        local sceneFolder = Utils.getOrCreateFolder(
                                {
                name = clonedScene.Name .. i,
                parent = questFolder
            })
        -- clonedScene.Parent = parent
        -- clonedScene.Parent = questFolder
        clonedScene.Parent = sceneFolder

        Bridges.destroyBridges({
            sceneConfig = sceneConfig,
            clonedScene = clonedScene
        })

        local frameConfig = sceneConfig.frames[pageNum]
        local charProps = {
            frameConfig = frameConfig,
            clonedScene = clonedScene,
            sceneFolder = sceneFolder
        }

        Characters.addCharactersToScene(charProps)
        Location.addLocation({scene = clonedScene, sceneConfig = sceneConfig})

        local gameTitleLabel = Utils.getFirstDescendantByName(clonedScene,
                                                              "GameTitleLabel")
        gameTitleLabel.Text = "Quest:   " ..
                                  (questConfig.questTitle or 'Game Title')

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

        local props2 = {
            updateButtonActiveStatus = updateButtonActiveStatus,
            clonedScene = clonedScene,
            numPages = numPages,
            sceneConfig = sceneConfig,
            sceneFolder = sceneFolder
        }
        Buttons.doFrameStuff(props2)

    end
end

return module
