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

    for statueIndex, statuePositioner in ipairs(statuePositioners) do

        local newStatueScene = statueTemplate:Clone()
        newStatueScene.Parent = statuePositioner.Parent
        newStatueScene.PrimaryPart.CFrame =
            statuePositioner.CFrame + Vector3.new(5, 5, 5)

        local sentencePositioner = Utils.getFirstDescendantByName(
                                       newStatueScene, "SentencePositioner")

        print('sentencePositioner' .. ' - start');
        print(sentencePositioner);

        local word = "CATAPILLAR"

        local sentence = {"A", "CAT", "DOG"}
        -- local sentence = {"OK", "MOM", "YES", "MOM"}
        local wordLetters = {}

        for wordIndex, word in ipairs(sentence) do

            local wordProps = {
                wordIndex = wordIndex,
                wordLetters = wordLetters,
                word = word
            }

            local newWordObj = InitWord.initWord(wordProps)

            print('newWordObj' .. ' - start');
            print(newWordObj);
            -- local newWord = InitWord.initWord()
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

