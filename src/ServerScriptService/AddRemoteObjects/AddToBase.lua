local module = {}
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)
local Theater = require(Sss.Source.Theater.Theater)

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Scenes = require(Sss.Source.Scenes.Scenes)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)
local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)

function addRemoteObjects()
    ConfigGame.configGame()

    -- Group quests into books that are separate islands
    local questConfigs = SceneConfig.getScenesConfig()

    if (Constants.singleScene) then
        -- slice out a single quest
        questConfigs = {questConfigs[1]}
        local sceneConfigs = questConfigs[1].sceneConfigs
        questConfigs[1].sceneConfigs = {sceneConfigs[1]}
        --  

    end

    local myStuff = workspace:FindFirstChild("MyStuff")

    local questsOrigin = Utils.getFirstDescendantByName(myStuff, "QuestsOrigin")
    local letterTemplate = Utils.getFirstDescendantByName(myStuff,
                                                          "LetterTemplate")

    local letterDefs = {
        A = {char = 'A'},
        B = {char = 'B'},
        C = {char = 'C'},
        D = {char = 'D'},
        E = {char = 'E'},
        F = {char = 'F'},
        G = {char = 'G'},
        H = {char = 'H'},
        I = {char = 'I'},
        J = {char = 'J'},
        K = {char = 'K'},
        L = {char = 'L'},
        M = {char = 'M'},
        N = {char = 'N'},
        O = {char = 'O'},
        P = {char = 'P'},
        Q = {char = 'Q'},
        R = {char = 'R'},
        S = {char = 'S'},
        T = {char = 'T'},
        U = {char = 'U'},
        V = {char = 'V'},
        W = {char = 'W'},
        X = {char = 'X'},
        Y = {char = 'Y'},
        Z = {char = 'Z'}

    }
    -- local letters = {
    --     'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
    --     'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    -- }
    -- local letters = {'A', 'B', 'C'}
    local letters = {'C'}

    for i, char in ipairs(letters) do
        local newLetter = letterTemplate:Clone()
        newLetter.Parent = letterTemplate.Parent
        newLetter.Name = "letter-" .. char

        local letterHandle = Utils.getFirstDescendantByName(newLetter, "Handle")

        letterHandle.CFrame = letterHandle.CFrame +
                                  Vector3.new(0, letterHandle.Size.Y * 1.5, 0)

        local textLabels = Utils.getDescendantsByName(letterHandle, "BlockChar")
        for i, label in ipairs(textLabels) do label.Text = char end

        newLetter.Equipped:Connect(function()
            print('equipped')
            newLetter.Parent = workspace
        end)
    end

    letterTemplate:Destroy()

    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "RunTimeQuests", parent = myStuff})

    local sibling = questsOrigin
    local questBlockTemplate = Utils.getFromTemplates("QuestBox")

    -- add quests
    for questIndex, questConfig in ipairs(questConfigs) do
        local gridSize = questConfig.gridSize
        -- local startSceneCoords = questConfig.startSceneCoords
        -- local endSceneCoords = questConfig.ebdSceneCoords

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

        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs,
            questConfig = questConfig,
            gridPadding = gridPadding,
            questFolder = questFolder,
            questIndex = questIndex
        }
        Scenes.addScenes(addScenesProps)

        sibling = questBlock
    end
    questBlockTemplate:Destroy()

end

module.addRemoteObjects = addRemoteObjects
return module

