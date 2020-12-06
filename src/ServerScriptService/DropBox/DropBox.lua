local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

-- local function regionEnter(plr, scene)
local function regionEnter(plr, scene, entered)
    -- local entered = Constants.entered
    print("")
    print("------------------------------------------->>regionEnter")

    print('plr' .. ' - start');
    print(plr);
    print('plr' .. ' - end');

    -- if you need to check this outside of the one script, you can do this if check or use _G or modules (modules are definitely more recommended than _G especially if you're checking this on the client):
    if plr.Character:FindFirstChild("ToolName") and
        plr.Character["ToolName"]:IsA("Tool") then print("equipped") end

    print('entered.value' .. ' - start');
    print(entered.value);
    print('entered.value' .. ' - end');
    if not entered.value then
        print('enter----------------------->>')
        local Player = plr
        -- local Player = game:GetService("Players").LocalPlayer
        local Backpack = Player:WaitForChild("Backpack")
        print('Backpack' .. ' - start');
        print(Backpack);
        print('Backpack' .. ' - end');

        local ToolName = "Test"

        for _, Tool in pairs(Backpack:GetChildren()) do
            if Tool.Name == ToolName then
                print("This is the tool I'm looking for.")
            end
        end

        entered.value = true

    end
end

function module.configDropBox(props)
    -- local entered = Constants.entered
    -- local entered = {value = false}

    local scene = props.scene
    local sceneIndex = props.sceneIndex
    local questIndex = props.questIndex
    local isEndScene = props.isEndScene
    local isStartScene = props.isStartScene
    local dropBox = props.dropBox
    local item = props.item
    local entered = props.entered2

    if (isStartScene) then
        -- if (isEndScene) then

        print('scene' .. ' - start');
        print(scene);
        print('scene' .. ' - end');
        local part = Utils.getFirstDescendantByName(scene,
                                                    "DropBoxDetectionRegion")

        local function onPartTouched(otherPart)
            -- Get the other part's parent
            local partParent = otherPart.Parent
            -- Look for a humanoid in the parent
            local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
            if humanoid then
                print('');
                print('');
                print('humanoid' .. ' - start');
                print(humanoid);

                print('otherPart' .. ' - start');
                print(otherPart);
                print('partParent' .. ' - start');
                print(partParent);
                -- Do something to the humanoid, like set its health to 0
                -- humanoid.Health = 0
            end
        end

        local function xxxonPartTouched(handle)
            local tool = handle.Parent
            local match = tool.Name == item.name

            local deBounce = false
            if not deBounce then
                deBounce = true
                -- if true then
                if match then
                    print('tool' .. ' - start');
                    -- print(tool);
                    print(tool.Name);
                    print('tool' .. ' - end');

                    print('tool.Parent' .. ' - start');
                    print(tool.Parent);
                    print('tool.Parent' .. ' - end');
                    local toolParent = tool.Parent
                    print('toolParent' .. ' - start');
                    print(toolParent);
                    print('toolParent' .. ' - end');
                    -- print("match----------------------------->>>>>")
                    -- print("match----------------------------->>>>>")
                    -- print("match----------------------------->>>>>")
                    -- local humanoid = tool.Parent:IsA("Humanoid")
                    local humanoid = toolParent:FindFirstChildWhichIsA(
                                         "Humanoid")
                    if humanoid then
                        -- regionEnter(tool, scene, entered)
                        regionEnter(toolParent, scene, entered)
                    end
                else
                end
            end
            deBounce = false

        end

        part.Touched:Connect(onPartTouched)

        local labels = Utils.getDescendantsByName(dropBox, "ItemLabel")
        for i, label in ipairs(labels) do label.Text = item.name end

        dropBox.Name = scene.Name .. "-local- " .. sceneIndex

        -- dropBox.PrimaryPart.Anchored = true
    else
        dropBox:Destroy()
    end

end

return module
