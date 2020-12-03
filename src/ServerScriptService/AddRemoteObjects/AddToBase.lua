local module = {}
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Scenes = require(Sss.Source.Scenes.Scenes)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local Constants = require(Sss.Source.Constants.Constants)

function configPlayers()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0

    local function onCharacterAdded(character)
        character:WaitForChild("Humanoid").WalkSpeed = 30
        local currentlyTeleporting = character.currentlyTeleporting
        print('currentlyTeleporting' .. ' - start');
        print(Utils.tableToString({currentlyTeleporting}));
        print('currentlyTeleporting' .. ' - end');
    end

    local function onPlayerAdded(player)
        player.CharacterAdded:Connect(onCharacterAdded)
    end

    Players.PlayerAdded:Connect(onPlayerAdded)
end

function setVisibility()
    local itemsToHideAtRuntine = {'QuestsOrigin', 'TemplatesPedestal'}
    for i, item in ipairs(itemsToHideAtRuntine) do
        Utils.hideItemAndChildrenByName({name = item, hide = true})
    end

    local itemsToMakeTransparentAtRuntine =
        {"UserDectionRegion", "WallTemplate"}
    for i, item in ipairs(itemsToMakeTransparentAtRuntine) do
        Utils.setItemAndChildrenPropsByName(
            {name = item, props = {Transparency = 1}})
    end

    Utils.setItemAndChildrenPropsByName({
        name = "DockWalls",
        props = {Transparency = 1}
    })

    Utils.setItemAndChildrenPropsByName({
        name = "SkyBox",
        props = {Transparency = .8}
    })

    Utils.setItemAndChildrenPropsByName({
        name = "SkyBoxWalls",
        props = {Transparency = 1}
    })

end

function configGame()
    setVisibility()
    configPlayers()
    -- Utils.reportPlayerLocation()
end

function addRemoteObjects()
    configGame()

    local questConfigs = SceneConfig.getScenesConfig()
    local myStuff = workspace:FindFirstChild("MyStuff")

    local questsOrigin = Utils.getFirstDescendantByName(myStuff, "QuestsOrigin")

    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    local sibling = questsOrigin
    local questBlockTemplate = Utils.getFromTemplates("QuestBox")

    for i, questConfig in ipairs(questConfigs) do
        local gridSize = questConfig.gridSize
        local startSceneCoords = questConfig.startSceneCoords
        local endSceneCoords = questConfig.ebdSceneCoords

        local desiredPadding = 1
        local wallWidth = 1
        local wallHeight = 8
        local sceneHeight = 50
        local wallSize = Vector3.new(wallWidth, wallHeight, wallWidth)
        local gridPadding = desiredPadding + wallWidth * 2

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        local questBlockTemplateClone = Utils.cloneModel(
                                            {
                model = questBlockTemplate,
                suffix = "Clone--" .. i
            })

        local questFolder = Utils.getOrCreateFolder(
                                {
                name = questBlockTemplateClone.Name,
                parent = runtimeQuestsFolder
            })
        questBlockTemplateClone.Parent = questFolder

        local questBlockProps = {
            parent = questsOrigin,
            size = Vector3.new(x, 2, z),
            sibling = sibling,
            wallSize = wallSize,
            sceneHeight = sceneHeight,
            questBlockTemplate = questBlockTemplateClone,
            index = i
        }
        local questBlock = QuestBlock.renderQuestBlock(questBlockProps)

        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs,
            questConfig = questConfig,
            gridPadding = gridPadding,
            questFolder = questFolder,
            questIndex = i
        }
        Scenes.addScenes(addScenesProps)

        sibling = questBlock
    end
    questBlockTemplate:Destroy()

end

module.addRemoteObjects = addRemoteObjects
return module

