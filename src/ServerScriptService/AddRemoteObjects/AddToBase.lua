local module = {}
local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Scenes = require(Sss.Source.Scenes.Scenes)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)
local Teleporters = require(Sss.Source.Teleporters.Teleporters)

function addRemoteObjects()
    local questConfigs = SceneConfig.getScenesConfig()

    if (Constants.singleScene) then
        -- slice out a single quest
        questConfigs = {questConfigs[1]}
        local sceneConfigs = questConfigs[1].sceneConfigs
        questConfigs[1].sceneConfigs = {sceneConfigs[1]}
    end

    local myStuff = workspace:FindFirstChild("MyStuff")
    local questsOrigin = Utils.getFirstDescendantByName(myStuff, "QuestsOrigin")

    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    local sibling = questsOrigin
    local questBlockTemplate = Utils.getFromTemplates("QuestBox")

    -- add quests
    for questIndex, questConfig in ipairs(questConfigs) do
        local gridSize = questConfig.gridSize

        local desiredPadding = 12
        local wallWidth = 1
        local wallHeight = Constants.questWallHeight
        local sceneHeight = Constants.sceneHeight

        local wallSize = Vector3.new(wallWidth, wallHeight, wallWidth)
        local gridPadding = desiredPadding + wallWidth * 2

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        --   Stabilize these parts before the cloning begins
        Utils.setPropsByTag({
            tag = "EnableWeldAtRunTime",
            props = {Enabled = true}
        })

        local questBlockTemplateClone = Utils.cloneModel(
                                            {
                model = questBlockTemplate,
                suffix = "Clone-Q" .. questIndex
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
            index = questIndex
        }
        local questBlock = QuestBlock.renderQuestBlock(questBlockProps)

        local skyBoxTeleporter = Teleporters.configSkyboxTeleporter(
                                     {
                questIndex = questIndex,
                questTitle = questConfig.questTitle,
                questFolder = questFolder
            })

        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs,
            questConfig = questConfig,
            gridPadding = gridPadding,
            questFolder = questFolder,
            questIndex = questIndex,
            skyBoxTeleporter = skyBoxTeleporter
        }
        Scenes.addScenes(addScenesProps)

        sibling = questBlock
    end
    questBlockTemplate:Destroy()
    local letterFallTemplate = Utils.getFromTemplates("LetterFallTemplate")
    letterFallTemplate:Destroy()
    local teleporterTemplate = Utils.getFromTemplates("TeleporterTemplate")
    teleporterTemplate:Destroy()

    -- Do this last after everything has been created/deleted
    ConfigGame.configGame()

end

module.addRemoteObjects = addRemoteObjects
return module

