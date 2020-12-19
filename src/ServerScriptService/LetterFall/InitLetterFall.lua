local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

local module = {}

function initLetterFall(miniGameState) LetterFall.initGameToggle(miniGameState) end

module.initLetterFall = initLetterFall
return module

