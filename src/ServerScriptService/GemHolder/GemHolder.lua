local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function styleGemHolder(props)
    local gemHolderName = props.gemHolderName
    local letterFallFolder = props.letterFallFolder
    local gemColor = props.gemColor

    local grey = Color3.fromRGB(163, 162, 165)
    local gemHolder = Utils.getFirstDescendantByName(letterFallFolder,
                                                     gemHolderName)
    local stand = Utils.getFirstDescendantByName(gemHolder, "Stand")
    stand.Color = gemColor

    local base = Utils.getFirstDescendantByName(gemHolder, "Base")
    base.Color = gemColor

    local bigGem = gemHolder:FindFirstChildWhichIsA("Tool", true)
    bigGem.Handle.Color = grey
end

function module.initGem(props)

    styleGemHolder(props)
    local frameConfig = props.frameConfig

    local gemProps = {
        initialized = false
        -- 
    }

    -- local model = script.Parent
    -- local tool = model:FindFirstChildWhichIsA("Tool")
    -- print(tool)

    -- local detach = function(partOther)
    --     local humanOther = partOther.Parent:FindFirstChild("Humanoid")
    --     if not humanOther then return end

    --     local hinge = tool:FindFirstChildWhichIsA("HingeConstraint", true)
    --     local torque = tool:FindFirstChildWhichIsA("Torque", true)
    --     print(hinge)
    --     print(torque)

    --     local humanOther = partOther.Parent:FindFirstChild("Humanoid")
    --     if not humanOther then return end

    --     hinge.Enabled = false
    --     torque.Enabled = false
    -- end

    -- tool.Handle.Touched:Connect(detach)
end

return module
