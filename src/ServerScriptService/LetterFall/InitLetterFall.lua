local SP = game:GetService("StarterPlayer")
local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

local module = {touched = false}

function initLetterFall(letterFallFolder)
    LetterFall.initGameToggle(letterFallFolder)
end

module.initLetterFall = initLetterFall
return module

