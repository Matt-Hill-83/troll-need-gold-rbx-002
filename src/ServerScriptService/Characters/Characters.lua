local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local InstanceUtils = require(Sss.Source.Utils.U002InstanceUtils)
local Dialog = require(Sss.Source.AddDialog.Dialog)

local StarterGui = game:GetService("StarterGui")

local module = {}

renderCharacters = function(props)
    local characterTemplate = props.template
    local itemConfigs = props.itemConfigs
    local characterType = props.characterType
    local sceneFolder = props.sceneFolder
    local type = props.type

    local charFolder = Utils.getOrCreateFolder(
                           {name = characterType, parent = sceneFolder})

    local xGap = 1
    local nameStub = 'CharacterClone'

    InstanceUtils.deleteInstanceByNameStub(
        {parent = charFolder, nameStub = nameStub})

    local charImageBlock = Utils.getFirstDescendantByName(characterTemplate,
                                                          "CharacterImage")

    -- Ensure player doesn't crash into invisivble template
    Utils.setItemAndChildrenPropsByInst({
        item = characterTemplate,
        props = {Transparency = 1, CanCollide = false, Anchored = true}
    })

    Utils.hideItemAndChildren({item = characterTemplate, hide = false})

    -- If characters are welded to scenebase, things go bad.
    local welds = Utils.getDescendantsByType(characterTemplate, "Weld")
    for i, weld in ipairs(welds) do
        weld.Enabled = false
        -- 
    end

    -- For each character
    for i, itemConfig in ipairs(itemConfigs) do
        local name = itemConfig.name

        if (name ~= "blank" and name ~= "empty" and name ~= "") then
            local x = (i - 1) * (charImageBlock.Size.X + xGap) *
                          (type == 2 and 1 or -1)
            local newChar = Utils.cloneModel(
                                {
                    model = characterTemplate,
                    position = characterTemplate.PrimaryPart.CFrame *
                        CFrame.new(Vector3.new(-x, 0, 0)),
                    suffix = "Clone" .. i
                })

            newChar.Parent = charFolder

            Utils.mergeTables(newChar, {
                Parent = characterTemplate.Parent,
                Name = nameStub .. i
            })

            local decalId = Utils.getDecalIdFromName({name = itemConfig.name})
            applyDecalsToCharacter({part = newChar, decalId = decalId})
            applyLabelsToCharacter({part = newChar, text = itemConfig.name})

            Utils.hideItemAndChildren({item = newChar, hide = false})
            newChar.PrimaryPart.Transparency = 1
        end
    end

    Utils.hideItemAndChildren({item = characterTemplate, hide = true})

end

function applyDecalsToCharacter(props)
    local part = props.part
    local decalId = props.decalId

    local decalUri = 'rbxassetid://' .. decalId
    local decalFront = Utils.getFirstDescendantByName(part,
                                                      "CharacterDecalFront")
    local decalBack = Utils.getFirstDescendantByName(part, "CharacterDecalBack")

    decalFront.Image = decalUri
    decalBack.Image = decalUri
end

function applyLabelsToCharacter(props)
    local part = props.part
    local text = props.text or "no label"

    local charLabelFront =
        Utils.getFirstDescendantByName(part, "CharLabelFront")
    local charLabelBack = Utils.getFirstDescendantByName(part, "CharLabelBack")
    charLabelFront.Text = text
    charLabelBack.Text = text
end

function toggleLabelVisibility(props)
    local part = props.part
    local visible = props.visible

    local charLabelFront =
        Utils.getFirstDescendantByName(part, "CharLabelFront")
    local charLabelBack = Utils.getFirstDescendantByName(part, "CharLabelBack")
    charLabelFront.Visible = visible
    charLabelBack.Visible = visible
end

function module.addCharactersToScene(props)
    local frameConfig = props.frameConfig
    local clonedScene = props.clonedScene
    local sceneFolder = props.sceneFolder

    local characterConfigs01 = frameConfig.characters01
    local characterConfigs02 = frameConfig.characters02

    local characterType = "Character01"
    renderCharacters({
        template = Utils.getFirstDescendantByName(clonedScene, characterType),
        itemConfigs = characterConfigs01,
        sceneFolder = sceneFolder,
        characterType = characterType,
        type = 1
    })
    -- 
    -- 
    local characterType2 = "Character02"
    renderCharacters({
        template = Utils.getFirstDescendantByName(clonedScene, characterType2),
        itemConfigs = characterConfigs02,
        sceneFolder = sceneFolder,
        characterType = characterType2,
        type = 2
    })
    -- 
    -- 

    local dialogTemplate = Utils.getFirstDescendantByName(clonedScene,
                                                          "DialogTemplate")

    -- local sgui2 = Utils.getFirstDescendantByName(StarterGui, "SceneDialogGui")

    local sgui2 = Utils.getFirstDescendantByName(StarterGui, "SceneDialogGui")
    local sgui = Utils.getFirstDescendantByName(clonedScene,
                                                "SurfaceGuiTemplate")

    Dialog.renderDialog({
        dialogConfigs = frameConfig.dialogs,
        dialogTemplate = dialogTemplate,
        sgui = sgui
    })
    Dialog.renderDialog({
        dialogConfigs = frameConfig.dialogs,
        dialogTemplate = dialogTemplate,
        sgui = sgui2
    })

end

return module
