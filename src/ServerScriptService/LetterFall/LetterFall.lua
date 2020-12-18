local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local InitWord = require(Sss.Source.LetterFall.InitWord)
local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)

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

function createBalls(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local ball = Utils.getFirstDescendantByName(letterFallFolder, "GemTemplate")

    for count = 1, 10 do
        local newBall = ball:Clone()
        newBall.Handle.CFrame = newBall.Handle.CFrame + Vector3.new(-0.1, 0, 0)
        newBall.Parent = ball.Parent
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
