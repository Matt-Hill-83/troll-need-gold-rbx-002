local module = {}
local Sss = game:GetService("ServerScriptService")
local SceneConfig = require(Sss.Source.QuestConfigs.ScenesConfig)

local Utils = require(Sss.Source.Utils.Utils)
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

    local clones =
        Utils.getDescendantsByNameMatch(myTemplates, "SceneTemplate-")

    for i = 1, #clones do
        local scene = clones[i]
        local region =
            Utils.getFirstDescendantByName(scene, "UserDectionRegion")
        -- local part = Utils.getFirstDescendantByName(region, "UserDectionRegion")
        region.Name = region.Name .. "-" .. i
        -- part.Name = part.Name .. "-" .. i
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
    local sibling = questsOrigin

    for i, questConfig in pairs(questConfigs) do
        local gridSize = questConfig.gridSize
        local gridPadding = 0
        -- local gridPadding = 12

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        local questBlockProps = {
            parent = questsOrigin,
            size = Vector3.new(x, 2, z),
            sibling = sibling,
            isFirst = i == 1
        }

        local questBlock = QuestBlock.renderQuestBlock(questBlockProps)
        -- questBlock.Transparency = 1
        local addScenesProps = {
            parent = questBlock,
            sceneConfigs = questConfig.sceneConfigs
        }
        Scenes.addScenes(addScenesProps)
        sibling = questBlock

    end
    -- setupUserDetectionRegions()
end

module.addRemoteObjects = addRemoteObjects
return module

