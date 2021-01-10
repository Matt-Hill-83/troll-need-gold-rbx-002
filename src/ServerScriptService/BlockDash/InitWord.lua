local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(props)
    local miniGameState = props.miniGameState
    local wordIndex = props.wordIndex
    local word = props.word
    local wordLetters = props.wordLetters

    local miniGameFolder = miniGameState.miniGameFolder
    local wordBoxFolder = Utils.getFirstDescendantByName(miniGameFolder,
                                                         "WordBoxFolder")

    local wordBox = Utils.getFirstDescendantByName(wordBoxFolder, "WordBox")
    local letterBlockFolder = Utils.getFromTemplates("LetterBlockTemplates")

    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    letterBlockFolder, "LBPurpleLight")

    local newWord = wordBox:Clone()
    local wordBench = Utils.getFirstDescendantByName(newWord, "WordBench")
    local letterPositioner = Utils.getFirstDescendantByName(newWord,
                                                            "WordLetterBlockPositioner")

    newWord.Parent = wordBox.Parent

    Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

    local spacingFactorY = 1.25
    local spacingFactorZ = 1.0
    local wordSpacingY = letterBlockTemplate.Size.Y * spacingFactorY

    wordBench.CFrame = wordBench.CFrame +
                           Vector3.new(0, wordSpacingY * wordIndex, 0)

    local wordNameStub = "-W" .. wordIndex
    newWord.Name = newWord.Name .. "zzz" .. wordNameStub
    wordBench.Anchored = true

    letterPositioner.Name = letterPositioner.Name .. wordNameStub

    local lettersInWord = {}
    for letterIndex = 1, #word do
        local letterNameStub = wordNameStub .. "-L" .. letterIndex
        local letter = string.sub(word, letterIndex, letterIndex)

        local newLetter = letterBlockTemplate:Clone()

        newLetter.Name = "wordLetter-" .. letterNameStub

        local letterPositionZ = newLetter.Size.Z * (letterIndex - 2) *
                                    spacingFactorZ

        CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
        LetterFallUtils.applyLetterText({letterBlock = newLetter, char = letter})

        newLetter.CFrame = letterPositioner.CFrame *
                               CFrame.new(Vector3.new(0, 0, letterPositionZ))
        local weld = Instance.new("WeldConstraint")
        weld.Name = "WeldConstraint" .. letterNameStub
        weld.Parent = wordBench.Parent
        weld.Part0 = wordBench
        weld.Part1 = newLetter

        -- Do this last to avoid tweening
        newLetter.Parent = newWord

        table.insert(wordLetters,
                     {char = letter, found = false, instance = newLetter})
        table.insert(lettersInWord,
                     {char = letter, found = false, instance = newLetter})
    end
    local wordBenchSizeX = #word * letterBlockTemplate.Size.X * spacingFactorZ

    local wordBenchPosX = wordBench.Position.X
    wordBench.Size = Vector3.new(wordBenchSizeX, wordBench.Size.Y,
                                 wordBench.Size.Z)
    wordBench.Position = Vector3.new(wordBenchPosX, wordBench.Position.Y,
                                     wordBench.Position.Z)

    local newWordObj = {
        word = newWord,
        letters = lettersInWord,
        wordChars = word
    }
    return newWordObj
end

function initWords(miniGameState)
    local miniGameFolder = miniGameState.miniGameFolder
    local wordLetters = miniGameState.wordLetters
    local wordFolder = getWordFolder(miniGameState)

    local putItemsToBeClonedHere = Utils.getFirstDescendantByName(
                                       miniGameFolder, "PutItemsToBeClonedHere")

    Utils.enableChildWelds({part = putItemsToBeClonedHere, enabled = false})
    putItemsToBeClonedHere:Destroy()

    for i, letter in ipairs(wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        wordLetters[i] = nil
    end
    Utils.clearTable(wordLetters)

    for wordIndex, word in ipairs(miniGameState.words) do
        local wordProps = {
            miniGameState = miniGameState,
            wordIndex = wordIndex,
            wordLetters = wordLetters,
            word = word
        }

        local newWordObj = initWord(wordProps)
        table.insert(miniGameState.renderedWords, newWordObj)
    end
end

function getWordFolder(miniGameState)
    local miniGameFolder = miniGameState.miniGameFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {name = "RunTimeFolder", parent = miniGameFolder})

    return (Utils.getOrCreateFolder({
        name = "RunTimeWordBoxFolder",
        parent = runtimeFolder
    }))
end

-- module.initGameToggle = initGameToggle
-- -- module.initLetterRack = initLetterRack
module.initWords = initWords
module.initWord = initWord

return module