local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

local module = {}

function initLetterFall(letterFallFolder)
    LetterFall.initGameToggle(letterFallFolder)
end

module.initLetterFall = initLetterFall
return module

