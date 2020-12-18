local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local InitWord = require(Sss.Source.LetterFall.InitWord)

local module = {
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"}
}

function initLetterRack(miniGameState)
    local runTimeLetterFolder = getRunTimeLetterFolder(miniGameState)

    local letterFallFolder = miniGameState.letterFallFolder
    local letterRackFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                            "LetterRackFolder")
    local columnBaseTemplate = Utils.getFirstDescendantByName(letterRackFolder,
                                                              "ColumnBase")

    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    columnBaseTemplate, "LetterTemplate")
    local letterPositioner = Utils.getFirstDescendantByName(letterRackFolder,
                                                            "RackLetterBlockPositioner")

    local numRow = 10
    local numCol = 8
    local spacingFactor = 1.05

    local lettersFromWords = {}
    for wordIndex, word in ipairs(miniGameState.words) do
        for letterIndex, letter in ipairs(word) do
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
        end
    end

    local newLetters = {}

    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Name = "columnBase-" .. colIndex
        newColumnBase.Transparency = 1

        local x = newColumnBase.Size.X * (colIndex - 1) * spacingFactor

        newColumnBase.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(-x, 0, 0))
        newColumnBase.Parent = runTimeLetterFolder

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")
        newColumnBase.Transparency = 1

        for rowIndex = 1, numRow do
            -- local char = letters[(colIndex % #letters) + 1]
            local test = Utils.genRandom(1, #lettersFromWords)
            local char = lettersFromWords[test]
            local newLetter = letterTemplate:Clone()

            newLetter.Name = "newLetter-" .. char
            CS:AddTag(newLetter, module.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            HandleClick.applyLetterText({letterBlock = newLetter, char = char})
            newLetter.CFrame = newLetter.CFrame *
                                   CFrame.new(Vector3.new(0, y, 0))
            table.insert(newLetters, newLetter)
            -- do this last to avoid tweening
            newLetter.Parent = newColumnBase
            newColumnBase.Transparency = 1
            newLetter.Transparency = 0

        end
        letterTemplate:Destroy()
    end
    columnBaseTemplate:Destroy()

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

module.initLetterRack = initLetterRack

return module
