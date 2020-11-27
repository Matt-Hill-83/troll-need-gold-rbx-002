local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.Utils)
local Dialog = require(Sss.Source.AddDialog.Dialog)

local module = {}

renderCharacters = function(props)
    local characterTemplate = props.template
    local itemConfigs = props.itemConfigs
    local xGap = 1
    local nameStub = 'CharacterClone'

    local children = characterTemplate:GetChildren()
    for _, item in pairs(children) do
        local match = string.match(item.Name, nameStub)
        if item:IsA('Part') and match then
            item:Destroy()
            --
        end
    end

    for i, itemConfig in ipairs(itemConfigs) do

        local name = itemConfig.name
        if (name ~= "blank" and name ~= "empty" and name ~= "") then
            local newItem = characterTemplate:Clone()
            local x = (i - 1) * -(characterTemplate.Size.X + xGap)

            Utils.mergeTables(newItem, {
                Transparency = 1,
                CFrame = newItem.CFrame * CFrame.new(Vector3.new(x, 0, 0)),
                Parent = characterTemplate,
                Name = nameStub .. i
            })

            local decalFront = Utils.getFirstDescendantByName(newItem,
                                                              "DecalFront")
            local decalBack = Utils.getFirstDescendantByName(newItem,
                                                             "DecalBack")
            local decalId = Utils.getDecalIdFromName({name = itemConfig.name})

            decalFront.Texture = 'rbxassetid://' .. decalId
            decalBack.Texture = 'rbxassetid://' .. decalId
        end
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
        template = Utils.getFirstDescendantByName(clonedScene,
                                                  "CharacterTemplate01"),
        itemConfigs = characterConfigs01
    })
    renderCharacters({
        template = Utils.getFirstDescendantByName(clonedScene,
                                                  "CharacterTemplate02"),
        itemConfigs = characterConfigs02
    })

    local dialogTemplate = Utils.getFirstDescendantByName(clonedScene,
                                                          "DialogTemplate")
    Dialog.renderDialog({
        dialogConfigs = frameConfig.dialogs,
        dialogTemplate = dialogTemplate
    })

end

return module
