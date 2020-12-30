local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local InitLetterFall = require(Sss.Source.LetterFall.InitLetterFall)

local module = {}

function module.addMiniGame(props)
    local parent = props.parent
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local isStartScene = props.isStartScene
    local words = props.words
    local positionOffset = props.positionOffset or Vector3.new(0, 0, 0)

    local letterFallTemplate = Utils.getFromTemplates("LetterFallTemplate")

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

    local miniGame = {}

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
        clonedLetterFallModel.Parent = parent

        local letterFallPart = clonedLetterFallModel.PrimaryPart

        -- local offsetX = 0
        -- local offsetY = -(letterFallPart.Size.Y - parent.Size.Y) / 2 - 4
        -- local offsetZ = -(letterFallPart.Size.Z - parent.Size.Z) / 2

        -- local offsetCFrame = CFrame.new(offsetX, offsetY, offsetZ)
        -- letterFallPart.CFrame = parent.CFrame:ToWorldSpace(offsetCFrame)

        local translateCFrameProps = {
            parent = parent,
            child = letterFallPart,
            offsetConfig = {
                useParentNearEdge = Vector3.new(0, 1, 1),
                useChildNearEdge = Vector3.new(0, 1, 1),
                offsetAdder = Vector3.new(0, 2, 0)
            }
        }

        local newCFrame = Utils3.setCFrameFromDesiredEdgeOffset(
                              translateCFrameProps)

        letterFallPart.CFrame = newCFrame
        letterFallPart.Anchored = true

        miniGameState.letterFallFolder = letterFallFolder
        InitLetterFall.initLetterFall(miniGameState)
        miniGame = clonedLetterFallModel
    end

    return miniGame
end

return module
