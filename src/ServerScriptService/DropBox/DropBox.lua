local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local entered = {value = false}
local module = {}

local function hideWall(scene)
    local dialog = Utils.getFirstDescendantByName(scene, "WallTemplate")

    local items = dialog:GetDescendants()
    for i, item in ipairs(items) do
        Utils.hideItemAndChildren({item = item, hide = true})
        if item:IsA("BasePart") then item.CanCollide = false end
    end

end

local function unHideWall(scene)
    local dialog = Utils.getFirstDescendantByName(scene, "WallTemplate")
    local items = dialog:GetDescendants()
    for i, item in ipairs(items) do
        Utils.hideItemAndChildren({item = item, hide = false})
    end
end

local function regionEnter(plr, scene, entered)
    print("------------------------------------------->>regionEnter")
    local buttonPressed = false
    if not buttonPressed then
        buttonPressed = true
        if not entered.value then
            -- unHideWall(scene)
            entered.value = true
        end
        buttonPressed = false
    end
end

local function regionExit(plr, scene, entered)
    print("------------------------------------------->>regionExit")
    local buttonPressed = false
    if not buttonPressed then
        buttonPressed = true
        if entered.value then
            -- hideWall(scene)
            entered.value = false
        end
        buttonPressed = false
    end
end

function module.configDropBox(props)

    local scene = props.scene
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local isEndScene = props.isEndScene
    local dropBox = props.dropBox
    local item = props.item

    print('isEndScene' .. ' - start');
    print(isEndScene);
    print('isEndScene' .. ' - end');
    print('scene' .. ' - start');
    print(scene);
    print('scene' .. ' - end');
    if (isEndScene) then
        local part =
            Utils.getFirstDescendantByName(scene, "UserDetectionRegion")

        local function onPartTouched(otherPart)
            -- Get the other part's parent
            local partParent = otherPart.Parent
            -- Look for a humanoid in the parent
            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid then regionEnter(humanoid, scene, entered) end
        end

        part.Touched:Connect(onPartTouched)

        local function onPartTouchEnded(otherPart)
            local partParent = otherPart.Parent
            if partParent then
                local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
                if humanoid then
                    regionExit(humanoid, scene, entered)
                end
            end
        end

        part.TouchEnded:Connect(onPartTouchEnded)

        local thisDropBox =
            Utils.getFirstDescendantByName(scene, "DropBoxModel")

        local labels = Utils.getDescendantsByName(thisDropBox, "ItemLabel")
        for i, label in ipairs(labels) do label.Text = item.name end

        local labels2 = Utils.getDescendantsByName(dropBox, "TeleporterLabel")
        for i, label in ipairs(labels2) do label.Text = item.name end

        thisDropBox.Name = scene.Name .. "-local- " .. sceneIndex

        thisDropBox.PrimaryPart.Anchored = true
    else
        -- thisDropBox:Destroy()
    end

end

return module
