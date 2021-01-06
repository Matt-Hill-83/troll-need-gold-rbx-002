local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)

local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(props)
    local wordIndex = props.wordIndex
    local word = props.word
    local wordLetters = props.wordLetters

    -- local letterFallFolder = miniGameState.letterFallFolder
    local myStuff = workspace:FindFirstChild("MyStuff")
    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")

    local letterBlockFolder = Utils.getFromTemplates("LetterBlockTemplates")

    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    letterBlockFolder, "LBPurpleLight")

    local wordTemplate = Utils.getFirstDescendantByName(wordWheelIsland,
                                                        "WordTemplate")
    local newWord = wordTemplate:Clone()
    local wordBench = Utils.getFirstDescendantByName(newWord, "WordPositioner")

    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")
    local sentencePositioner = Utils.getFirstDescendantByName(wordWheelIsland,
                                                              "SentencePositioner")
    local sentencePositioner = Utils.getFirstDescendantByName(wordWheelIsland,
                                                              "SentencePositioner")
    print('sentencePositioner' .. ' - start--------------------->>>>');
    print(sentencePositioner);

    newWord.Parent = wordTemplate.Parent

    Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

    local spacingFactorY = 1.25
    local spacingFactorX = 1.0
    local wordSpacingX = -letterBlockTemplate.Size.X * 4

    local translateWordProps = {
        parent = sentencePositioner,
        child = newWord.PrimaryPart,
        offsetConfig = {
            useParentNearEdge = Vector3.new(0, -1, 1),
            useChildNearEdge = Vector3.new(0, -1, 1),
            offsetAdder = Vector3.new(wordSpacingX * wordIndex, 0, 0)
        }
    }

    local output = Utils3.setCFrameFromDesiredEdgeOffset(translateWordProps)

    newWord.PrimaryPart.CFrame = output

    local letterPositioner = Utils.getFirstDescendantByName(newWord,
                                                            "LetterPositioner")

    local wordNameStub = "-W" .. wordIndex
    newWord.Name = newWord.Name .. "zzz" .. wordNameStub
    wordBench.Anchored = true

    local lettersInWord = {}
    for letterIndex = 1, #word do
        local letterNameStub = wordNameStub .. "-L" .. letterIndex
        local letter = string.sub(word, letterIndex, letterIndex)

        local newLetter = letterBlockTemplate:Clone()

        newLetter.Name = "wordLetter-" .. letterNameStub .. "xxxx"

        local letterPositionX = -newLetter.Size.X * (letterIndex - 1) *
                                    spacingFactorX

        CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
        LetterFallUtils.applyLetterText({letterBlock = newLetter, char = letter})

        local translateCFrameProps = {
            parent = letterPositioner,
            child = newLetter,
            offsetConfig = {
                useParentNearEdge = Vector3.new(0, -1, 1),
                useChildNearEdge = Vector3.new(0, -1, 1),
                offsetAdder = Vector3.new(letterPositionX, 0, 0)
            }
        }

        local output = Utils3.setCFrameFromDesiredEdgeOffset(
                           translateCFrameProps)

        newLetter.CFrame = output

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
    local wordBenchSizeX = #word * letterBlockTemplate.Size.X * spacingFactorX

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

    letterPositioner:Destroy()
    return newWordObj
end

function initWords(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordLetters = miniGameState.wordLetters
    local wordFolder = getWordFolder(miniGameState)

    local putItemsToBeClonedHere = Utils.getFirstDescendantByName(
                                       letterFallFolder,
                                       "PutItemsToBeClonedHere")

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

module.initWords = initWords
module.initWord = initWord

return module
