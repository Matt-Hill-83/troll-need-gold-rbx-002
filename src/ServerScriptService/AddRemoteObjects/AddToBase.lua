local module = {}
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local DetectUser = require(Sss.Source.Utils.DetectUser)
local Scenes = require(Sss.Source.Scenes.Scenes)
local QuestBlock = require(Sss.Source.AddRemoteObjects.QuestBlock)

local Constants = require(Sss.Source.Constants.Constants)

function configGame()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0
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

    for i, questConfig in pairs(questConfigs) do
        local gridSize = questConfig.gridSize

        local desiredPadding = 18
        local wallWidth = 1
        local wallHeight = 16
        local sceneHeight = 40
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
            questFolder = questFolder
        }
        local scenes = Scenes.addScenes(addScenesProps)

        local function hideWall(clonedScene)

            local dialog = Utils.getFirstDescendantByName(clonedScene,
                                                          "WallTemplate")
            print('dialog' .. ' - start');
            print(Utils.tableToString({dialog.Position}));
            print('dialog' .. ' - end');

            dialog.Anchored = false
            dialog.Position = dialog.Position + Vector3.new(-20, 200, 0)
            dialog.Anchored = true

            print('dialog' .. ' - start');
            print(Utils.tableToString({dialog.Position}));
            print('dialog' .. ' - end');
            print('');
        end

        for i, scene in ipairs(scenes) do
            hideWall(scene)
            -- 
        end

        -- local questCFrame = questBlock.CFrame
        -- questBlock.CFrame = questCFrame *
        --                         CFrame.new(Vector3.new(0, -sceneHeight, 0)) *
        --                         CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
        sibling = questBlock

    end
    -- setupUserDetectionRegions()
    questBlockTemplate:Destroy()
end

module.addRemoteObjects = addRemoteObjects
return module

