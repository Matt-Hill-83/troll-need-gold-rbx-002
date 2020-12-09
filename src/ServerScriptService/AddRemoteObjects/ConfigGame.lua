local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local collectionService = game:GetService("CollectionService")

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
    local testLabBase = Utils.getFirstDescendantByName(workspace, "TestLabBase")
    testLabBase:Destroy()

    local taggedPartsTransparent = collectionService:GetTagged("Transparent")

    for i, item in ipairs(taggedPartsTransparent) do
        Utils.setItemAndChildrenPropsByInst(
            {
                item = item,
                props = {Transparency = 1, CanCollide = false, Anchored = true}
            })

    end

    local itemsToHideAtRuntine = {'QuestsOrigin', 'TemplatesPedestal'}
    for i, item in ipairs(itemsToHideAtRuntine) do
        Utils.hideItemAndChildrenByName({name = item, hide = true})
    end

    local itemsToMakeTransparentAtRuntine = {"WallTemplate"}
    for i, item in ipairs(itemsToMakeTransparentAtRuntine) do
        Utils.setItemAndChildrenPropsByName(
            {name = item, props = {Transparency = 1}})
    end

    Utils.setItemAndChildrenPropsByName({
        name = "DockWalls",
        props = {Transparency = 1}
    })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "SkyBox",
    --     props = {Transparency = 0.5}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "SkyBoxWalls",
    --     props = {Transparency = 0.8}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "Basement",
    --     props = {Transparency = 1}
    -- })

    Utils.setItemAndChildrenPropsByName({
        name = "DockBase",
        props = {Transparency = 1}
    })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "SkyBoxBack",
    --     props = {Transparency = 1}
    -- })

    Utils.setItemAndChildrenPropsByName({
        name = "BaseWalls",
        -- props = {Transparency = 0.9, CanCollide = false, Anchored = true}
        props = {Transparency = 0.6, CanCollide = true, Anchored = true}
    })

    Utils.setItemAndChildrenPropsByName({
        name = "BridgeWalls",
        props = {Transparency = 0.6, CanCollide = true, Anchored = true}
    })

    Utils.setWallHeightbyParentModelName({name = "BridgeWalls", height = 2})

    Utils.setWallHeightbyParentModelName({name = "BaseWalls", height = 2})

end
function module.configGame()
    setVisibility()
    configPlayers()
    -- Utils.reportPlayerLocation()
end

return module
