local Sss = game:GetService("ServerScriptService")
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

renderQuestBlock = function(props)
    local parent = props.parent
    local size = props.size
    local wallSize = props.wallSize
    local dockModel = props.questBlockTemplate

    local dockBase = Utils.getFirstDescendantByName(dockModel, "DockBase")

    -- 
    -- 
    local dockPositioner = Instance.new("Part", parent)
    dockPositioner.Size = size

    local translateCFrameProps = {
        parent = parent,
        child = dockPositioner,
        offsetConfig = {
            useParentNearEdge = Vector3.new(1, -1, 0),
            useChildNearEdge = Vector3.new(-1, -1, 0),
            offsetAdder = Vector3.new(0, 0, 0)
        }
    }

    local newCFrame =
        Utils3.setCFrameFromDesiredEdgeOffset(translateCFrameProps)
    dockPositioner.CFrame = newCFrame

    dockBase.Size = dockPositioner.Size
    dockBase.CFrame = dockPositioner.CFrame

    dockPositioner:Destroy()

    return dockModel
end

module.renderQuestBlock = renderQuestBlock

return module
