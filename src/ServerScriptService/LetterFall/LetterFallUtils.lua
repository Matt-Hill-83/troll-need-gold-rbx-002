local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

local module = {
    tagNames = {
        WordLetter = "WordLetter",
        LetterBlock = "LetterBlock",
        LetterBlockInRack = "LetterBlockInRack",
        DeadLetter = "DeadLetter",
        AvailLetter = "AvailLetter",
        Found = "Found",
        NotDeadLetter = "NotDeadLetter"
    }
}

function styleLetterBlock(letterBlock, labelProps)
    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        Utils.mergeTables(label, labelProps)
    end
end

function setStyleToFound(letterBlock)
    local labelProps = {
        TextColor3 = Color3.new(255, 0, 191),
        BorderColor3 = Color3.new(255, 0, 191),
        BackgroundColor3 = Color3.fromRGB(242, 193, 165)
    }
    styleLetterBlock(letterBlock, labelProps)
end

function applyStyleFromTemplate(props)

    local targetLetterBlock = props.targetLetterBlock
    local templateName = props.templateName
    local templateFolder = props.templateFolder

    local template =
        Utils.getFirstDescendantByName(templateFolder, templateName)
    local label = Utils.getFirstDescendantByName(template, "BlockChar")

    print('label' .. ' - start');
    print(label);

    local labelProps = {
        TextColor3 = label.TextColor3,
        BorderColor3 = label.BorderColor3,
        BackgroundColor3 = label.BackgroundColor3
    }
    styleLetterBlock(targetLetterBlock, labelProps)
end

-- function setStyleToWordLetter(letterBlock)
--     local labelProps = {
--         TextColor3 = Color3.new(255, 0, 191),
--         BorderColor3 = Color3.new(255, 0, 191),
--         BackgroundColor3 = Color3.fromRGB(242, 193, 165)
--     }

--     letterBlock.Transparency = 1
--     styleLetterBlock(letterBlock, labelProps)
-- end

function setStyleToAvailable(letterBlock)
    -- 
    -- 
    -- 
    if true then return end
    module.colorLetterText({
        letterBlock = letterBlock,
        color = Color3.fromRGB(78, 242, 86)
    })
    module.colorLetterBorder({
        letterBlock = letterBlock,
        color = Color3.fromRGB(78, 242, 86)
    })

end

function setStyleToNotAvailable(letterBlock)
    -- 
    -- 
    -- 
    if true then return end

    module.colorLetterText({
        letterBlock = letterBlock,
        color = Color3.fromRGB(148, 9, 9)
        -- color = Color3.fromRGB(113, 95, 95)
    })
    module.colorLetterBorder({
        letterBlock = letterBlock,
        color = Color3.fromRGB(0, 0, 255)
        -- color = Color3.fromRGB(167, 139, 139)
    })
end

-- figure out style from template
-- figure out style from template
-- figure out style from template
-- figure out style from template
function styleLetterBlocks(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local availLetters = module.getAvailLettersDict(
                             {
            words = miniGameState.words,
            currentLetterIndex = miniGameState.currentLetterIndex
        })

    local allLetters = module.getAllLettersInRack()

    for i, letterBlock in ipairs(allLetters) do
        local letterBlockFolder = Utils.getFirstDescendantByName(
                                      letterFallFolder, "LetterBlockTemplates")

        if CS:HasTag(letterBlock, module.tagNames.Found) then

            module.applyStyleFromTemplate(
                {
                    targetLetterBlock = letterBlock,
                    templateName = "LBDarkPurple",
                    -- templateName = "LBWordLetter",
                    templateFolder = letterBlockFolder
                })

        else
            local char = module.getCharFromLetterBlock(letterBlock)
            if availLetters[char] then
                setStyleToAvailable(letterBlock)
            else
                setStyleToNotAvailable(letterBlock)
            end
        end
    end
end

function positionActiveWord(props)
    local miniGameState = props.miniGameState
    local letterFallFolder = miniGameState.letterFallFolder

    local activeWordPositioner = Utils.getFirstDescendantByName(
                                     letterFallFolder, "ActiveWordPositioner")

    local newActiveWord =
        miniGameState.renderedWords[miniGameState.activeWordIndex + 0]

    local part = newActiveWord.word.PrimaryPart
    part.CFrame = activeWordPositioner.CFrame
end

function colorLetterText(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do label.TextColor3 = color end
end

function colorLetterBorder(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        label.BorderColor3 = color or Color3.new(255, 0, 191)
    end
end

function getCharFromLetterBlock(letterBlock)
    return Utils.getFirstDescendantByName(letterBlock, "BlockChar").Text
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
        module.applyLetterText({letterBlock = item, char = ""})
    end
end

-- 
-- 
function getAvailLetters(props)
    local words = props.words
    local currentLetterIndex = props.currentLetterIndex

    local availLettersDict = {}
    for i, word in ipairs(words) do
        local letter = string.sub(word, currentLetterIndex, currentLetterIndex)
        availLettersDict[letter] = true
    end
    return Utils.getKeysFromDict(availLettersDict)
end

function getAvailLettersDict(props)
    local words = props.words
    local currentLetterIndex = props.currentLetterIndex

    local availLettersDict = {}
    for i, word in ipairs(words) do
        local letter = string.sub(word, currentLetterIndex, currentLetterIndex)
        availLettersDict[letter] = true
    end
    return availLettersDict
end

function configAvailLetters(props)
    local parentFolder = props.parentFolder

    local availLetters = Utils.getByTagInParent(
                             {
            parent = parentFolder,
            tag = module.tagNames.AvailLetter
        })

    for i, item in ipairs(availLetters) do
        module.colorLetterText({
            letterBlock = item,
            color = Color3.fromRGB(255, 0, 238)
        })
        module.colorLetterBG({
            letterBlock = item,
            color = Color3.fromRGB(0, 255, 34)
        })
    end
end

function anchorLetters(props)
    local parentFolder = props.parentFolder
    local anchor = props.anchor

    local letters = Utils.getByTagInParent(
                        {
            parent = parentFolder,
            tag = module.tagNames.NotDeadLetter
        })

    for i, item in ipairs(letters) do
        item.Anchored = anchor
        -- 
    end

end

function getAllLettersInRack(props)
    local letters = Utils.getByTagInParent(
                        {
            parent = parentFolder,
            tag = module.tagNames.NotDeadLetter
        })

    return letters
end

module.anchorLetters = anchorLetters
module.applyLetterText = applyLetterText
module.colorLetterBG = colorLetterBG
module.colorLetterText = colorLetterText
module.configDeadLetters = configDeadLetters
module.createBalls = createBalls
module.getAllLettersInRack = getAllLettersInRack
module.getAvailLetters = getAvailLetters
module.getCharFromLetterBlock = getCharFromLetterBlock
module.isDesiredLetter = isDesiredLetter
module.isWordComplete = isWordComplete
module.positionActiveWord = positionActiveWord
module.getAvailLettersDict = getAvailLettersDict
module.colorLetterBorder = colorLetterBorder
module.styleLetterBlocks = styleLetterBlocks
module.setStyleToFound = setStyleToFound
module.applyStyleFromTemplate = applyStyleFromTemplate
-- module.setStyleToWordLetter = setStyleToWordLetter
return module
