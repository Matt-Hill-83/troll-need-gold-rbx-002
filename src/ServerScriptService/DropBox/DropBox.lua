local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function module.configDropBox(props)

    local scene = props.scene
    local sceneIndex = props.sceneIndex

    local questIndex = props.questIndex
    local isEndScene = props.isEndScene

    local isStartScene = props.isStartScene
    local dropBox = props.dropBox
    local item = props.item

    -- if (isStartScene) then
    if (isEndScene) then
        local part = Utils.getFirstDescendantByName(scene,
                                                    "DropBoxDetectionRegion")

        local function onPartTouched(otherPart)
            print('DropBoxDetectionRegion')
            local partParent = otherPart.Parent
            local match = partParent.Name == item.name

            if match then
                partParent.Parent = workspace
                -- 
            end

            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid and false then
                -- 
            end
        end

        part.Touched:Connect(onPartTouched)

        local labels = Utils.getDescendantsByName(dropBox, "ItemLabel")
        for i, label in ipairs(labels) do label.Text = item.name end

        dropBox.Name = scene.Name .. "-local- " .. sceneIndex
    else
        dropBox:Destroy()
    end

end

return module
