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
    -- reportPlayerLocation()
end

function reportPlayerLocation()
    local Players = game:GetService("Players")
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            while humanoidRootPart do
                print(player.Name, "is at", tostring(humanoidRootPart.Position))
                wait(4)
            end
        end)
    end)
end

function setupUserDetectionRegions()
    local regionsSetup = DetectUser
    local function regionEnter(plr, region)
        print(plr.Name .. " entered " .. region.Name)
    end

    local function regionExit(plr, region)
        print(plr.Name .. " left " .. region.Name)
    end

    local myStuff = workspace:FindFirstChild("MyStuff")
    local myTemplates = myStuff:FindFirstChild("MyTemplates")

    local clones =
        Utils.getDescendantsByNameMatch(myTemplates, "SceneTemplate-")

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
    local sceneLocations = myStuff:FindFirstChild("SceneLocations")

    local sceneOrigins = {}

    local children = sceneLocations:GetChildren()
    for i, item in pairs(children) do
        if item:IsA('Part') then
            sceneOrigins[i] = item
            --
        end
    end

    local gameOrigin = sceneOrigins[1]
    local sibling = gameOrigin

    for i, questConfig in pairs(questConfigs) do
        local gridSize = questConfig.gridSize
        local gridPadding = 0

        local x = gridSize.cols * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength
        local z = gridSize.rows * Constants.totalIslandLength + gridPadding -
                      Constants.bridgeLength

        local questBlockProps = {
            parent = gameOrigin,
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
    setupUserDetectionRegions()
end

module.addRemoteObjects = addRemoteObjects
return module

