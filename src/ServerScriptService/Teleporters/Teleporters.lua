local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function module.addTeleporters(props)

    local parent = props.parent
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local isStartScene = props.isStartScene
    local isEndScene = props.isEndScene
    local skyBoxTeleporter = props.skyBoxTeleporter

    local function setLocalTPTargetToRemoteTP(localTP, remoteTP)
        local teleporterBlocker = Utils.getFirstDescendantByName(localTP,
                                                                 "TeleporterBlocker")
        teleporterBlocker:Destroy()

        localTP.PrimaryPart.Touched:Connect(
            function(touchPart)
                if touchPart and touchPart.Parent and touchPart.Parent.Humanoid and
                    touchPart.Parent.currentlyTeleporting.Value == false then

                    local Character = touchPart.Parent

                    local questTeleporterReceiver =
                        Utils.getFirstDescendantByName(remoteTP,
                                                       "QuestTeleporterReceiver")
                    local teleportLocation =
                        questTeleporterReceiver.CFrame + Vector3.new(0, 6, 0)

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
                                                          "QuestTeleporterModel")

    local labels = Utils.getDescendantsByName(thisTeleporter, "TeleporterLabel")
    for i, label in ipairs(labels) do label.Text = questTitle end

    local labels2 = Utils.getDescendantsByName(skyBoxTeleporter,
                                               "TeleporterLabel")
    for i, label in ipairs(labels2) do label.Text = questTitle end

    local dummyHomeTP = Utils.getFirstDescendantByName(workspace,
                                                       "SkyBoxTeleporter")
    skyBoxTeleporter.PrimaryPart.CFrame =
        dummyHomeTP.CFrame * CFrame.new(Vector3.new(-20 * questIndex, 0, 0)) *
            CFrame.Angles(0, math.rad(90), 0)
    skyBoxTeleporter.PrimaryPart.Anchored = true
    thisTeleporter.Name = parent.Name .. "-sky- " .. sceneIndex

    if (isStartScene or isEndScene) then
        if isStartScene then
            setLocalTPTargetToRemoteTP(skyBoxTeleporter, thisTeleporter)
        end
        if isEndScene then
            setLocalTPTargetToRemoteTP(thisTeleporter, skyBoxTeleporter)
        end

        thisTeleporter.PrimaryPart.Anchored = true
    else
        thisTeleporter:Destroy()
    end

end

return module
