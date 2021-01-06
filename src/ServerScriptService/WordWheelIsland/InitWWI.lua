local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
-- local LetterFall = require(Sss.Source.LetterFall.LetterFall)
-- local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
-- local HandleClick = require(Sss.Source.LetterFall.HandleClick)
-- local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
local InitWord = require(Sss.Source.WordWheelIsland.InitWord)

local module = {}

function initWWIStatue()
    -- 
end

function configStatue(props)
    -- 

end

function initWWI()
    local myStuff = workspace:FindFirstChild("MyStuff")
    local runtimeWWIFolder = Utils.getOrCreateFolder(
                                 {name = "WWIRuntime", parent = myStuff})

    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")

    local statuePositioners = Utils.getDescendantsByName(myStuff,
                                                         "StatuePositioner")
    local statueTemplate = Utils.getFirstDescendantByName(wordWheelIsland,
                                                          "StatueTemplate")

    local statusDefs = {
        {sentence = {"YES", "MOM", "OK", "MOM"}, character = "raven"},
        {sentence = {"NOT", "A", "CAT"}, character = "katScared"},
        {sentence = {"TROLL", "NEED", "GOLD"}, character = "troll02"},
        {sentence = {"I", "SEE", "A", "BEE"}, character = "lizFunny"}
    }

    for statueIndex, statusDef in ipairs(statusDefs) do
        local sentence = statusDef.sentence
        local character = statusDef.character

        local statuePositioner = statuePositioners[statueIndex]
        local newStatueScene = statueTemplate:Clone()
        newStatueScene.Parent = statuePositioner.Parent
        newStatueScene.PrimaryPart.CFrame = statuePositioner.CFrame
        newStatueScene.PrimaryPart.Anchored = true

        local sentencePositioner = Utils.getFirstDescendantByName(
                                       newStatueScene, "SentencePositioner")

        local wordGirl = Utils.getFirstDescendantByName(newStatueScene,
                                                        "WordGirl")
        local characterImage = Utils.getFirstDescendantByName(wordGirl,
                                                              "CharacterImage")

        Utils.applyDecalsToCharacter({part = characterImage, word = character})

        local wordLetters = {}

        configStatue()
        for wordIndex, word in ipairs(sentence) do

            local wordProps = {
                wordIndex = wordIndex,
                wordLetters = wordLetters,
                word = word
            }

            local newWordObj = InitWord.initWord(wordProps)
        end

        sentencePositioner:Destroy()
    end
    -- LetterFall.initGameToggle(miniGameState)
    -- InitLetterRack.initLetterRack(miniGameState)
    -- InitWord.initWords(miniGameState)

    -- LetterFallUtils.styleLetterBlocks({
    --     miniGameState = miniGameState,
    --     availWords = miniGameState.words
    -- })
end

module.initWWI = initWWI

return module

