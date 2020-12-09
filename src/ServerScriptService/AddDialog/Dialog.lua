local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)

local module = {}

function module.renderDialog(props)
    local dialogConfigs = props.dialogConfigs
    local dialogTemplate = props.dialogTemplate
    local sgui = props.sgui

    local renderTextsProps = {
        parent = dialogTemplate,
        dialogConfigs = dialogConfigs,
        sgui = sgui
    }

    Texts.renderTexts(renderTextsProps)

end

return module
