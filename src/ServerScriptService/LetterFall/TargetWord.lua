local Sss = game:GetService("ServerScriptService")
local CS = game:GetService("CollectionService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function getWordFolder(letterFallFolder)
    -- local letterFallFolder = Utils.getFirstDescendantByName(workspace,
    --                                                         "LetterFallFolder")
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "WordFolder",
        parent = runtimeFolder
    }))
end

function initWord(letterFallFolder)
    -- local letterFallFolder = Utils.getFirstDescendantByName(workspace,
    --                                                         "LetterFallFolder")
    local wordFolder = getWordFolder()
    local word = LetterFall.words[LetterFall.lastWordIndex]

    print('LetterFall.wordLetters' .. ' - start');
    print(LetterFall.wordLetters);
    print('LetterFall.wordLetters' .. ' - end');

    -- TODO: need to delete these letters.

    for i, letter in ipairs(LetterFall.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        LetterFall.wordLetters[i] = nil
    end
    Utils.clearTable(LetterFall.wordLetters)

    function genRandom(min, max) return min + math.random() * (max - min) end

    local wordBox = Utils.getFirstDescendantByName(letterFallFolder, "WordBox")
    local letterBlock = Utils.getFirstDescendantByName(wordBox,
                                                       "LetterBlockTemplate")

    local letterPositioner = Utils.getFirstDescendantByName(wordBox,
                                                            "LetterPositioner")

    local spacingFactor = 1.05

    for letterIndex, letter in ipairs(word) do
        local newLetter = letterBlock:Clone()
        newLetter.Parent = wordFolder
        newLetter.Name = "wordLetter-" .. letterIndex
        local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
        newLetter.CFrame = letterPositioner.CFrame *
                               CFrame.new(Vector3.new(0, 0, z))

        CS:AddTag(newLetter, LetterFall.tagNames.WordLetter)

        LetterFall.applyLetterText({letterBlock = newLetter, char = letter})
        LetterFall.colorLetterText({
            letterBlock = newLetter,
            color = Color3.new(255, 0, 191)
        })

        table.insert(LetterFall.wordLetters,
                     {char = letter, found = false, instance = newLetter})
    end
end

module.initWord = initWord

return module
