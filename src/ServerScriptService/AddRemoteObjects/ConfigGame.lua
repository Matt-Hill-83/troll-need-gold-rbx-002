local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local CS = game:GetService("CollectionService")

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
    -- local testLabBase = Utils.getFirstDescendantByName(workspace, "TestLabBase")
    -- testLabBase:Destroy()

    local taggedPartsDestroy = CS:GetTagged("Destroy")
    for i, item in ipairs(taggedPartsDestroy) do item:Destroy() end

    local taggedPartsTransparent = CS:GetTagged("Transparent")
    for i, item in ipairs(taggedPartsTransparent) do item.Transparency = 1 end

    Utils.setPropsByTag({tag = "EnableWeldAtRunTime", props = {Enabled = true}})

    -- local itemsToHideAtRuntine = {'QuestsOrigin', 'TerrainBase'}
    -- for i, item in ipairs(itemsToHideAtRuntine) do
    --     Utils.hideItemAndChildrenByName({name = item, hide = true})
    -- end

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "DockWalls",
    --     -- props = {Transparency = 0.5}
    --     props = {Transparency = 1}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "DockBase",
    --     props = {Transparency = 1}
    -- })

    -- Utils.setWallHeightbyParentModelName({name = "BridgeWalls", height = 2})
    -- Utils.setItemAndChildrenPropsByName({
    --     name = "BridgeWalls",
    --     props = {Transparency = 0.6, CanCollide = true, Anchored = true}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "BaseWalls",
    --     props = {Transparency = 0.6, CanCollide = true, Anchored = true}
    -- })

    -- Utils.setWallHeightbyParentModelName({name = "BaseWalls", height = 2})

    -- local tagBaseWallTransparent = CS:GetTagged("BaseWallTransparent")
    -- Utils.setWallHeightByList({items = tagBaseWallTransparent, height = 4})
    -- -- Utils.setWallHeightByList({items = tagBaseWallTransparent, height = 16})
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
end

return module
