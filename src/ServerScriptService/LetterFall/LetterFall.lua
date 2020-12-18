local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

local module = {
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"}
}

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
            end
        end
        startGameTrigger.Touched:Connect(onPartTouched)
    end

end

function getRunTimeLetterFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RunTimeFolder",
            parent = letterFallFolder
        })

    return Utils.getOrCreateFolder({
        name = "RunTimeLetterRackFolder",
        parent = runtimeFolder
    })
end

module.initGameToggle = initGameToggle
module.createBalls = createBalls

return module
