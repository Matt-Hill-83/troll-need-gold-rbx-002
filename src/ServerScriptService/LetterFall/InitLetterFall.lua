local SP = game:GetService("StarterPlayer")
local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {touched = false}

-- local ConfigGame = require(script.Parent.ConfigGame)
local LetterFall = require(script.Parent.LetterFall)
-- local TargetWord = require(script.Parent.TargetWord)
-- local HandleBrick3 = require(script.Parent.HandleBrick3)

function initLetterFall(letterFallFolder)
    -- HandleBrick3.initClickHandler(letterFallFolder)
    -- ConfigGame.configGame(letterFallFolder)
    LetterFall.initGameToggle(letterFallFolder)
end

module.initLetterFall = initLetterFall
return module

