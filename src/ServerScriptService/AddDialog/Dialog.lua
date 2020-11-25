local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

function module.renderDialog(props)
    local dialogConfigs = props.dialogConfigs
    local dialogContainer = Utils.getFromTemplates("DialogTemplate")

    local renderTextsProps = {
        parent = dialogContainer,
        dialogConfigs = dialogConfigs
    }

    Texts.renderTexts(renderTextsProps)
    return dialogContainer
end

return module
