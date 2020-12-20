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

    if startGameTrigger then
        function onPartTouched(otherPart)
            if not miniGameState.initCompleted then
                InitLetterRack.initLetterRack(miniGameState)
                InitWord.initWord(miniGameState)
                HandleClick.initClickHandler(miniGameState)
                miniGameState.initCompleted = true

                local taggedPartsDestroy = CS:GetTagged("Destroy")
                print('taggedPartsDestroy' .. ' - start');
                print(taggedPartsDestroy);
                for i, item in ipairs(taggedPartsDestroy) do
                    item:Destroy()
                end

            end
        end
        startGameTrigger.Touched:Connect(onPartTouched)
    end

end

module.initGameToggle = initGameToggle
module.createBalls = createBalls

return module
