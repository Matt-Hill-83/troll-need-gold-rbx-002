local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Constants = require(Sss.Source.Constants.Constants)

local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function applyDecalsToCharacter(props)
    local part = props.part
    local imageId = props.imageId

    if not imageId then return end

    local decalUri = 'rbxassetid://' .. imageId
    local decalFront = Utils.getFirstDescendantByName(part,
                                                      "CharacterDecalFront")
    local decalBack = Utils.getFirstDescendantByName(part, "CharacterDecalBack")

    decalFront.Image = decalUri
    decalBack.Image = decalUri
end

function onToggle(word)

    local word = word

    print('word' .. ' - start');
    print(word);
    local closure = function()
        print('word' .. ' - start');
        print(word);
        local soundId = ""
        if Constants.wordConfigs[word] then
            soundId = Constants.wordConfigs[word]['soundId']
        end

        if (soundId) then
            -- if (false and soundId) then
            local sound = Instance.new("Sound", workspace)
            sound.SoundId = "rbxassetid://" .. soundId
            sound.EmitterSize = 5
            sound.Looped = false
            if not sound.IsPlaying then sound:Play() end
        end

        print('clicked')
        print('clicked')
        print('clicked')
        print('clicked')
    end
    return closure
end

function initWord(props)
    local wordIndex = props.wordIndex
    local word = props.word
    local wordLetters = props.wordLetters

    local myStuff = workspace:FindFirstChild("MyStuff")
    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")

    local letterBlockFolder = Utils.getFromTemplates("LetterBlockTemplates")

    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    letterBlockFolder, "LBPurpleLight")

    local wordTemplate = Utils.getFirstDescendantByName(wordWheelIsland,
                                                        "WordTemplate")
    local newWord = wordTemplate:Clone()

    local wordBench = Utils.getFirstDescendantByName(newWord, "WordBench")
    local charImageBlock = Utils.getFirstDescendantByName(newWord,
                                                          "CharacterImage")

    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")
    local sentencePositioner = Utils.getFirstDescendantByName(wordWheelIsland,
                                                              "SentencePositioner")

    if Constants.wordConfigs[word] then
        print('Constants.wordConfigs[word]' ..
                  ' - start----------------------->>>>>>');
        print('Constants.wordConfigs[word]' ..
                  ' - start----------------------->>>>>>');
        print('Constants.wordConfigs[word]' ..
                  ' - start----------------------->>>>>>');
        print(Constants.wordConfigs[word]);
        local imageId = Constants.wordConfigs[word]['imageId']
        if imageId then
            applyDecalsToCharacter({part = newWord, imageId = imageId})
        end
    end

    local soundId = ""
    if Constants.wordConfigs[word] then
        soundId = Constants.wordConfigs[word][soundId]
    end

    newWord.Parent = wordTemplate.Parent

    Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

    local spacingFactorY = 1.25
    local spacingFactorX = 1.0
    local wordSpacingX = -letterBlockTemplate.Size.X * 4

    local translateWordProps = {
        parent = sentencePositioner,
        child = newWord.PrimaryPart,
        offsetConfig = {
            useParentNearEdge = Vector3.new(1, -1, 1),
            useChildNearEdge = Vector3.new(1, -1, 1),
            offsetAdder = Vector3.new(wordSpacingX * wordIndex, 0, 0)
        }
    }

    newWord.PrimaryPart.CFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                                     translateWordProps)
    newWord.PrimaryPart.Anchored = true

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

        local cd = Instance.new("ClickDetector", newLetter)
        cd.MouseClick:Connect(onToggle(word))

        newLetter.Name = "wordLetter-" .. letterNameStub .. "xxxx"

        local letterPositionX = -newLetter.Size.X * (letterIndex - 1) *
                                    spacingFactorX

        CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
        LetterFallUtils.applyLetterText({letterBlock = newLetter, char = letter})

        local translateCFrameProps = {
            parent = letterPositioner,
            child = newLetter,
            offsetConfig = {
                useParentNearEdge = Vector3.new(-1, -1, -1),
                useChildNearEdge = Vector3.new(-1, -1, -1),
                offsetAdder = Vector3.new(letterPositionX, 0, 0)
            }
        }

        newLetter.CFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                               translateCFrameProps)
        newLetter.Anchored = true

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
