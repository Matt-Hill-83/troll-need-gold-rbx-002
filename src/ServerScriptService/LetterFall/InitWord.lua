local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordFolder = getWordFolder(miniGameState)

    local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                         "WordBoxFolder")

    local putItemsToBeClonedHere = Utils.getFirstDescendantByName(
                                       letterFallFolder,
                                       "PutItemsToBeClonedHere")

    Utils.enableChildWelds({part = putItemsToBeClonedHere, enabled = false})
    putItemsToBeClonedHere:Destroy()

    for i, letter in ipairs(miniGameState.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        miniGameState.wordLetters[i] = nil
    end
    Utils.clearTable(miniGameState.wordLetters)

    for wordIndex, word in ipairs(miniGameState.words) do
        local newWordBoxFolder = wordBoxFolder
        local wordBox = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                       "WordBox")
        local letterBlockTemplate = Utils.getFirstDescendantByName(
                                        letterFallFolder, "LetterBlockTemplate")

        local newWord = wordBox:Clone()
        local wordBench = Utils.getFirstDescendantByName(newWord, "WordBench")
        local letterPositioner = Utils.getFirstDescendantByName(newWord,
                                                                "WordLetterBlockPositioner")

        -- newWord.Parent = wordBox.Parent
        newWord.Parent = wordBox.Parent

        Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

        local spacingFactor = 1.05
        local wordSpacingY = letterBlockTemplate.Size.Y * spacingFactor

        wordBench.CFrame = wordBench.CFrame +
                               Vector3.new(0, wordSpacingY * wordIndex, 0)

        local wordNameStub = "-W" .. wordIndex
        newWord.Name = newWord.Name .. "zzz" .. wordNameStub
        wordBench.Anchored = true

        letterPositioner.Name = letterPositioner.Name .. wordNameStub
        letterBlockTemplate.Transparency = 1

        for letterIndex = 1, #word do
            local letterNameStub = wordNameStub .. "-L" .. letterIndex
            local letter = string.sub(word, letterIndex, letterIndex)

            local newLetter = letterBlockTemplate:Clone()
            Utils.hideItemAndChildren({item = newLetter, hide = false})

            newLetter.Name = "wordLetter-" .. letterNameStub

            local letterPositionZ = newLetter.Size.Z * (letterIndex - 1) *
                                        spacingFactor

            CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
            LetterFallUtils.applyLetterText(
                {letterBlock = newLetter, char = letter})
            LetterFallUtils.colorLetterText(
                {letterBlock = newLetter, color = Color3.new(255, 0, 191)})

            newLetter.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(0, 0, letterPositionZ))
            local weld = Instance.new("WeldConstraint")
            weld.Name = "WeldConstraint" .. letterNameStub
            weld.Parent = wordBench.Parent
            weld.Part0 = wordBench
            weld.Part1 = newLetter

            -- Do this last to avoid tweening
            newLetter.Parent = newWord
            -- newLetter.Parent = wordFolder
            table.insert(miniGameState.wordLetters,
                         {char = letter, found = false, instance = newLetter})
            table.insert(miniGameState.renderedWords, {word = newWord})
        end
    end
end

function getWordFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RunTimeFolder",
            parent = letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "RunTimeWordBoxFolder",
        parent = runtimeFolder
    }))
end

module.initGameToggle = initGameToggle
module.initLetterRack = initLetterRack
module.initWord = initWord

return module
