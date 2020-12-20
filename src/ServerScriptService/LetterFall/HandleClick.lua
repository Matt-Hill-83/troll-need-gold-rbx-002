local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local InitWord = require(Sss.Source.LetterFall.InitWord)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {gemsStarted = false}

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
    remoteEvent.OnServerEvent:Connect(brickClickHandler)
end

function handleBrick(player, clickedLetter, miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordLetters = miniGameState.wordLetters

    if not module.gemsStarted then

        LetterFallUtils.createBalls(miniGameState)
        module.gemsStarted = true
    end

    -- local ballPitBottom = Utils.getFirstDescendantByName(letterFallFolder,
    --                                                      "BallPitBottom")
    -- if ballPitBottom then ballPitBottom:Destroy() end
    local isChild = clickedLetter:IsDescendantOf(letterFallFolder)
    if not isChild then return {} end
    for i, letter in ipairs(wordLetters) do
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true
            LetterFallUtils.colorLetterText(
                {
                    letterBlock = letter.instance,
                    color = Color3.fromRGB(113, 17, 161)
                })
            clickedLetter:Destroy()
            local wordComplete = isWordComplete(wordLetters)
            if wordComplete then
                miniGameState.lastWordIndex = miniGameState.lastWordIndex + 1
                InitWord.initWord(miniGameState)
            end
            break
        end
    end
end

module.initClickHandler = initClickHandler
return module
