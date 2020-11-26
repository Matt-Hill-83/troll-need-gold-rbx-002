local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.Utils)
local Dialog = require(Sss.Source.AddDialog.Dialog)

local module = {}

renderCharacters = function(props)
    local characterTemplate = props.template
    local itemConfigs = props.itemConfigs

    local xGap = 1
    for i, itemConfig in ipairs(itemConfigs) do
        local newItem = characterTemplate:Clone()
        local x = (i - 1) * -(characterTemplate.Size.X + xGap)

        Utils.mergeTables(newItem, {
            Transparency = 1,
            CFrame = newItem.CFrame * CFrame.new(Vector3.new(x, 0, 0)),
            Parent = characterTemplate
        })

        local decalFront = Utils.getDescendantByName(newItem, "DecalFront")
        local decalBack = Utils.getDescendantByName(newItem, "DecalBack")
        local decalId = Utils.getDecalIdFromName({name = itemConfig.name})

        decalFront.Texture = 'rbxassetid://' .. decalId
        decalBack.Texture = 'rbxassetid://' .. decalId
    end
    characterTemplate.Transparency = 1

    -- put templates out of sight
    characterTemplate.Position = characterTemplate.Position +
                                     Vector3.new(0, -100, 0)
end

function module.addCharactersToScene(props)
    local frameConfig = props.frameConfig
    local clonedScene = props.clonedScene
    local characterConfigs01 = frameConfig.characters01
    local characterConfigs02 = frameConfig.characters02

    renderCharacters({
        template = Utils.getDescendantByName(clonedScene, "CharacterTemplate01"),
        itemConfigs = characterConfigs01
    })
    renderCharacters({
        template = Utils.getDescendantByName(clonedScene, "CharacterTemplate02"),
        itemConfigs = characterConfigs02
    })

    local dialogTemplate = Utils.getDescendantByName(clonedScene,
                                                     "DialogTemplate")
    Dialog.renderDialog({
        dialogConfigs = frameConfig.dialogs,
        dialogTemplate = dialogTemplate
    })

end

return module
