local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
-- local LetterFall = require(Sss.Source.LetterFall.LetterFall)
-- local LetterFallUtils = require(Sss.Source.LetterFall.LetterFallUtils)
-- local HandleClick = require(Sss.Source.LetterFall.HandleClick)
-- local InitLetterRack = require(Sss.Source.LetterFall.InitLetterRack)
-- local InitWord = require(Sss.Source.LetterFall.InitWord)

local module = {}

function initWWI(miniGameState)

    local myStuff = workspace:FindFirstChild("MyStuff")
    local runtimeQuestsFolder = Utils.getOrCreateFolder(
                                    {name = "WWIRuntime", parent = myStuff})

    local wordWheelIsland = Utils.getFirstDescendantByName(myStuff,
                                                           "WordWheelIsland")
    local sentencePositioner = Utils.getFirstDescendantByName(myStuff,
                                                              "SentencePositioner")

    print('sentencePositioner' .. ' - start');
    print(sentencePositioner);

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

