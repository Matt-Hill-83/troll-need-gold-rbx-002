local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

local module = {
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"}
}

function initGameToggle(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local startGameTrigger = Utils.getFirstDescendantByName(letterFallFolder,
                                                            "StartGameTrigger")

    print('startGameTrigger' .. ' - start');
    print('startGameTrigger' .. ' - start');
    print('startGameTrigger' .. ' - start');
    print('startGameTrigger' .. ' - start');
    print('startGameTrigger' .. ' - start');
    print(startGameTrigger);
    if startGameTrigger then
        function onPartTouched(otherPart)
            print('onPartTouched')
            print('onPartTouched')
            print('onPartTouched')
            print('onPartTouched')
            print('onPartTouched')
            if not miniGameState.initCompleted then
                initLetterRack(miniGameState)
                initWord(miniGameState)
                local letterFallFolder = miniGameState.letterFallFolder
                initClickHandler(miniGameState)
                local letterFallFolder = miniGameState.letterFallFolder
                miniGameState.initCompleted = true
            end
        end
        startGameTrigger.Touched:Connect(onPartTouched)
    end

end

function initWord(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordFolder = getWordFolder(miniGameState)
    local word = miniGameState.words[miniGameState.lastWordIndex]

    for i, letter in ipairs(miniGameState.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        miniGameState.wordLetters[i] = nil
    end
    Utils.clearTable(miniGameState.wordLetters)

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

        local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
        local letterPositioner = CS:GetTagged("WordLetterBlockPositioner")[1]
        letterPositioner.Transparency = 1

        CS:AddTag(newLetter, module.tagNames.WordLetter)
        module.applyLetterText({letterBlock = newLetter, char = letter})
        module.colorLetterText({
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

function initLetterRack(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local letterFolder = getRunTimeLetterFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local numRow = 10
    local numCol = 8
    local spacingFactor = 1.05

    local columnBaseTemplate = CS:GetTagged("ColumnBaseTemplate")[1]

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
        local letterPositioner = CS:GetTagged("RackLetterBlockPositioner")[1]
        newColumnBase.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(-x, 0, 0))
        letterPositioner.Transparency = 1
        newColumnBase.Parent = letterFolder

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")
        letterTemplate.Transparency = 1

        for rowIndex = 1, numRow do
            -- local char = letters[(colIndex % #letters) + 1]
            local test = Utils.genRandom(1, #lettersFromWords)
            local char = lettersFromWords[test]
            local newLetter = letterTemplate:Clone()

            newLetter.Name = "newLetter-" .. char
            CS:AddTag(newLetter, module.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            applyLetterText({letterBlock = newLetter, char = char})
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

    -- createBalls(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
end

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

function createBalls(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local ball = Utils.getFirstDescendantByName(letterFallFolder, "GemTemplate")

    for count = 1, 10 do
        local newBall = ball:Clone()
        newBall.CFrame = newBall.CFrame + Vector3.new(-0.1, 0, 0)
        newBall.Parent = ball.Parent
    end
end

function getRunTimeLetterFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    local letterFolder = Utils.getOrCreateFolder(
                             {name = "LetterFolder", parent = runtimeFolder})
    return letterFolder
end

function getWordFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "LF-RuntimeFolder",
            parent = letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "WordFolder",
        parent = runtimeFolder
    }))
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

function initClickHandler(miniGameState)
    print('initClickHandler' .. ' - start');
    print(initClickHandler);
    -- Gets arguments from EventHandler in StarterPack
    function brickClickHandler(player, clickedLetter)
        handleBrick(player, clickedLetter, miniGameState)
    end
    remoteEvent.OnServerEvent:Connect(brickClickHandler)
end

function handleBrick(player, clickedLetter, miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordLetters = miniGameState.wordLetters

    local ballPitBottom = Utils.getFirstDescendantByName(clickedLetter,
                                                         "BallPitBottom")
    if ballPitBottom then ballPitBottom:Destroy() end

    local isChild = clickedLetter:IsDescendantOf(letterFallFolder)
    print('isChild' .. ' - start');
    print(isChild);
    if not isChild then return {} end

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
                miniGameState.lastWordIndex = miniGameState.lastWordIndex + 1
                module.initWord(miniGameState)
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
