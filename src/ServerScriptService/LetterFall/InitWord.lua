local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordFolder = getWordFolder(miniGameState)
    local word = miniGameState.words[miniGameState.lastWordIndex]

    for i, letter in ipairs(miniGameState.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        miniGameState.wordLetters[i] = nil
    end
    Utils.clearTable(miniGameState.wordLetters)

    local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                         "WordBoxFolder")
    local letterBlockTemplate = Utils.getFirstDescendantByName(wordBoxFolder,
                                                               "LetterBlockTemplate")
    local letterPositioner = Utils.getFirstDescendantByName(wordBoxFolder,
                                                            "WordLetterBlockPositioner")
    letterBlockTemplate.Transparency = 1
    local spacingFactor = 1.05

    Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

    -- for letterIndex, letter in ipairs(word) do
    for letterIndex = 1, #word do
        -- local letter = word.sub(letterIndex, letterIndex + 1)
        local letter = string.sub(word, letterIndex, letterIndex + 0)
        local newLetter = letterBlockTemplate:Clone()
        newLetter.Name = "wordLetter-" .. letterIndex
        newLetter.Transparency = 0
        Utils.enableChildWelds({part = newLetter, enable = true})

        local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor

        letterPositioner.Transparency = 1

        CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
        LetterFallUtils.applyLetterText({letterBlock = newLetter, char = letter})
        LetterFallUtils.colorLetterText({
            letterBlock = newLetter,
            color = Color3.new(255, 0, 191)
        })

        newLetter.CFrame = letterPositioner.CFrame *
                               CFrame.new(Vector3.new(0, 0, z))
        -- Do this last to avoid tweening
        newLetter.Parent = wordFolder
        table.insert(miniGameState.wordLetters,
                     {char = letter, found = false, instance = newLetter})
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
