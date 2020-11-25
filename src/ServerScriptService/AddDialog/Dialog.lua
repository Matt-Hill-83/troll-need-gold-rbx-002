local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

function module.renderDialog(props)
    local dialogConfigs = props.dialogConfigs
    local dialogTemplate = Utils.getFromTemplates("DialogTemplate")

    local renderTextsProps = {
        parent = dialogTemplate,
        dialogConfigs = dialogConfigs
    }

    Texts.renderTexts(renderTextsProps)
    return dialogTemplate
end

return module
