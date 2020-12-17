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
            newBall.CFrame = newBall.CFrame + Vector3.new(0, 0, 0)
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

function getWordFolder(letterFallFolder)
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
    local spacingFactor = 1.05

    local rackWalls = CS:GetTagged("LetterRackWall")
    local columnBaseTemplate = CS:GetTagged("ColumnBaseTemplate")[1]
    local letterTemplateSizer = Utils.getFirstDescendantByName(
                                    columnBaseTemplate, "LetterTemplate")

    -- local wallHeight = letterTemplateSizer.Size.Y * (numRow + 6) * spacingFactor
    -- local bPFH = letterTemplateSizer.Size.Y * (numRow + 3) * spacingFactor

    -- Utils.setWallHeightByList({items = rackWalls, height = wallHeight})
    -- local ballPitBottom = CS:GetTagged("BallPitBottom")[1]

    -- local ballPitBottomY =
    --     bPFH + rackWalls[1].Position.Y - rackWalls[1].Size.Y / 2
    -- ballPitBottom.Position = Vector3.new(ballPitBottom.Position.X,
    --                                      ballPitBottomY,
    --                                      ballPitBottom.Position.Z)

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
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            -- 
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
end

function isDesiredLetter(letter, clickedLetter)
    print('clickedLetter' .. ' - start');
    print(clickedLetter);
    print('clickedLetter' .. ' - end');
    print('clickedLetter' .. ' - start');
    print(Utils.tableToString({clickedLetter}));
    print('clickedLetter' .. ' - end');
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

function initClickHandler(letterFallFolder)
    function test(player, clickedLetter)
        handleBrick(player, clickedLetter, letterFallFolder)
        -- 
    end
    remoteEvent.OnServerEvent:Connect(test)
end

function handleBrick(player, clickedLetter, letterFallFolder)
    print('letterFallFolder' .. ' - start');
    print(letterFallFolder);
    print('letterFallFolder' .. ' - end');
    -- Gets arguments from EventHandler in StarterPack
    local wordLetters = module.wordLetters
    local ballPitBottom = CS:GetTagged("BallPitBottom")
    if ballPitBottom[1] then ballPitBottom[1]:Destroy() end

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
                module.initWord(letterFallFolder)
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
