local Sss = game:GetService("ServerScriptService")
local CS = game:GetService("CollectionService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
function configPlayers()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0

    local function onCharacterAdded(character)
        character:WaitForChild("Humanoid").WalkSpeed = 50
    end

    local function onPlayerAdded(player)
        player.CharacterAdded:Connect(onCharacterAdded)
    end

    Players.PlayerAdded:Connect(onPlayerAdded)
end

function setVisibility()
    local taggedPartsDestroy = CS:GetTagged("Destroy")
    for i, item in ipairs(taggedPartsDestroy) do item:Destroy() end

    local taggedPartsTransparent = CS:GetTagged("Transparent")
    for i, item in ipairs(taggedPartsTransparent) do item.Transparency = 1 end

    local canCollideOff = CS:GetTagged("CanCollideOff")
    for i, item in ipairs(canCollideOff) do item.CanCollide = false end

    local tagBaseWallTransparent = CS:GetTagged("BaseWallTransparent")
    Utils.setWallHeightByList({items = tagBaseWallTransparent, height = 16})

    for i, wall in ipairs(tagBaseWallTransparent) do
        local newWall = wall:Clone()
        newWall.Parent = wall.Parent
        newWall.Size = newWall.Size + Vector3.new(0, 3 - newWall.Size.Y, 0)
        newWall.Position = newWall.Position +
                               Vector3.new(0,
                                           -(wall.Size.Y - newWall.Size.Y) / 2,
                                           0)
        newWall.Transparency = 0
        newWall.CanCollide = false
        newWall.Anchored = true
        CS:RemoveTag(newWall, "BaseWallTransparent")

    end

    Utils.setPropsByTag({
        tag = "BaseWallTransparent",
        -- props = {Transparency = 0.6}
        props = {Transparency = 1}
    })

    local skyBoxWalls = CS:GetTagged("SkyBoxWalls")
    Utils.setWallHeightByList({items = skyBoxWalls, height = 30})
    Utils.setPropsByTag({tag = "SkyBoxWalls", props = {Transparency = 0.9}})

end

function module.configGame()
    setVisibility()
    configPlayers()
    -- Utils.reportPlayerLocation()

    if (Constants.isDev) then
        local taggedPartsDestroy = CS:GetTagged("DestroyDev")
        for i, item in ipairs(taggedPartsDestroy) do item:Destroy() end
    end
end

return module
