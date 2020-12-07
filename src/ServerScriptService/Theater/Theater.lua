local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function module.configTheater(props)
    local sceneFolder = props.sceneFolder
    local sceneIndex = props.sceneIndex

    local players = {1, 2, 3, 4}

    local theaterFolder = Utils.getOrCreateFolder(
                              {name = "Theaterxxx", parent = sceneFolder})

    local theaterTemplate = Utils.getFromMyStuff("TheaterTemplate")
    local benchModel = Utils.getFirstDescendantByName(theaterTemplate,
                                                      "BenchModel")

    print('')
    print('------------------------------------')
    print('------------------------------------')

    for playerIndex, playerx in ipairs(players) do
        print('playerIndex' .. ' - start');
        print(playerIndex);
        print('playerIndex' .. ' - end');
        local xGap = 10
        local x = (playerIndex - 1) * (benchModel.PrimaryPart.Size.X + xGap)

        local newBench = Utils.cloneModel(
                             {
                model = benchModel,
                -- position = benchModel.PrimaryPart.CFrame *
                --     CFrame.new(Vector3.new(-x, 0, 0)),
                suffix = "Clone-" .. "-S" .. sceneIndex .. "-P" .. playerIndex
            })

        newBench.Parent = theaterFolder
        newBench.Name = newBench.Name .. "aaa"

        print('newBench' .. ' - start');
        print(newBench);
        print('newBench' .. ' - end');
        local seat = Utils.getFirstDescendantByName(newBench,
                                                    "BenchSeatTemplate")
        print('seat' .. ' - start');
        print(seat);
        print('seat' .. ' - end');

        -- local Players = game:GetService("Players")
        -- local currentPlayer = nil

        -- seat:GetPropertyChangedSignal("Occupant"):Connect(
        --     function()

        --         print(
        --             'GetPropertyChangedSignal----------------------------->>>>')
        --         local humanoid = seat.Occupant
        --         if humanoid then
        --             local character = humanoid.Parent
        --             local player = Players:GetPlayerFromCharacter(character)
        --             if player then
        --                 print("unHideWall----------------------------")
        --                 -- unHideWall(clonedScene)
        --                 currentPlayer = player
        --                 return
        --             end
        --         end
        --         if currentPlayer then
        --             print("hideWall")
        --             -- hideWall(clonedScene)
        --             currentPlayer = nil
        --         end
        --     end)

    end

end

return module
