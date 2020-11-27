local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local InstanceUtils = require(Sss.Source.Utils.U002InstanceUtils)
local Dialog = require(Sss.Source.AddDialog.Dialog)

local module = {}

renderCharacters = function(props)
    local characterTemplate = props.template
    local itemConfigs = props.itemConfigs
    local xGap = 1
    local nameStub = 'CharacterClone'

    InstanceUtils.deleteInstanceByNameStub(
        {parent = characterTemplate, nameStub = nameStub})

    -- Hide decal on template
    applyDecalsToCharacter({part = characterTemplate, decalId = ""})
    -- Ensure player doesn't crash into invisivble template
    characterTemplate.CanCollide = false
    -- characters blocks are left visible during development, so I can move them around.
    characterTemplate.Transparency = 1

    for i, itemConfig in ipairs(itemConfigs) do
        local name = itemConfig.name

        if (name ~= "blank" and name ~= "empty" and name ~= "") then
            local newItem = characterTemplate:Clone()
            local x = (i - 1) * -(characterTemplate.Size.X + xGap)

            Utils.mergeTables(newItem, {
                CFrame = newItem.CFrame * CFrame.new(Vector3.new(x, 0, 0)),
                Parent = characterTemplate,
                Name = nameStub .. i
            })

            local decalId = Utils.getDecalIdFromName({name = itemConfig.name})
            applyDecalsToCharacter({part = newItem, decalId = decalId})
        end
    end

end

function applyDecalsToCharacter(props)
    local part = props.part
    local decalId = props.decalId

    local decalFront = Utils.getFirstDescendantByName(part,
                                                      "CharacterDecalFront")
    local decalBack = Utils.getFirstDescendantByName(part, "CharacterDecalBack")

    decalFront.Texture = 'rbxassetid://' .. decalId
    decalBack.Texture = 'rbxassetid://' .. decalId

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
