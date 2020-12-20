local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(miniGameState)

    -- O-WeldPlate need to have a weld to the base called "BaseWeld"
    -- O-WeldPlate need to have a weld to the base called "BaseWeld"
    -- O-WeldPlate need to have a weld to the base called "BaseWeld"
    -- O-WeldPlate need to have a weld to the base called "BaseWeld"
    local letterFallFolder = miniGameState.letterFallFolder
    local wordFolder = getWordFolder(miniGameState)

    local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                         "WordBoxFolder")

    for i, letter in ipairs(miniGameState.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        miniGameState.wordLetters[i] = nil
    end
    Utils.clearTable(miniGameState.wordLetters)

    for wordIndex, word in ipairs(miniGameState.words) do
        local newWordBoxFolder = wordBoxFolder:Clone()
        newWordBoxFolder.Parent = wordBoxFolder.Parent
        local letterBlockTemplate = Utils.getFirstDescendantByName(
                                        newWordBoxFolder, "LetterBlockTemplate")

        Utils.hideItemAndChildren({item = letterBlockTemplate, hide = true})

        local spacingFactor = 1.25
        local wordSpacingY = letterBlockTemplate.Size.Y * spacingFactor

        local weldPlate = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                         "O-WeldPlate")

        local baseWeld = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                        "BaseWeld")
        if baseWeld then baseWeld.Enabled = false end

        local newWordBox = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                          "WordBox")

        newWordBox.PrimaryPart.CFrame = newWordBox.PrimaryPart.CFrame +
                                            Vector3.new(0, wordSpacingY *
                                                            wordIndex, 0)

        newWordBox.Name = newWordBox.Name .. "zzz" .. wordIndex
        newWordBox.PrimaryPart.Anchored = true

        local letterPositioner = Utils.getFirstDescendantByName(
                                     newWordBoxFolder,
                                     "WordLetterBlockPositioner")

        letterPositioner.Name = letterPositioner.Name .. "-" .. wordIndex

        letterBlockTemplate.Transparency = 1
        local spacingFactor = 1.05

        for letterIndex = 1, #word do
            local letter = string.sub(word, letterIndex, letterIndex + 0)
            local newLetter = letterBlockTemplate:Clone()
            Utils.hideItemAndChildren({item = newLetter, hide = false})
            newLetter.Name = "wordLetter-" .. letterIndex
            newLetter.Transparency = 0

            local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
            letterPositioner.Transparency = 1

            CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
            LetterFallUtils.applyLetterText(
                {letterBlock = newLetter, char = letter})
            LetterFallUtils.colorLetterText(
                {letterBlock = newLetter, color = Color3.new(255, 0, 191)})

            newLetter.CFrame = letterPositioner.CFrame *
                                   CFrame.new(Vector3.new(0, 0, z))
            -- Do this last to avoid tweening
            newLetter.Parent = wordFolder
            table.insert(miniGameState.wordLetters,
                         {char = letter, found = false, instance = newLetter})

        end
        -- newWordBox.PrimaryPart.Anchored = true
    end
    wordBoxFolder:Destroy()
end

function getWordFolder(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RunTimeFolder",
            parent = letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "RunTimeWordBoxFolder",
        parent = runtimeFolder
    }))
end

module.initGameToggle = initGameToggle
module.initLetterRack = initLetterRack
module.initWord = initWord

return module
