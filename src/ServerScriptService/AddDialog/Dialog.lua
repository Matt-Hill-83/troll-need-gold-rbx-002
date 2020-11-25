local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

function module.renderDialog(props)
    local dialogConfigs = props.dialogConfigs
    local dialogTemplate = props.dialogTemplate

    local renderTextsProps = {
        parent = dialogTemplate,
        dialogConfigs = dialogConfigs
    }

    Texts.renderTexts(renderTextsProps)

end

return module
