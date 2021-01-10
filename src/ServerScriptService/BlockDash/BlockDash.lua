local module = {}
local CS = game:GetService("CollectionService")
local Sss = game:GetService("ServerScriptService")

local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local HandleClick = require(Sss.Source.BlockDash.HandleClick)
local InitLetterRack = require(Sss.Source.BlockDash.InitLetterRack)

local module = {}
module.state = {

    gridLetters = {},
    arrows = {},
    activeLetter = {},
    targetWord = {targetLetters = {}}

}

local allLetters = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
    'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
}

local miniGameState = {
    activeWord = nil,
    activeWordIndex = 1,
    allLetters = allLetters,
    availLetters = {},
    availWords = {},
    currentLetterIndex = 1,
    foundLetters = {},
    foundWords = {},
    initCompleted = false,
    renderedWords = {},
    wordLetters = {},
    activeLetterPosition = {row = 1, col = 1},
    words = words,
    questIndex = questIndex,
    rackLetterBlockObjs = {},
    numRow = 10,
    numCol = 10,
    activeStyle = "LBPurpleLight",
    inActiveStyle = "LBPurpleOrange"
}

local miniGame = {}

function styleActiveLetter(props)
    local active = props.active
    local activeLetter = getActiveLetter(miniGameState)
    LetterFallUtils.applyStyleFromTemplate(
        {
            targetLetterBlock = activeLetter.part,
            templateName = active and miniGameState.activeStyle or
                miniGameState.inActiveStyle,
            miniGameState = miniGameState
        })
end

function addBlockDash(props)
    print('addBlockDash' .. ' - start');
    print(addBlockDash);
    -- local questBlockModel = props.questBlockModel

    local myStuff = workspace:FindFirstChild("MyStuff")

    miniGameState.words = props.words
    miniGameState.miniGameFolder = Utils.getFirstDescendantByName(myStuff,
                                                                  "BlockDash")

    -- styleActiveLetter({active = true})
    return initBlockDash(miniGameState)
end

function initBlockDash(miniGameState)
    HandleClick.initClickHandler(miniGameState)
    InitLetterRack.initLetterRack(miniGameState)
    -- InitWord.initWords(miniGameState)

    -- LetterFallUtils.styleLetterBlocks({
    --     miniGameState = miniGameState,
    --     availWords = miniGameState.words
    -- })
end

module.addBlockDash = addBlockDash
return module

