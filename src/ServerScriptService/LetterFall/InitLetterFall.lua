local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
local InitWord = require(Sss.Source.LetterFall.InitWord)

local letterFallFreezeCameraRE = RS:WaitForChild("LetterFallFreezeCameraRE")

local module = {}

function initLetterFall(miniGameState)
    LetterFall.initGameToggle(miniGameState)
    InitLetterRack.initLetterRack(miniGameState)
    InitWord.initWord(miniGameState)
    LetterFallUtils.styleLetterBlocks(miniGameState)
end

module.initLetterFall = initLetterFall

return module

