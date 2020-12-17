local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
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

function colorLetterText(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        label.TextColor3 = color or Color3.new(255, 0, 191)

    end
end

function applyLetterText(props)
    local char = props.char
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do label.Text = char end
end

function getWordFolder()
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

    for i, letter in ipairs(module.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        module.wordLetters[i] = nil
    end
    Utils.clearTable(module.wordLetters)

    function Utils.genRandom(min, max)
        return min + math.random() * (max - min)
    end

    local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                         "WordBoxFolder")
    local letterBlockTemplate = Utils.getFirstDescendantByName(wordBoxFolder,
                                                               "LetterBlockTemplate")
    letterBlockTemplate.Transparency = 1
    local spacingFactor = 1.05

    for letterIndex, letter in ipairs(word) do
        local newLetter = letterBlockTemplate:Clone()
        newLetter.Name = "wordLetter-" .. letterIndex
        newLetter.Transparency = 0

        local z = newLetter.Size.Z * (letterIndex - 0) * spacingFactor
        local letterPositioner = CS:GetTagged("WordLetterBlockPositioner")[1]
        newLetter.CFrame = letterPositioner.CFrame *
                               CFrame.new(Vector3.new(0, 0, z))
        letterPositioner.Transparency = 1

        CS:AddTag(newLetter, module.tagNames.WordLetter)

        module.applyLetterText({letterBlock = newLetter, char = letter})
        module.colorLetterText({
            letterBlock = newLetter,
            color = Color3.new(255, 0, 191)
        })

        -- Do this last to avoid tweening
        newLetter.Parent = wordFolder
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
