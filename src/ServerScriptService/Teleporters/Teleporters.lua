local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local TS = game:GetService("TweenService")

local module = {}

local function setLocalTPTargetToRemoteTP(localTP, remoteTP)
    localTP.PrimaryPart.Touched:Connect(function(touchPart)

        if touchPart and touchPart.Parent and touchPart.Parent.Humanoid and
            touchPart.Parent.currentlyTeleporting.Value == false then

            local Character = touchPart.Parent
            local questTeleporterReceiver =
                Utils.getFirstDescendantByName(remoteTP,
                                               "QuestTeleporterReceiver")
            local teleportLocation = questTeleporterReceiver.Position +
                                         Vector3.new(0, 20, 0)

            wait(0.5)
            Character.PrimaryPart.Position = teleportLocation

            -- local tweenInfo = TweenInfo.new(4)
            -- local t = TS:Create(Character.PrimaryPart, tweenInfo,
            --                     {Position = teleportLocation})
            -- Character.PrimaryPart.Anchored = true
            -- -- Anchor the player's rootpart so physics doesn't mess things up.
            -- t:Play()
            -- t.Completed:Connect(function()
            --     Character.PrimaryPart.Anchored = false
            -- end)

            local teleportingValue = Character.currentlyTeleporting
            teleportingValue.Value = true
            wait(5)
            teleportingValue.Value = false
        end
    end)
end

function module.configSkyboxTeleporter(props)
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local questFolder = props.questFolder

    local teleporterTemplate = Utils.getFromTemplates("TeleporterTemplate")
    local skyBoxTeleporter = teleporterTemplate:Clone()
    skyBoxTeleporter.Parent = questFolder

    local teleporterSpacing = 10
    local labels2 = Utils.getDescendantsByName(skyBoxTeleporter,
                                               "TeleporterLabel")
    for i, label in ipairs(labels2) do label.Text = questTitle end

    skyBoxTeleporter.PrimaryPart.Anchored = false
    local teleporterPositioner = Utils.getFirstDescendantByName(workspace,
                                                                "SkyBoxTeleporterPositioner")
    skyBoxTeleporter.PrimaryPart.CFrame =
        teleporterPositioner.CFrame *
            CFrame.new(Vector3.new(-teleporterSpacing * (questIndex - 1), 0, 0)) *
            CFrame.Angles(0, math.rad(0), 0)

    skyBoxTeleporter.PrimaryPart.Anchored = true
    skyBoxTeleporter.Name = "teleporter" .. "-sky-Q- " .. questIndex

    return skyBoxTeleporter
end

function module.configLocalTeleporter(props)
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local sceneIndex = props.sceneIndex
    local parent = props.parent
    local localTPPositioner = props.localTPPositioner

    local teleporterTemplate = Utils.getFromTemplates("TeleporterTemplate")
    local localTeleporter = teleporterTemplate:Clone()
    localTeleporter.Parent = parent
    localTeleporter.PrimaryPart.CFrame = localTPPositioner.CFrame

    local labels =
        Utils.getDescendantsByName(localTeleporter, "TeleporterLabel")
    for i, label in ipairs(labels) do label.Text = questTitle end

    localTeleporter.Name = "teleporter" .. "-local-Q" .. questIndex .. "-S" ..
                               sceneIndex
    return localTeleporter
end

function module.addTeleporters(props)
    local parent = props.parent
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local questTitle = props.questTitle
    local isStartScene = props.isStartScene
    local isEndScene = props.isEndScene
    local skyBoxTeleporter = props.skyBoxTeleporter
    local localTPPositioner = props.localTPPositioner

    if (not isStartScene and not isEndScene) then return end

    local props = {
        parent = parent,
        questTitle = questTitle,
        sceneIndex = sceneIndex,
        questIndex = questIndex,
        localTPPositioner = localTPPositioner
    }
    local localTeleporter = module.configLocalTeleporter(props)

    if isStartScene then
        setLocalTPTargetToRemoteTP(skyBoxTeleporter, localTeleporter)
        setLocalTPTargetToRemoteTP(localTeleporter, skyBoxTeleporter)
    end

    if isEndScene then
        setLocalTPTargetToRemoteTP(skyBoxTeleporter, localTeleporter)
        setLocalTPTargetToRemoteTP(localTeleporter, skyBoxTeleporter)
    end

    localTeleporter.PrimaryPart.Anchored = true
    localTPPositioner:Destroy()
end

return module
