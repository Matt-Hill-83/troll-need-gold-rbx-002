local module = {}
local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)
local HttpService = game:GetService("HttpService")

local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Scenes = require(Sss.Source.Scenes.Scenes)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)
local Teleporters = require(Sss.Source.Teleporters.Teleporters)
local MiniGame = require(Sss.Source.MiniGame.MiniGame)

function addRemoteObjects()
    local questConfigs = SceneConfig.getScenesConfig()

    if (Constants.singleScene) then
        -- slice out a single quest
        questConfigs = {questConfigs[1]}
        local sceneConfigs = questConfigs[1].sceneConfigs
        questConfigs[1].sceneConfigs = {sceneConfigs[1]}
    else
        -- slice out the first 6 quests, for the hexagon
        questConfigs = {unpack(questConfigs, 1, 6)}
    end

    local myStuff = workspace:FindFirstChild("MyStuff")
    local questsOrigin = Utils.getFirstDescendantByName(myStuff, "QuestsOrigin")
    local hexMount = Utils.getFirstDescendantByName(myStuff, "HexStand")
    local mountPlates = Utils.getDescendantsByName(hexMount, "MountPlate")

    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    local questBlockTemplate = Utils.getFromTemplates("QuestBox")

    -- add quests
    for questIndex, questConfig in ipairs(questConfigs) do
        local mountPlate = mountPlates[questIndex]
        local gridSize = questConfig.gridSize

        local words = questConfig.words
        local newWords = {}
        if words then
            local output
            words = words .. ','
            for w in words:gmatch("(.-),") do
                table.insert(newWords, w)
            end
        end
        questConfig.words2 = newWords

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

        local skyBoxTeleporter = Teleporters.configSkyboxTeleporter(
                                     {
                questIndex = questIndex,
                questTitle = questConfig.questTitle,
                questFolder = questFolder
            })

        local defaultWords = {'CAT', 'HAT', 'MAT', 'PAT', 'RAT', 'SAT', "CHAT"}
        local words3 = defaultWords
        if #questConfig.words2 > 0 then words3 = questConfig.words2 end

        local miniGame = MiniGame.addMiniGame(
                             {
                parent = mountPlate,
                words = words3,
                sceneIndex = 1,
                questIndex = questIndex,
                isStartScene = true,
                questTitle = questConfig.questTitle
            })
        localTPPositioner = Utils.getFirstDescendantByName(miniGame,
                                                           "MiniGameTeleporterPositioner")
        -- Teleporters.addTeleporters({
        --     parent = miniGame,
        --     sceneIndex = 1,
        --     questIndex = questIndex,
        --     isStartScene = true,
        --     isEndScene = falase,
        --     questTitle = questConfig.questTitle,
        --     skyBoxTeleporter = skyBoxTeleporter,
        --     localTPPositioner = localTPPositioner
        -- })
        -- -- 
        -- 
        -- 
        local questBlockProps = {
            parent = miniGame.PrimaryPart,
            size = Vector3.new(x, 2, z),
            wallSize = wallSize,
            questBlockTemplate = questBlockTemplateClone
        }
        local questBlockModel = QuestBlock.renderQuestBlock(questBlockProps)
        local dockBase = Utils.getFirstDescendantByName(questBlockModel,
                                                        "DockBase")
        local sceneMountPlate = Utils.getFirstDescendantByName(questBlockModel,
                                                               "SceneMountPlate")
        Utils.enableChildWelds({part = sceneMountPlate, enabled = false})

        local translateCFrameProps = {
            parent = dockBase,
            child = sceneMountPlate,
            offsetConfig = {
                useParentNearEdge = Vector3.new(0, 1, -1),
                useChildNearEdge = Vector3.new(0, -1, -1),
                offsetAdder = Vector3.new(0, 0, 0)
            }
        }

        local mountPlateCFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                                     translateCFrameProps)

        sceneMountPlate.CFrame = mountPlateCFrame
        local rotatedCFrame = CFrame.Angles(0, math.rad(180), 0)
        sceneMountPlate.CFrame = sceneMountPlate.CFrame:ToWorldSpace(
                                     rotatedCFrame)

        local addScenesProps = {
            parent = sceneMountPlate,
            sceneConfigs = questConfig.sceneConfigs,
            questConfig = questConfig,
            gridPadding = gridPadding,
            questFolder = questFolder,
            questIndex = questIndex,
            -- mountPlate = mountPlate,
            skyBoxTeleporter = skyBoxTeleporter
        }
        Scenes.addScenes(addScenesProps)
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

