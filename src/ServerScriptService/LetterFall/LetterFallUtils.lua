local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local Constants = require(Sss.Source.Constants.Constants)
local module = {
    tagNames = {
        WordLetter = "WordLetter",
        LetterBlock = "LetterBlock",
        RackLetter = "RackLetter",
        DeadLetter = "DeadLetter",
        AvailLetter = "AvailLetter",
        Found = "Found",
        NotDeadLetter = "NotDeadLetter"
    }
}

module.letterBlockStyleNames = {
    LBPinkPurple = "LBPinkPurple",
    LBPurpleOrange = "LBPurpleOrange",
    LBPurpleLight = "LBPurpleLight",
    LBPurpleLight2 = "LBPurpleLight2",
    LBDarkPurple = "LBDarkPurple",
    LBDeadLetter = "LBDeadLetter"
}

module.letterBlockStyleDefs = {
    rack = {
        Available = module.letterBlockStyleNames.LBPurpleLight2,
        NotAvailable = module.letterBlockStyleNames.LBPurpleLight,
        Found = module.letterBlockStyleNames.LBPurpleOrange,
        DeadLetter = module.letterBlockStyleNames.LBDeadLetter
    },
    word = {
        Placeholder = module.letterBlockStyleNames.LBPurpleLight,
        Found = module.letterBlockStyleNames.LBPurpleOrange
    }
}

function filterItemsByTag(props)
    local items = props.items
    local tag = props.tag
    local include = props.include

    local output = {}
    for i, item in ipairs(items) do

        if include then
            if CS:hasTag(item, tag) then table.insert(output, item) end
        end

        if not include then
            if not CS:hasTag(item, tag) then
                table.insert(output, item)
            end
        end
    end
    return output
end

function getCoordsFromLetterName(name)
    local pattern = "ID%-%-R(%d+)C(%d+)"
    local row, col = string.match(name, pattern)
    return {row = tonumber(row), col = tonumber(col)}
end

function anchorColumn(props)
    local anchor = props.anchor
    local col = props.col
    local letters = props.letters

    for i, letter in ipairs(letters) do
        local coords = module.getCoordsFromLetterName(letter.Name)

        if tonumber(coords.col) == tonumber(col) then
            letter.Anchored = false
        end
    end
end

function styleLetterBlock(letterBlock, labelProps)
    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        Utils.mergeTables(label, labelProps)
    end
end

function applyStyleFromTemplate(props)
    local targetLetterBlock = props.targetLetterBlock
    local templateName = props.templateName
    local miniGameState = props.miniGameState

    local letterBlockTemplateFolder = miniGameState.letterBlockTemplateFolder

    local template = Utils.getFirstDescendantByName(letterBlockTemplateFolder,
                                                    templateName)
    local label = Utils.getFirstDescendantByName(template, "BlockChar")

    local labelProps = {
        TextColor3 = label.TextColor3,
        BorderColor3 = label.BorderColor3,
        BackgroundColor3 = label.BackgroundColor3
    }

    styleLetterBlock(targetLetterBlock, labelProps)
end

function setStyleToAvailable(letterBlock, miniGameState)
    module.applyStyleFromTemplate({
        targetLetterBlock = letterBlock,
        templateName = module.letterBlockStyleDefs.rack.Available,
        miniGameState = miniGameState
    })
end

function setStyleToNotAvailable(letterBlock, miniGameState)
    module.applyStyleFromTemplate({
        targetLetterBlock = letterBlock,
        templateName = module.letterBlockStyleDefs.rack.NotAvailable,
        miniGameState = miniGameState
    })
end

function setStyleToDeadLetter(letterBlock, miniGameState)
    module.applyStyleFromTemplate({
        targetLetterBlock = letterBlock,
        templateName = module.letterBlockStyleDefs.rack.DeadLetter,
        miniGameState = miniGameState
    })
end

function styleLetterBlocks(props)
    local miniGameState = props.miniGameState
    local availWords = props.availWords
    print('availWords' .. ' - start');
    print(availWords);
    local letterFallFolder = miniGameState.letterFallFolder
    local letterBlockTemplateFolder = miniGameState.letterBlockTemplateFolder
    local availLetters = module.getAvailLettersDict(
                             {
            words = availWords,
            currentLetterIndex = miniGameState.currentLetterIndex
        })
    print('availLetters' .. ' - start');
    print(availLetters);
    local allLetters = module.getAllLettersInRack()

    for i, letterBlock in ipairs(allLetters) do
        if CS:HasTag(letterBlock, module.tagNames.Found) then
            module.applyStyleFromTemplate(
                {
                    targetLetterBlock = letterBlock,
                    templateName = module.letterBlockStyleDefs.rack.Found,
                    miniGameState = miniGameState
                })
        else
            local char = module.getCharFromLetterBlock(letterBlock)
            if availLetters[char] then
                setStyleToAvailable(letterBlock, miniGameState)
            else
                setStyleToNotAvailable(letterBlock, miniGameState)
            end
        end
    end
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
    local miniGameState = props.miniGameState

    local deadLetters = Utils.getByTagInParent(
                            {
            parent = parentFolder,
            tag = module.tagNames.DeadLetter
        })

    for i, item in ipairs(deadLetters) do
        item.Anchored = true

        module.applyStyleFromTemplate({
            targetLetterBlock = item,
            templateName = module.letterBlockStyleDefs.rack.DeadLetter,
            miniGameState = miniGameState
        })
        module.applyLetterText({letterBlock = item, char = ""})
    end
end

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
module.getAvailLettersDict = getAvailLettersDict
module.colorLetterBorder = colorLetterBorder
module.styleLetterBlocks = styleLetterBlocks
module.applyStyleFromTemplate = applyStyleFromTemplate
module.anchorColumn = anchorColumn
module.getCoordsFromLetterName = getCoordsFromLetterName
module.filterItemsByTag = filterItemsByTag
return module
