local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local InitLetterFall = require(Sss.Source.LetterFall.InitLetterFall)

local module = {}

function module.addMiniGame(props)
    local clonedScene = props.clonedScene
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local isStartScene = props.isStartScene
    local skyBoxTeleporter = props.skyBoxTeleporter

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }

    local miniGameState = {
        allLetters = allLetters,
        wordLetters = {},
        words = {
            {'C', 'A', 'T'}, {'B', 'A', 'T'}, {'H', 'A', 'T'}, {'M', 'A', 'T'},
            {'P', 'A', 'T'}, {'R', 'A', 'T'}, {'S', 'A', 'T'}
        },
        lastWordIndex = 1,
        initCompleted = false
    }

    if (isStartScene) then
        local letterFallModel = Utils.getFromTemplates("LetterFallTemplate")
        local letterFallFolder = Utils.getFirstDescendantByName(letterFallModel,
                                                                "LetterFallFolder")
        print('----------------------------------------->>>');
        print('----------------------------------------->>>');
        print('letterFallModel' .. ' - start');
        print(letterFallModel);

        local newLetterFall = letterFallModel:Clone()
        newLetterFall.Name =
            newLetterFall.Name .. "Clone" .. "-Q" .. questIndex .. "-S" ..
                sceneIndex
        print('newLetterFall' .. ' - start');
        print(newLetterFall);
        newLetterFall.Parent = clonedScene
        newLetterFall.PrimaryPart.CFrame =
            clonedScene.PrimaryPart.CFrame + Vector3.new(0, 80, 0)
        newLetterFall.PrimaryPart.Anchored = true

        miniGameState.letterFallFolder = letterFallFolder
        -- local props = {
        --     miniGameState = miniGameState,
        --     letterFallFolder = letterFallFolder
        -- }
        InitLetterFall.initLetterFall(miniGameState)
    end
end

return module
