local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)

local module = {}

function module.renderDialog(props)
    local dialogConfigs = props.dialogConfigs
    local sgui = props.sgui

    local renderTextsProps = {dialogConfigs = dialogConfigs, sgui = sgui}

    Texts.renderTexts(renderTextsProps)

end

return module
