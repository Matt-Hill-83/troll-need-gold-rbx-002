local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local InitLetterFall = require(Sss.Source.LetterFall.InitLetterFall)

local module = {}

function module.addMiniGame(props)
    local clonedScene = props.clonedScene
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local isStartScene = props.isStartScene
    local letterFallTemplate = props.letterFallTemplate
    local words = props.words

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
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
        letterBlockTemplateFolder = nil,
        renderedWords = {},
        wordLetters = {},
        words = words
    }

    if (isStartScene) then
        local clonedLetterFallModel = letterFallTemplate:Clone()
        clonedLetterFallModel.Name = clonedLetterFallModel.Name .. "Clone" ..
                                         "-Q" .. questIndex .. "-S" ..
                                         sceneIndex

        local letterFallFolder = Utils.getFirstDescendantByName(
                                     clonedLetterFallModel, "LetterFallFolder")
        local letterBlockTemplateFolder =
            Utils.getFirstDescendantByName(letterFallFolder,
                                           "LetterBlockTemplates")
        miniGameState.letterBlockTemplateFolder = letterBlockTemplateFolder
        clonedLetterFallModel.Parent = clonedScene

        clonedLetterFallModel.PrimaryPart.CFrame =
            clonedScene.PrimaryPart.CFrame + Vector3.new(25, 50, 50)
        clonedLetterFallModel.PrimaryPart.Anchored = true

        miniGameState.letterFallFolder = letterFallFolder
        InitLetterFall.initLetterFall(miniGameState)
    end
end

return module
