local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)

local module = {}

function getCenterPosFromDesiredEdgeOffset(props)
    local parent = props.parent
    local childSize = props.childSize

    -- Which direction does the offset move toward?
    local desiredOffset = props.offset or Vector3.new(0, 0, 0)
    local itemDuplicationConfig = props.itemDuplicationConfig

    -- Is the origin side of the box at the new offset location?
    local moveTowardZero = itemDuplicationConfig.moveTowardZero
    local alignToParentFarEdge = itemDuplicationConfig.alignToParentFarEdge

    local edgeProps = {
        part = parent,
        alignToParentFarEdge = alignToParentFarEdge
    }

    local parentEdge = Utils3.getPartFarEdge(edgeProps)

    local parentOffsetPoint = parentEdge + desiredOffset + (childSize / 2) *
                                  moveTowardZero

    return parentOffsetPoint
end

module.getCenterPosFromDesiredEdgeOffset = getCenterPosFromDesiredEdgeOffset

return module
