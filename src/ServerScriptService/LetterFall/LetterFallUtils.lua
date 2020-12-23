local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

local module = {
    tagNames = {
        WordLetter = "WordLetter",
        LetterBlock = "LetterBlock",
        DeadLetter = "DeadLetter"
    }
}

function colorLetterText(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        label.TextColor3 = color or Color3.new(255, 0, 191)
    end
end

function colorLetterBG(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        label.BackgroundColor3 = Color3.fromRGB(72, 90, 230)
    end
end

function applyLetterText(props)
    local char = props.char
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do label.Text = char end
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

function createBalls(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local ball = Utils.getFirstDescendantByName(letterFallFolder, "GemTemplate")

    for count = 1, 10 do
        local newBall = ball:Clone()
        newBall.Handle.CFrame = newBall.Handle.CFrame + Vector3.new(-0.1, 0, 0)
        newBall.Parent = ball.Parent
        Utils.enableChildWelds({part = newBall, enabled = false})
    end
    ball:Destroy()
end

function configDeadLetters(props)
    local deadLetters = props.deadLetters
    local parentFolder = props.parentFolder

    local deadLetters = Utils.getByTagInParent(
                            {
            parent = parentFolder,
            tag = module.tagNames.DeadLetter
        })

    for i, item in ipairs(deadLetters) do
        item.Anchored = true

        module.colorLetterText({
            letterBlock = item,
            color = Color3.fromRGB(58, 0, 87)
        })
        module.colorLetterBG({
            letterBlock = item,
            color = Color3.fromRGB(0, 255, 34)
        })
    end
end

module.colorLetterText = colorLetterText
module.applyLetterText = applyLetterText
module.isDesiredLetter = isDesiredLetter
module.isWordComplete = isWordComplete
module.createBalls = createBalls
module.colorLetterBG = colorLetterBG
module.configDeadLetters = configDeadLetters
return module
