local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function styleGemHolder(props)
    local gemHolderName = props.gemHolderName
    local letterFallFolder = props.letterFallFolder
    local questIndex = props.questIndex
    local targetGemName = props.targetGemName
    local hasGem = props.hasGem
    local isReceiver = props.isReceiver

    local gemColor = Constants.gemColors[questIndex]
    local grey = Color3.fromRGB(163, 162, 165)
    local red = Color3.fromRGB(21, 255, 0)
    local gemHolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                     gemHolderName)
    local stand = Utils.getFirstDescendantByName(gemHolder, "Stand")
    stand.Color = gemColor

    local base = Utils.getFirstDescendantByName(gemHolder, "Base")
    base.Color = gemColor

    local bigGem = gemHolder:FindFirstChildWhichIsA("Tool", true)

    if isReceiver then

        print('is a receiver')
        print('is a receiver')
        bigGem.Handle.Color = grey
        bigGem.Enabled = false
        bigGem.Handle.Name = "NotHandle"
        -- bigGem.Handle.Name = "zzzz"
    else
        print('is not a receiver')
        print('is not a receiver')
        local gemColor = Constants.gemColors[questIndex]
        bigGem.Handle.Color = gemColor
    end

    local gemHolderState = {
        hasGem = hasGem,
        takeGemDebounce = false,
        leaveGemDebounce = false,
        targetGemName = targetGemName,
        bigGem = bigGem
    }

    -- For depositing a gem
    local function onPartTouchedClosure(gemHolderState)
        local function onPartTouched(otherPart)
            print('onPartTouched' .. ' - start');

            if gemHolderState.leaveGemDebounce == true then return end
            gemHolderState.leaveGemDebounce = true

            local parent = otherPart.Parent

            if not parent then
                gemHolderState.leaveGemDebounce = false
                return
                -- 
            end

            local humanOther = parent:FindFirstChild("Humanoid")

            if humanOther then
                gemHolderState.leaveGemDebounce = false
                return
                -- 
            end

            print('otherPart' .. ' - start');
            print(otherPart);
            local partParent = otherPart.Parent
            print('partParent' .. ' - start');
            print(partParent);
            local match = partParent.Name == gemHolderState.targetGemName
            if match then

                print("correctGem")
                print("correctGem")
                print("correctGem")
                print("correctGem")

                print('gemHolderState' .. ' - start');
                print(gemHolderState);

                local bg = gemHolderState.bigGem
                print('bg' .. ' - start');
                print(bg);
                bg.Enabled = false

                print('otherPart' .. ' - start');
                print(otherPart);
                bg.NotHandle.Color = otherPart.Color
                -- bg.NotHandle.Color = red
                bigGem.NotHandle.Transparency = 0
                -- bigGem.Handle.Name = "NotHandle"
                partParent:Destroy()
                -- onCorrectItemDropped()
            end
            gemHolderState.leaveGemDebounce = false
        end

        return onPartTouched
    end

    if isReceiver then
        print('is a receiver')
        print('is a receiver')
        print('is a receiver')
        print('is a receiver')
        print('is a receiver')
        stand.Touched:Connect(onPartTouchedClosure(gemHolderState))
    end

    local detachClosure = function(gemHolderState)
        -- If the gem Handle is touched by a human, disable the hinge and 
        -- stop the rotation so they can take it.
        local detach = function(otherPart)
            if gemHolderState.takeGemDebounce == true then return end
            gemHolderState.takeGemDebounce = true

            if (gemHolderState.hasGem) then
                local humanOther = otherPart.Parent:FindFirstChild("Humanoid")
                if not humanOther then return end

                local hinge = bigGem:FindFirstChildWhichIsA("HingeConstraint",
                                                            true)
                local torque = bigGem:FindFirstChildWhichIsA("Torque", true)
                hinge.Enabled = false
                torque.Enabled = false
                gemHolderState.hasGem = false
                gemHolderState.takeGemDebounce = false
            end
        end
        return detach
    end

    -- If there is no gem initially, do not allow the gem to be taken
    if not isReceiver then

        print('not a receiver')
        print('not a receiver')
        print('not a receiver')
        print('not a receiver')
        bigGem.Handle.Touched:Connect(detachClosure(gemHolderState))
    end
end

function module.initGem(props)
    styleGemHolder(props)
    local frameConfig = props.frameConfig

    local gemProps = {
        initialized = false
        -- 
    }

end

return module
