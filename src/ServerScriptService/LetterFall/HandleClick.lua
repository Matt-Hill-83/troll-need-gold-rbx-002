local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local RS = game:GetService("ReplicatedStorage")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local clickBlockEvent = RS:WaitForChild("ClickBlockRE")
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function isDesiredLetter(letter, clickedLetter)
    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    return letter.found ~= true and letter.char == textLabel
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

    -- 
    -- 
    -- 

    local allLetters = LetterFallUtils.getAllLettersInRack()
    print('allLetters' .. ' - start');
    print(allLetters);

    local availLetters = LetterFallUtils.getAvailLettersDict(
                             {
            words = miniGameState.words,
            currentLetterIndex = miniGameState.currentLetterIndex
        })

    print('availLetters' .. ' - start');
    print(availLetters);

    for i, letter in ipairs(allLetters) do
        local char = LetterFallUtils.getCharFromLetterBlock(letter)
        if availLetters[char] then
            LetterFallUtils.colorLetterText(
                {letterBlock = letter, color = Color3.fromRGB(0, 0, 0)})
            LetterFallUtils.colorLetterBorder(
                {letterBlock = letter, color = Color3.fromRGB(0, 0, 0)})
        end
    end

    -- 
    -- 
    -- 
    local isChild = clickedLetter:IsDescendantOf(letterFallFolder)
    if not isChild then return {} end

    local activeWord =
        miniGameState.renderedWords[miniGameState.activeWordIndex]
    local letters = activeWord.letters

    local currentActiveWord = activeWord.word.PrimaryPart

    local newWordBase = Utils.getFirstDescendantByName(letterFallFolder,
                                                       "NewWordBase")

    for i, letter in ipairs(letters) do
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true
            LetterFallUtils.colorLetterText(
                {
                    letterBlock = letter.instance,
                    color = Color3.fromRGB(113, 17, 161)
                })

            Utils3.tween({
                part = clickedLetter,
                endPosition = newWordBase.Position,
                time = 0.2,
                anchor = true
            })

            local wordComplete = isWordComplete(letters)
            if wordComplete then
                local completedWordPositioner =
                    Utils.getFirstDescendantByName(letterFallFolder,
                                                   "CompletedWordPositioner")

                currentActiveWord.CFrame = completedWordPositioner.CFrame

                miniGameState.activeWordIndex =
                    miniGameState.activeWordIndex + 1

                LetterFallUtils.positionActiveWord(
                    {miniGameState = miniGameState})

                for i, letter in ipairs(letters) do
                    LetterFallUtils.colorLetterText(
                        {
                            letterBlock = letter.instance,
                            color = Color3.fromRGB(21, 255, 0)
                        })
                end

            end
            break
        end
    end
end

module.initClickHandler = initClickHandler
return module
