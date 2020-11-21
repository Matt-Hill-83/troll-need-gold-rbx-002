local Sss = game:GetService("ServerScriptService")
local MissyMeow = require(Sss.Source.QuestConfigs.MissyMeow)
local QuestConfigs = require(Sss.Source.QuestConfigs.QuestConfigs)
local module = {}

function module.getScenesConfig()

    -- local missyMeow = MissyMeow.quest
    -- return {missyMeow}

    return QuestConfigs.questConfigs

end

return module
