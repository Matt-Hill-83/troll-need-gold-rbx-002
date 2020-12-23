local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
local InitWord = require(Sss.Source.LetterFall.InitWord)

local module = {}

-- TODO: create dead letters
function isDeadLetter(props)
    local rowIndex = props.rowIndex
    local colIndex = props.colIndex
    local deadLetters = props.deadLetters

    local isDead = false
    for i, deadLetter in ipairs(deadLetters) do
        if deadLetter.row == rowIndex and deadLetter.col == colIndex then
            isDead = true
            break
        end
    end
    return isDead
end

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
        for letterIndex = 1, #word do
            local letter = string.sub(word, letterIndex, letterIndex + 0)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
        end
    end

    local deadLetters = {
        {row = 2, col = 3}, {row = 3, col = 4}, {row = 4, col = 5},
        {row = 5, col = 6}
    }

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
            local rand = Utils.genRandom(1, #lettersFromWords)

            local char = lettersFromWords[rand]
            Utils.removeFirstMatchFromArray(lettersFromWords, char)
            local newLetter = letterTemplate:Clone()

            newLetter.Name = "newLetter-" .. char

            local isDeadLetter = isDeadLetter(
                                     {
                    rowIndex = rowIndex,
                    colIndex = colIndex,
                    deadLetters = deadLetters

                })

            if isDeadLetter then
                print('isDeadLetter' .. ' - start');
                print('isDeadLetter' .. ' - start');
                print('isDeadLetter' .. ' - start');
                print('isDeadLetter' .. ' - start');
                print('isDeadLetter' .. ' - start');
                print('isDeadLetter' .. ' - start');
                print(isDeadLetter);
            end
            if isDeadLetter then
                CS:AddTag(newLetter, LetterFallUtils.tagNames.DeadLetter)
            end

            CS:AddTag(newLetter, LetterFallUtils.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            LetterFallUtils.applyLetterText(
                {letterBlock = newLetter, char = char})
            newLetter.CFrame = newLetter.CFrame *
                                   CFrame.new(Vector3.new(0, y, 0))

            newColumnBase.Transparency = 1
            newLetter.Transparency = 0
            -- newLetter.Anchored = true

            -- do this last to avoid tweening
            newLetter.Parent = newColumnBase
        end
        letterTemplate:Destroy()
    end
    columnBaseTemplate:Destroy()

    configDeadLetters({
        deadLetters = deadLetters,
        parentFolder = runTimeLetterFolder
    })
end

function configDeadLetters(props)
    local deadLetters = props.deadLetters
    local parentFolder = props.parentFolder

    local deadLetters = Utils.getByTagInParent(
                            {
            parent = parentFolder,
            tag = LetterFallUtils.tagNames.DeadLetter
        })

    for i, item in ipairs(deadLetters) do
        item.Anchored = true

        LetterFallUtils.colorLetterText({
            letterBlock = item,
            color = Color3.fromRGB(58, 0, 87)
        })
        LetterFallUtils.colorLetterBG({
            letterBlock = item,
            color = Color3.fromRGB(0, 255, 34)
        })
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

module.initLetterRack = initLetterRack

return module
