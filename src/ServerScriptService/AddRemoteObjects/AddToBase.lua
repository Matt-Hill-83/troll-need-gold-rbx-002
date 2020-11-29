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

function setupUserDetectionRegions()
    local regionsSetup = DetectUser
    local function regionEnter(plr, region)
        print(plr.Name .. " entered " .. region.Name)

    end

    local function regionExit(plr, region)
        print(plr.Name .. " left " .. region.Name)
        local dialog = Utils.getFirstDescendantByName(region, "WallTemplate")
        dialog.Position = dialog.Position + Vector3.new(0, 200, 0)
    end

    local myStuff = workspace:FindFirstChild("MyStuff")
    local myTemplates = myStuff:FindFirstChild("MyTemplates")

    local clones = Utils.getDescendantsByNameMatch(myTemplates,
                                                   "SceneTemplateClone")

    for i = 1, #clones do
        local scene = clones[i]
        local region =
            Utils.getFirstDescendantByName(scene, "UserDectionRegion")
        region.Name = region.Name .. "-" .. i
    end

    local places = Utils.getDescendantsByNameMatch(myTemplates,
                                                   "UserDectionRegion")

    regionsSetup(places, regionEnter, regionExit)
end

function addRemoteObjects()
    configGame()

    local questConfigs = SceneConfig.getScenesConfig()
    local myStuff = workspace:FindFirstChild("MyStuff")

    local questsOrigin = Utils.getFirstDescendantByName(myStuff, "QuestsOrigin")

    function getOrCreateFolder(props)
        local name = props.name
        local parent = props.parent

        local runtimeQuestsFolder = Utils.getFirstDescendantByName(parent, name)
        print('runtimeQuestsFolder' .. ' - start');
        print(runtimeQuestsFolder);
        print('runtimeQuestsFolder' .. ' - end');

        if not runtimeQuestsFolder then
            runtimeQuestsFolder = Instance.new("Folder", parent)
            runtimeQuestsFolder.Name = name

            runtimeQuestsFolder = Utils.getFirstDescendantByName(parent, name)
            print('runtimeQuestsFolder' .. ' - start');
            print(runtimeQuestsFolder);
            print('runtimeQuestsFolder' .. ' - end');
        end
    end

    local folderProps = {name = "RuntimeQuests", parent = myStuff}

    local folder = getOrCreateFolder(folderProps)

    local sibling = questsOrigin
    local questBlockTemplate = Utils.getFromTemplates("Dock")

    for i, questConfig in pairs(questConfigs) do
        local gridSize = questConfig.gridSize

        local desiredPadding = 8
        local wallWidth = 8
        local wallHeight = 16
        local wallSize = Vector3.new(wallWidth, wallHeight, wallWidth)
        local gridPadding = desiredPadding + wallWidth * 2

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        local questBlockTemplateClone = Utils.cloneModel(
                                            {
                model = questBlockTemplate,
                -- position = questBlockTemplate.PrimaryPart.CFrame,
                suffix = "Clone--" .. i
            })

        local questBlockProps = {
            parent = questsOrigin,
            size = Vector3.new(x, 2, z),
            sibling = sibling,
            wallSize = wallSize,
            questBlockTemplate = questBlockTemplateClone,
            isFirst = i == 1
        }
        local questBlock = QuestBlock.renderQuestBlock(questBlockProps)

        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs,
            questConfig = questConfig,
            gridPadding = gridPadding
        }
        Scenes.addScenes(addScenesProps)
        sibling = questBlock

    end
    setupUserDetectionRegions()
end

module.addRemoteObjects = addRemoteObjects
return module

