local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local RS = game:GetService("ReplicatedStorage")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local clickBlockEvent = RS:WaitForChild("ClickBlockRE")
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function isDesiredLetter(availLetters, clickedLetter)
    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    local char = LetterFallUtils.getCharFromLetterBlock(clickedLetter)
    return availLetters[char]
end

function isDeadLetter(clickedLetter)
    local tag = LetterFallUtils.tagNames.DeadLetter
    return CS:HasTag(clickedLetter, tag)
end

function isWordComplete(wordLetters)
    for i, word in ipairs(wordLetters) do
        if not word.found then return false end
    end
    return true
end

function initClickHandler(miniGameState)
    -- Gets arguments from EventHandler in StarterPack
    function brickClickHandler(player, clickedLetter)
        handleBrick(clickedLetter, miniGameState)
    end
    clickBlockEvent.OnServerEvent:Connect(brickClickHandler)
end

function handleBrick(clickedLetter, miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local words = miniGameState.words

    if isDeadLetter(clickedLetter) then return end

    if not miniGameState.gemsStarted then
        LetterFallUtils.anchorLetters({
            parentFolder = runTimeLetterFolder,
            anchor = false
        })

        miniGameState.gemsStarted = true
    end

    local isChild = clickedLetter:IsDescendantOf(letterFallFolder)
    if not isChild then return {} end

    local availLetters = LetterFallUtils.getAvailLettersDict(
                             {
            words = words,
            currentLetterIndex = miniGameState.currentLetterIndex
        })

    local newWordBase = Utils.getFirstDescendantByName(letterFallFolder,
                                                       "NewWordBase")

    if isDesiredLetter(availLetters, clickedLetter) then
        miniGameState.currentLetterIndex = miniGameState.currentLetterIndex + 1

        local positionX = -newWordBase.Size.X / 2 + clickedLetter.Size.X *
                              #miniGameState.foundLetters
        local positionY = -clickedLetter.Size.Y * #miniGameState.foundWords *
                              1.1

        local endPosition = newWordBase.Position +
                                Vector3.new(-positionX, positionY, 0)
        Utils3.tween({
            part = clickedLetter,
            endPosition = endPosition,
            time = 0.3,
            anchor = true
        })
        clickedLetter.CanCollide = false

        CS:AddTag(clickedLetter, LetterFallUtils.tagNames.Found)
        -- LetterFallUtils.setStyleToFound(clickedLetter)
        table.insert(miniGameState.foundLetters,
                     LetterFallUtils.getCharFromLetterBlock(clickedLetter))

        local currentWord = table.concat(miniGameState.foundLetters, "")
        local found = table.find(words, currentWord)
        if (found) then
            table.insert(miniGameState.foundWords, currentWord)
            miniGameState.foundLetters = {}
            miniGameState.currentLetterIndex = 1
        end
        LetterFallUtils.styleLetterBlocks(miniGameState)

    end
end

module.initClickHandler = initClickHandler
return module
