local Sss = game:GetService("ServerScriptService")
local Constants = require(Sss.Source.Constants.Constants)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

deleteInstanceByNameStub = function(props)
    local nameStub = props.nameStub
    local parent = props.parent

    local children = parent:GetChildren()
    for _, item in pairs(children) do
        local match = string.match(item.Name, nameStub)
        if item:IsA('Part') and match then
            item:Destroy()
            --
        end
    end
end

module.deleteInstanceByNameStub = deleteInstanceByNameStub

function module.teleportAll(props)
    local destination = props.destination
    local location = Utils.getFirstDescendantByName(workspace, destination)

    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        if plr.Character then
            plr.Character.HumanoidRootPart.CFrame = location.CFrame
        end
    end
end

return module
