local Sss = game:GetService("ServerScriptService")
local CS = game:GetService("CollectionService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}
function configPlayers()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0

    local function onCharacterAdded(character)
        character:WaitForChild("Humanoid").WalkSpeed = 30
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

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "DockWalls",
    --     -- props = {Transparency = 0.5}
    --     props = {Transparency = 1}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "DockBase",
    --     props = {Transparency = 1}
    -- })

    Utils.setWallHeightbyParentModelName({name = "BridgeWalls", height = 20})
    Utils.setWallHeightbyParentModelName({name = "BaseWalls", height = 20})

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "BridgeWalls",
    --     props = {Transparency = 0.8, CanCollide = true, Anchored = true}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "BaseWalls",
    --     props = {Transparency = 0.6, CanCollide = true, Anchored = true}
    -- })

    -- local tagBaseWallTransparent = CS:GetTagged("BaseWallTransparent")
    -- Utils.setWallHeightByList({items = tagBaseWallTransparent, height = 4})
    -- Utils.setWallHeightByList({items = tagBaseWallTransparent, height = 16})
    -- Utils.setPropsByTag({
    --     tag = "BaseWallTransparent",
    --     -- props = {Transparency = 1}
    --     props = {Transparency = 0.6}
    -- })

    -- local skyBoxWalls = CS:GetTagged("SkyBoxWalls")
    -- Utils.setWallHeightByList({items = skyBoxWalls, height = 30})
    -- Utils.setPropsByTag({
    --     tag = "SkyBoxWalls",
    --     props = {Transparency = 0.9}
    --     -- props = {Transparency = 0.6}
    -- })

end
function module.configGame()
    setVisibility()
    configPlayers()
    -- Utils.reportPlayerLocation()

    if (Constants.isDev) then
        -- local taggedPartsDestroy = CS:GetTagged("DestroyDev")
        -- for i, item in ipairs(taggedPartsDestroy) do item:Destroy() end
    end
end

return module
