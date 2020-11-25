local Sss = game:GetService("ServerScriptService")
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

renderDialog = function(props)
    local parent = props.parent
    local dialogConfigs = props.dialogConfigs
    local sceneTemplateModel = props.sceneTemplateModel
    local dialogContainer = Utils.getDescendantByName(sceneTemplateModel,
                                                      "DialogTemplate")

    local renderTextsProps = {
        parent = dialogContainer,
        dialogConfigs = dialogConfigs,
        sceneTemplateModel = sceneTemplateModel
    }
    Texts.renderTexts(renderTextsProps)

    return dialogContainer
end

module.renderDialog = renderDialog
return module
