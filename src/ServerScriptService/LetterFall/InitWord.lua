local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)

local module = {}

function initWord(miniGameState)
    local letterFallFolder = miniGameState.letterFallFolder
    local wordFolder = getWordFolder(miniGameState)
    -- local word = miniGameState.words[miniGameState.lastWordIndex]

    local words2 = {miniGameState.words[1], miniGameState.words[2]}
    local wordBoxFolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                         "WordBoxFolder")

    for wordIndex, word in ipairs(words2) do
        -- for i, word in ipairs(miniGameState.words) do
        --    
        --    
        local newWordBoxFolder = wordBoxFolder:Clone()
        newWordBoxFolder.Parent = wordBoxFolder.Parent
        local letterBlockTemplate = Utils.getFirstDescendantByName(
                                        newWordBoxFolder, "LetterBlockTemplate")

        local baseWeld = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                        "BaseWeld")

        print('baseWeld' .. ' - start');
        print(baseWeld);
        baseWeld.Enabled = false
        local newWordBox = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                          "WordBox")

        -- local welds = Utils.getDescendantsByType(newWordBox, "Weld")
        -- for i, weld in ipairs(welds) do
        --     weld.Enabled = false
        --     -- 
        -- end

        for i, letter in ipairs(miniGameState.wordLetters) do
            if letter.instance then letter.instance:Destroy() end
            miniGameState.wordLetters[i] = nil
        end
        Utils.clearTable(miniGameState.wordLetters)

        newWordBox.PrimaryPart.CFrame = newWordBox.PrimaryPart.CFrame +
                                            Vector3.new(0, 20 * wordIndex, 0)

        newWordBox.Name = newWordBox.Name .. "zzz" .. wordIndex
        local weldPlate = Utils.getFirstDescendantByName(newWordBoxFolder,
                                                         "O-WeldPlate")

        local letterPositioner = Utils.getFirstDescendantByName(
                                     newWordBoxFolder,
                                     "WordLetterBlockPositioner")

        letterPositioner.Name = letterPositioner.Name .. "-" .. wordIndex
        print('letterPositioner.Name' .. ' - start');
        print(letterPositioner.Name);

        letterBlockTemplate.Transparency = 1
        local spacingFactor = 1.05

        Utils.enableChildWelds({part = letterBlockTemplate, enabled = false})

        -- for letterIndex = 1, #word do
        --     local letter = string.sub(word, letterIndex, letterIndex + 0)
        --     local newLetter = letterBlockTemplate:Clone()
        --     newLetter.Name = "wordLetter-" .. letterIndex
        --     newLetter.Transparency = 0
        --     Utils.enableChildWelds({part = newLetter, enable = true})

        --     local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
        --     letterPositioner.Transparency = 1

        --     CS:AddTag(newLetter, LetterFallUtils.tagNames.WordLetter)
        --     LetterFallUtils.applyLetterText(
        --         {letterBlock = newLetter, char = letter})
        --     LetterFallUtils.colorLetterText(
        --         {letterBlock = newLetter, color = Color3.new(255, 0, 191)})

        --     newLetter.CFrame = letterPositioner.CFrame *
        --                            CFrame.new(Vector3.new(0, 0, z))
        --     -- Do this last to avoid tweening
        --     newLetter.Parent = wordFolder
        --     table.insert(miniGameState.wordLetters,
        --                  {char = letter, found = false, instance = newLetter})

        -- end
        baseWeld.Enabled = true
        newWordBox.PrimaryPart.Anchored = true
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
