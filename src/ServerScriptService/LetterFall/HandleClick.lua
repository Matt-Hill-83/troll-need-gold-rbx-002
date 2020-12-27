local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local RS = game:GetService("ReplicatedStorage")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Constants = require(Sss.Source.Constants.Constants)
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local clickBlockEvent = RS:WaitForChild("ClickBlockRE")

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

-- function isWordComplete(wordLetters)
--     for i, word in ipairs(wordLetters) do
--         if not word.found then return false end
--     end
--     return true
-- end

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

    if isDesiredLetter(availLetters, clickedLetter) then
        miniGameState.currentLetterIndex = miniGameState.currentLetterIndex + 1
        CS:AddTag(clickedLetter, LetterFallUtils.tagNames.Found)

        local foundChar = LetterFallUtils.getCharFromLetterBlock(clickedLetter)
        local foundWord = nil
        local foundLetter = nil

        for wordIndex, word in ipairs(miniGameState.renderedWords) do
            if foundWord then break end
            for letterIndex, letter in ipairs(word.letters) do
                if foundWord then break end
                if foundChar == letter.char then
                    foundWord = word
                    foundLetter = letter
                end
            end
        end

        local targetLetterBlock = foundLetter.instance

        local tween = Utils3.tween({
            part = clickedLetter,
            endPosition = foundLetter.instance.Position,
            time = 0.4,
            anchor = true
        })

        Utils.hideItemAndChildren({item = foundLetter.instance, hide = true})

        table.insert(miniGameState.foundLetters,
                     LetterFallUtils.getCharFromLetterBlock(clickedLetter))

        local currentWord = table.concat(miniGameState.foundLetters, "")
        local found = table.find(words, currentWord)

        if (found) then
            local soundId = Constants.soundIds[currentWord]
            if (false and soundId) then
                local sound = Instance.new("Sound", workspace)
                sound.SoundId = "rbxassetid://" .. soundId
                sound.EmitterSize = 5
                sound.Looped = false
                if not sound.IsPlaying then sound:Play() end
            end

            table.insert(miniGameState.foundWords, currentWord)
            miniGameState.foundLetters = {}
            miniGameState.currentLetterIndex = 1
        end
        LetterFallUtils.styleLetterBlocks(miniGameState)

        clickedLetter.CFrame = targetLetterBlock.CFrame
    end
end

module.initClickHandler = initClickHandler
return module
