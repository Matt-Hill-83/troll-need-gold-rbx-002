local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

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
    local itemsToHideAtRuntine = {'QuestsOrigin', 'TemplatesPedestal'}
    for i, item in ipairs(itemsToHideAtRuntine) do
        Utils.hideItemAndChildrenByName({name = item, hide = true})
    end

    local itemsToMakeTransparentAtRuntine =
        {"UserDectionRegion", "WallTemplate"}
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

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "DockBase",
    --     props = {Transparency = 0.8}
    -- })

    -- Utils.setItemAndChildrenPropsByName({
    --     name = "SkyBoxBack",
    --     props = {Transparency = 1}
    -- })

    Utils.setItemAndChildrenPropsByName({
        name = "BaseWalls",
        props = {Transparency = 0.8, CanCollide = true, Anchored = true}
    })

    Utils.setItemAndChildrenPropsByName({
        name = "BridgeWalls",
        props = {Transparency = 0.8, CanCollide = true, Anchored = true}
    })

end
function module.configGame()
    setVisibility()
    configPlayers()
    -- Utils.reportPlayerLocation()
end

return module
