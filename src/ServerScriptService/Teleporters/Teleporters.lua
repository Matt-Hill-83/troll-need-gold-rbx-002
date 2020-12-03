local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function module.addTeleporters(props)

    local parent = props.parent
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local isStartScene = props.isStartScene

    local function setTP(thisTP, homeTP)
        thisTP.Touched:Connect(function(touchPart)
            if touchPart and touchPart.Parent and touchPart.Parent.Humanoid and
                touchPart.Parent.currentlyTeleporting.Value == false then
                print('touchPart')
                local Character = touchPart.Parent

                local teleportLocation =
                    CFrame.new(homeTP.CFrame.X + 0 * sceneIndex,
                               homeTP.CFrame.Y + 10,
                               homeTP.CFrame.Z + 5 * sceneIndex)

                local ts = game:GetService("TweenService")

                wait(2)

                local tweenInfo = TweenInfo.new(2)

                local t = ts:Create(Character.PrimaryPart, tweenInfo,
                                    {CFrame = teleportLocation})
                Character.PrimaryPart.Anchored = true
                -- Anchor the player's rootpart so physics doesn't mess things up.
                t:Play()
                t.Completed:Connect(function()
                    Character.PrimaryPart.Anchored = false
                end)

                local teleportingValue = Character.currentlyTeleporting
                teleportingValue.Value = true
                wait(5)
                teleportingValue.Value = false
            end
        end)
    end

    local thisTeleporter = Utils.getFirstDescendantByName(parent,
                                                          "QuestTeleporter")
    local teleporterLabel = Utils.getFirstDescendantByName(thisTeleporter,
                                                           "TeleporterLabel")
    teleporterLabel.Text = questTitle
    if (isStartScene) then
        -- if (sceneIndex == 1) then
        local dummyHomeTP = Utils.getFirstDescendantByName(workspace,
                                                           "SkyBoxTeleporter")
        thisTeleporter.Name = parent.Name .. "-zzz"
        local homeTeleporter = thisTeleporter:Clone()
        homeTeleporter.Parent = parent

        homeTeleporter.Name = thisTeleporter.Name .. "-home"
        homeTeleporter.CFrame = dummyHomeTP.CFrame *
                                    CFrame.new(
                                        Vector3.new(-20 * questIndex, 0, 0))

        setTP(thisTeleporter, homeTeleporter)
        setTP(homeTeleporter, thisTeleporter)
    else
        thisTeleporter:Destroy()
    end

end

return module
