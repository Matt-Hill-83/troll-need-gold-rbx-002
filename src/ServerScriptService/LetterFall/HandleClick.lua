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

    -- ------------------------------------------------------------------------

    local availLetters = LetterFallUtils.getAvailLettersDict(
                             {
            words = miniGameState.words,
            currentLetterIndex = miniGameState.currentLetterIndex
        })

    local newWordBase = Utils.getFirstDescendantByName(letterFallFolder,
                                                       "NewWordBase")

    if isDesiredLetter(availLetters, clickedLetter) then
        miniGameState.currentLetterIndex = miniGameState.currentLetterIndex + 1

        Utils3.tween({
            part = clickedLetter,
            endPosition = newWordBase.Position,
            time = 0.2,
            anchor = true
        })

        CS:AddTag(clickedLetter, LetterFallUtils.tagNames.Found)
        LetterFallUtils.styleLetterBlocks(miniGameState)
        LetterFallUtils.setStyleToFound(clickedLetter)
        -- miniGame.let
    end
end

module.initClickHandler = initClickHandler
return module
