local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

local module = {
    wordLetters = {},
    words = {
        {'C', 'A', 'T'}, {'B', 'A', 'T'}, {'H', 'A', 'T'}, {'M', 'A', 'T'},
        {'P', 'A', 'T'}, {'R', 'A', 'T'}, {'S', 'A', 'T'}
    },
    lastWordIndex = 1,
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"},
    letterFallFolder = nil
}

function getRunTimeLetterFolder()
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    local letterFolder = Utils.getOrCreateFolder(
                             {name = "LetterFolder", parent = runtimeFolder})
    return letterFolder
end

function getLetterFallFolder()
    return Utils.getFirstDescendantByName(workspace, "LetterFallFolder")
end

function getWordFolder()
    print('module.letterFallFolder' .. ' - start');
    print(module.letterFallFolder);
    print('module.letterFallFolder' .. ' - end');
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = module.letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "WordFolder",
        parent = runtimeFolder
    }))
end

function initWord(letterFallFolder)
    module.letterFallFolder = letterFallFolder
    local wordFolder = getWordFolder(letterFallFolder)
    local word = module.words[module.lastWordIndex]

    print('module.wordLetters' .. ' - start');
    print(module.wordLetters);
    print('module.wordLetters' .. ' - end');

    -- TODO: need to delete these letters.

    for i, letter in ipairs(module.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        module.wordLetters[i] = nil
    end
    Utils.clearTable(module.wordLetters)

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

        CS:AddTag(newLetter, module.tagNames.WordLetter)

        module.applyLetterText({letterBlock = newLetter, char = letter})
        module.colorLetterText({
            letterBlock = newLetter,
            color = Color3.new(255, 0, 191)
        })

        table.insert(module.wordLetters,
                     {char = letter, found = false, instance = newLetter})
    end
end

function isDesiredLetter(letter, clickedLetter)
    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    return letter.found ~= true and letter.char == textLabel
end

function isWordComplete(wordLetters)
    for i, word in ipairs(wordLetters) do
        if not word.found then return false end
    end
    return true
end

module.colorLetterText = colorLetterText
module.initGameToggle = initGameToggle
module.createBalls = createBalls
module.initLetterRack = initLetterRack
module.applyLetterText = applyLetterText
module.initWord = initWord

return module
