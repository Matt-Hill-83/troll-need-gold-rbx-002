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

    local myStuff = workspace:FindFirstChild("MyStuff")
    -- local worlds = {questConfigs}
    local worlds = {questConfigs, questConfigs}
    -- local worlds = {questConfigs, questConfigs, questConfigs}

    for worldIndex, questConfig in ipairs(worlds) do
        local worldProps = {
            questConfigs = questConfigs,
            worldIndex = worldIndex
        }

        local teleporterTemplate = Utils.getFromTemplates("TeleporterTemplate")

        addWorld(worldProps)
        -- 
    end

    local questBlockTemplate = Utils.getFromTemplates("QuestBox")
    questBlockTemplate:Destroy()
    local letterFallTemplate = Utils.getFromTemplates("LetterFallTemplate")
    letterFallTemplate:Destroy()
    local teleporterTemplate = Utils.getFromTemplates("TeleporterTemplate")
    teleporterTemplate:Destroy()
    local hexStandTemplate = Utils.getFromTemplates("HexStandTemplate")
    hexStandTemplate:Destroy()

    -- Do this last after everything has been created/deleted
    ConfigGame.configGame()

end

function cloneHexStand(worldIndex)
    local myStuff = workspace:FindFirstChild("MyStuff")
    local hexStandTemplate = Utils.getFromTemplates("HexStandTemplate")
    local hexStandPositioners = Utils.getDescendantsByName(myStuff,
                                                           "HexStandPositioner")
    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    local hexStandPositioner = hexStandPositioners[worldIndex]
    hexStand = hexStandTemplate:Clone()
    hexStand.Parent = myStuff

    hexStand.Name = hexStand.Name .. "-Clone-zzzz"
    local hexMountPart = hexStand.PrimaryPart

    local translateCFrameProps = {
        parent = hexStandPositioner,
        child = hexMountPart,
        offsetConfig = {
            useParentNearEdge = Vector3.new(0, -1, 0),
            useChildNearEdge = Vector3.new(0, -1, 0)
        }
    }

    hexMountPart.CFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                              translateCFrameProps)
    hexMountPart.Anchored = true
    return hexStand
end

function addHexTeleporter(hexStand, worldIndex)

    local hexTeleporter = Teleporters.configHexTeleporter(
                              {
            worldIndex = 0,
            questTitle = "All Quests",
            parentFolder = hexStand
        })
    hexTeleporter.PrimaryPart.Anchored = true
    return hexTeleporter
end

function sliceQuestConfigs(questConfigs)
    if (Constants.singleScene) then
        -- slice out a single quest
        questConfigs = {questConfigs[1]}
        local sceneConfigs = questConfigs[1].sceneConfigs
        questConfigs[1].sceneConfigs = {sceneConfigs[1]}
    else
        -- slice out the first 6 quests, for the hexagon
        questConfigs = {unpack(questConfigs, 1, 6)}
    end
    return questConfigs
end

function addWorld(props)
    local questConfigs = props.questConfigs
    local worldIndex = props.worldIndex

    local myStuff = workspace:FindFirstChild("MyStuff")
    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    sliceQuestConfigs(questConfigs)
    local hexStand = cloneHexStand(worldIndex)
    local hexTeleporter = addHexTeleporter(hexStand, worldIndex)

    -- hexTeleporter.PrimaryPart.Anchored = true
    -- local weld = Instance.new("WeldConstraint")
    -- weld.Name = "WeldConstraint-ppp" .. worldIndex
    -- weld.Parent = hexStand
    -- weld.Part0 = hexTeleporter.PrimaryPart
    -- weld.Part1 = hexMountPart

    local mountPlates = Utils.getDescendantsByName(hexStand, "MountPlate")
    local questBlockTemplate = Utils.getFromTemplates("QuestBox")
    -- add quests
    for questIndex, questConfig in ipairs(questConfigs) do
        local miniGameMountPlate = mountPlates[questIndex]
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

        local gridPadding = desiredPadding + wallWidth * 2

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        -- local questBlockTemplateClone = Utils.cloneModel(
        --                                     {
        --         model = questBlockTemplate,
        --         suffix = "Clone-Q" .. questIndex
        --     })

        -- local questFolder = Utils.getOrCreateFolder(
        --                         {
        --         name = questBlockTemplateClone.Name,
        --         parent = runtimeQuestsFolder
        --     })
        -- questBlockTemplateClone.Parent = questFolder

        -- local defaultWords = {'CAT', 'HAT', 'MAT', 'PAT', 'RAT', 'SAT', "CHAT"}
        -- local words3 = defaultWords
        -- if #questConfig.words2 > 0 then words3 = questConfig.words2 end

        -- local miniGame = MiniGame.addMiniGame(
        --                      {
        --         parent = miniGameMountPlate,
        --         words = words3,
        --         sceneIndex = 1,
        --         questIndex = questIndex,
        --         isStartScene = true,
        --         questTitle = questConfig.questTitle
        --     })
        -- miniGame.PrimaryPart.Anchored = true

        -- localTPPositioner = Utils.getFirstDescendantByName(miniGame,
        --                                                    "MiniGameTeleporterPositioner")

        -- local dockMountPlate = Utils.getFirstDescendantByName(miniGame,
        --                                                       "DockMountPlate")
        -- dockMountPlate:Destroy()

        -- local questBlockProps = {
        --     parent = dockMountPlate,
        --     size = Vector3.new(x, 2, z),
        --     questBlockTemplate = questBlockTemplateClone
        -- }
        -- local questBlockModel = QuestBlock.renderQuestBlock(questBlockProps)
        -- local dockBase = Utils.getFirstDescendantByName(questBlockModel,
        --                                                 "DockBase")
        -- local sceneMountPlate = Utils.getFirstDescendantByName(questBlockModel,
        --                                                        "SceneMountPlate")
        -- Utils.enableChildWelds({part = sceneMountPlate, enabled = false})

        -- local translateCFrameProps = {
        --     parent = dockBase,
        --     child = sceneMountPlate,
        --     offsetConfig = {
        --         useParentNearEdge = Vector3.new(-1, 1, -1),
        --         useChildNearEdge = Vector3.new(-1, -1, -1),
        --         offsetAdder = Vector3.new(0, 0, 0)
        --     }
        -- }

        -- -- Relocate the scene mountplate, after the dock has bee resized.
        -- local sceneMountPlateCFrame = Utils3.setCFrameFromDesiredEdgeOffset(
        --                                   translateCFrameProps)

        -- sceneMountPlate.CFrame = sceneMountPlateCFrame
        -- local rotatedCFrame = CFrame.Angles(0, math.rad(180), 0)
        -- sceneMountPlate.CFrame = sceneMountPlate.CFrame:ToWorldSpace(
        --                              rotatedCFrame)
        -- sceneMountPlate.Anchored = true

        -- local addScenesProps = {
        --     parent = sceneMountPlate,
        --     sceneConfigs = questConfig.sceneConfigs,
        --     questConfig = questConfig,
        --     gridPadding = gridPadding,
        --     questFolder = questFolder,
        --     questIndex = questIndex,
        --     hexTeleporter = hexTeleporter
        -- }
        -- Scenes.addScenes(addScenesProps)
        -- sceneMountPlate:Destroy()
    end

end

module.addRemoteObjects = addRemoteObjects
return module

