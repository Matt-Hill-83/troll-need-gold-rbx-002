local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local HandleClick = require(Sss.Source.LetterFall.HandleClick)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local InitWord = require(Sss.Source.LetterFall.InitWord)

local module = {
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"}
}

function initGameToggle(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local startGameTrigger = Utils.getFirstDescendantByName(letterFallFolder,
                                                            "StartGameTrigger")

    if startGameTrigger then
        function onPartTouched(otherPart)
            if not miniGameState.initCompleted then
                initLetterRack(miniGameState)
                InitWord.initWord(miniGameState)
                HandleClick.initClickHandler(miniGameState)
                miniGameState.initCompleted = true
            end
        end
        startGameTrigger.Touched:Connect(onPartTouched)
    end

end

-- function initWord(miniGameState)
--     local letterFallFolder = miniGameState.letterFallFolder
--     local wordFolder = getWordFolder(miniGameState)
--     local word = miniGameState.words[miniGameState.lastWordIndex]

--     for i, letter in ipairs(miniGameState.wordLetters) do
--         if letter.instance then letter.instance:Destroy() end
--         miniGameState.wordLetters[i] = nil
--     end
--     Utils.clearTable(miniGameState.wordLetters)

--     local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
--                                                          "WordBoxFolder")
--     local letterBlockTemplate = Utils.getFirstDescendantByName(wordBoxFolder,
--                                                                "LetterBlockTemplate")
--     local letterPositioner = Utils.getFirstDescendantByName(wordBoxFolder,
--                                                             "WordLetterBlockPositioner")
--     letterBlockTemplate.Transparency = 1
--     local spacingFactor = 1.05

--     Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})
--     for letterIndex, letter in ipairs(word) do
--         local newLetter = letterBlockTemplate:Clone()
--         newLetter.Name = "wordLetter-" .. letterIndex
--         newLetter.Transparency = 0
--         Utils.enableChildWelds({part = newLetter, enable = true})

--         local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor

--         letterPositioner.Transparency = 1

--         CS:AddTag(newLetter, module.tagNames.WordLetter)
--         LetterFallUtils.applyLetterText({letterBlock = newLetter, char = letter})
--         LetterFallUtils.colorLetterText({
--             letterBlock = newLetter,
--             color = Color3.new(255, 0, 191)
--         })

--         newLetter.CFrame = letterPositioner.CFrame *
--                                CFrame.new(Vector3.new(0, 0, z))
--         -- Do this last to avoid tweening
--         newLetter.Parent = wordFolder
--         table.insert(miniGameState.wordLetters,
--                      {char = letter, found = false, instance = newLetter})
--     end
-- end

function initLetterRack(miniGameState)
    local runTimeLetterFolder = getRunTimeLetterFolder(miniGameState)

    local letterFallFolder = miniGameState.letterFallFolder
    local letterRackFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                            "LetterRackFolder")
    local columnBaseTemplate = Utils.getFirstDescendantByName(letterRackFolder,
                                                              "ColumnBase")

    local letterBlockTemplate = Utils.getFirstDescendantByName(
                                    columnBaseTemplate, "LetterTemplate")
    local letterPositioner = Utils.getFirstDescendantByName(letterRackFolder,
                                                            "RackLetterBlockPositioner")

    local numRow = 10
    local numCol = 8
    local spacingFactor = 1.05

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

        newColumnBase.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(-x, 0, 0))
        newColumnBase.Parent = runTimeLetterFolder

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")
        newColumnBase.Transparency = 1

        for rowIndex = 1, numRow do
            -- local char = letters[(colIndex % #letters) + 1]
            local test = Utils.genRandom(1, #lettersFromWords)
            local char = lettersFromWords[test]
            local newLetter = letterTemplate:Clone()

            newLetter.Name = "newLetter-" .. char
            CS:AddTag(newLetter, module.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            HandleClick.applyLetterText({letterBlock = newLetter, char = char})
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
    -- local letterFallFolder = miniGameState.letterFallFolder
end

function createBalls(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local ball = Utils.getFirstDescendantByName(letterFallFolder, "GemTemplate")

    for count = 1, 10 do
        local newBall = ball:Clone()
        newBall.Handle.CFrame = newBall.Handle.CFrame + Vector3.new(-0.1, 0, 0)
        newBall.Parent = ball.Parent
    end
end

function getRunTimeLetterFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RunTimeFolder",
            parent = letterFallFolder
        })

    return Utils.getOrCreateFolder({
        name = "RunTimeLetterRackFolder",
        parent = runtimeFolder
    })
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
module.createBalls = createBalls
module.initLetterRack = initLetterRack
-- module.initWord = initWord

return module
