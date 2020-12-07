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

        seat.Changed:Connect(function()
            print('sadfasdfasfasasdsafdasf-asdf-asd-f-asf-asd-asda-dsf')

            if seat.Occupant ~= nil then
                if seat.Occupant.Parent.Name ~= "PlayerNameHere" then
                    local PlayerToJump =
                        game.Players:FindFirstChild(seat.Occupant.Parent.Name)
                    print('PlayerToJump' .. ' - start');
                    print(PlayerToJump);
                    print('PlayerToJump' .. ' - end');
                    local Character = PlayerToJump.Character or
                                          PlayerToJump.CharacterAdded:Wait()
                    print('Character' .. ' - start');
                    print(Character);
                    print('Character' .. ' - end');
                    wait(.1)
                    Character.Humanoid.Jump = true
                end
            end

        end)

    end

end

return module
