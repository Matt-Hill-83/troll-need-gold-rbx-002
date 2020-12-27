local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local module = {}

function initGameToggle(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local startGameTrigger = Utils.getFirstDescendantByName(letterFallFolder,
                                                            "StartGameTrigger")

    if not miniGameState.initCompleted then
        -- InitLetterRack.initLetterRack(miniGameState)
        -- InitWord.initWord(miniGameState)
    end

    function onPartTouched(otherPart)
        if not miniGameState.initCompleted then
            miniGameState.initCompleted = true
            -- HandleClick.initClickHandler(miniGameState)

        end
    end
    startGameTrigger.Touched:Connect(onPartTouched)
    -- LetterFallUtils.createBalls(miniGameState)
end

module.initGameToggle = initGameToggle
return module
