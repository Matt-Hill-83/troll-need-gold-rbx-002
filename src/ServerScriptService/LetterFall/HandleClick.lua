local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local RS = game:GetService("ReplicatedStorage")
local clickBlockEvent = RS:WaitForChild("ClickBlockRE")
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

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
    -- Gets arguments from EventHandler in StarterPack
    function brickClickHandler(player, clickedLetter)
        handleBrick(player, clickedLetter, miniGameState)
    end
    clickBlockEvent.OnServerEvent:Connect(brickClickHandler)
end

function handleBrick(player, clickedLetter, miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder

    if not miniGameState.gemsStarted then
        LetterFallUtils.configDeadLetters({parentFolder = runTimeLetterFolder})
        miniGameState.gemsStarted = true
    end

    local isChild = clickedLetter:IsDescendantOf(letterFallFolder)
    if not isChild then return {} end

    local activeWord =
        miniGameState.renderedWords[miniGameState.activeWordIndex]
    local letters = activeWord.letters

    local currentActiveWord = activeWord.word.PrimaryPart

    for i, letter in ipairs(letters) do
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true
            LetterFallUtils.colorLetterText(
                {
                    letterBlock = letter.instance,
                    color = Color3.fromRGB(113, 17, 161)
                })
            clickedLetter:Destroy()

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
