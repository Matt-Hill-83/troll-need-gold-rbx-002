local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function module.addMiniGame(props)
    local parent = props.parent
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local isStartScene = props.isStartScene
    local skyBoxTeleporter = props.skyBoxTeleporter

    if (isStartScene) then

        local letterFallModel = Utils.getFromTemplates("LetterFallModel")
        print('letterFallModel' .. ' - start');
        print(letterFallModel);
    end

end

return module
