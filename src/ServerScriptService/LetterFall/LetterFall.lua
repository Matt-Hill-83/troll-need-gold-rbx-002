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

function createBalls(props)
    local balls = CS:GetTagged("FluidBall")
    local ball = balls[1]
    if ball then
        for count = 1, 10 do
            local newBall = ball:Clone()
            newBall.CFrame = newBall.CFrame + Vector3.new(0.1, 0.1, 0.1)
            newBall.Parent = ball.Parent
        end
    end
end

function getRunTimeLetterFolder(letterFallFolder)
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    local letterFolder = Utils.getOrCreateFolder(
                             {name = "LetterFolder", parent = runtimeFolder})
    return letterFolder
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

    -- TODO: need to delete these letters.

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
    -- letterBlockTemplate.Transparency = 1
    Utils.hideItemAndChildren({item = letterBlockTemplate, hide = true})

    local letterPositioners = CS:GetTagged("WordLetterBlockPositioner")
    local spacingFactor = 1.1

    for letterIndex, letter in ipairs(word) do
        local newLetter = letterBlockTemplate:Clone()
        newLetter.Name = "wordLetter-" .. letterIndex
        newLetter.Transparency = 0
        Utils.hideItemAndChildren({item = newLetter, hide = false})

        if letterPositioners and letterPositioners[1] then
            local letterPositioner = letterPositioners[1]

            local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
            newLetter.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(0, 0, z))
            letterPositioner.Transparency = 1
        end

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

function initGameToggle(letterFallFolder)
    local part =
        Utils.getFirstDescendantByName(letterFallFolder, "LF-SpawnBase")

    if part then
        function onPartTouched(otherPart)
            if not module.touched then
                module.touched = true

                initLetterRack(letterFallFolder)
                initWord(letterFallFolder)
                initClickHandler(letterFallFolder)

            end
        end

        part.Touched:Connect(onPartTouched)
    end

end

function initLetterRack(letterFallFolder)
    local letterFolder = getRunTimeLetterFolder(letterFallFolder)

    local numRow = 10
    local numCol = 8

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }
    local lettersFromWords = {}
    for wordIndex, word in ipairs(module.words) do
        for letterIndex, letter in ipairs(word) do
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            -- 
        end
    end

    local columnBaseTemplates = CS:GetTagged("ColumnBaseTemplate")
    local columnBaseTemplate = columnBaseTemplates[1]

    local newLetters = {}
    local spacingFactor = 1.08
    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Name = "columnBase-" .. colIndex

        local letterPositioners = CS:GetTagged("RackLetterBlockPositioner")
        if letterPositioners and letterPositioners[1] then
            local letterPositioner = letterPositioners[1]

            local z = newColumnBase.Size.Z * (colIndex - 1) * spacingFactor
            newColumnBase.CFrame = letterPositioner.CFrame *
                                       CFrame.new(Vector3.new(-z, 0, 0))
            letterPositioner.Transparency = 1
        end

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")

        for rowIndex = 1, numRow do
            -- local char = letters[(colIndex % #letters) + 1]
            local test = Utils.genRandom(1, #lettersFromWords)
            local char = lettersFromWords[test]

            local newLetter = letterTemplate:Clone()
            newLetter.Parent = newColumnBase

            newLetter.Name = "newLetter-" .. char
            CS:AddTag(newLetter, module.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex) * spacingFactor
            newLetter.CFrame = newLetter.CFrame *
                                   CFrame.new(Vector3.new(0, y, 0))

            applyLetterText({letterBlock = newLetter, char = char})
            table.insert(newLetters, newLetter)

            -- do this last to avoid tweening
            newColumnBase.Parent = letterFolder
        end
        letterTemplate:Destroy()
    end
    columnBaseTemplate:Destroy()
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

function initClickHandler(player, clickedLetter)
    remoteEvent.OnServerEvent:Connect(handleBrick)
end

function handleBrick(player, clickedLetter)
    local wordLetters = module.wordLetters

    local part = CS:GetTagged("BallPitBottom")
    if part[1] then part[1]:Destroy() end

    for i, letter in ipairs(wordLetters) do
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true

            module.colorLetterText({
                letterBlock = letter.instance,
                color = Color3.fromRGB(113, 17, 161)
            })

            clickedLetter:Destroy()
            local wordComplete = isWordComplete(wordLetters)
            if wordComplete then
                module.lastWordIndex = module.lastWordIndex + 1
                module.initWord(module.letterFallFolder)
            end
            break
        end
    end
end

module.colorLetterText = colorLetterText
module.initGameToggle = initGameToggle
module.createBalls = createBalls
module.initLetterRack = initLetterRack
module.applyLetterText = applyLetterText
module.initWord = initWord

return module
