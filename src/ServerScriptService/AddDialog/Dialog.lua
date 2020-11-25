local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

renderDialog = function(props)
    local parent = props.parent
    local dialogConfigs = props.dialogConfigs
    local dialogContainer = Utils.getDescendantByName(parent, "DialogTemplate")

    local renderTextsProps = {
        parent = dialogContainer,
        dialogConfigs = dialogConfigs
    }
    Texts.renderTexts(renderTextsProps)

    return dialogContainer
end

module.renderDialog = renderDialog
return module
