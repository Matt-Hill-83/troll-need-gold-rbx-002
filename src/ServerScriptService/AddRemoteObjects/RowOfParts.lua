local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)

local module = {}

function getParentFarEdge(props)
    local parent = props.parent
    local childSizeLength = props.childLength
    local axis = props.axis or 'X'

    local parentPosition = parent.CFrame
    local parentSize = parent.Size
    local parentFarEdge = parentPosition[axis] + parentSize[axis] / 2
    local alignedValue = parentFarEdge - childSizeLength / 2
    return alignedValue
end

function getPartFarEdge(props)
    local part = props.part
    return part.Position + (part.Size / 2) * props.alignToParentFarEdge

end

function getCenterPosFromDesiredEdgeOffset(props)
    local parent = props.parent
    local childSize = props.childSize

    -- Which direction does the offset move toward?
    local desiredOffset = props.offset
    local itemDuplicationConfig = props.itemDuplicationConfig

    -- Is the origin side of the box at the new offset location?
    local moveTowardZero = itemDuplicationConfig.moveTowardZero
    local alignToParentFarEdge = itemDuplicationConfig.alignToParentFarEdge

    local edgeProps = {
        part = parent,
        alignToParentFarEdge = alignToParentFarEdge
    }

    local parentEdge = getPartFarEdge(edgeProps)

    local parentOffsetPoint = parentEdge + desiredOffset + (childSize / 2) *
                                  moveTowardZero

    return parentOffsetPoint

end

function createRowOfParts(props)
    local rowProps = props.rowProps
    local itemConfigs = props.itemConfigs
    local itemProps = props.itemProps

    local parent = rowProps.parent
    local itemDuplicationConfig = rowProps.itemDuplicationConfig
    local gapBetweenRowItems = rowProps.gapBetweenRowItems

    local rowOfParts = {}
    local desiredOffsetFromParentEdge = rowProps.offset

    for i, itemConfig in ipairs(itemConfigs) do
        local offsetProps = {
            parent = parent,
            childSize = itemProps.size,
            itemDuplicationConfig = itemDuplicationConfig,
            offset = desiredOffsetFromParentEdge
        }

        local position = getCenterPosFromDesiredEdgeOffset(offsetProps)

        local newPartProps = {
            decalId = itemConfig.decalId,
            size = itemProps.size,
            name = itemProps.partName .. "-" .. i,
            position = position,
            parent = parent
        }

        rowOfParts[i] = Part.createPartWithVectors(newPartProps)

        local positionIncrement = Vector3.new(itemProps.size.X, 0, 0) +
                                      gapBetweenRowItems

        desiredOffsetFromParentEdge = desiredOffsetFromParentEdge +
                                          positionIncrement *
                                          rowProps.itemDuplicationConfig
                                              .alignToChildFarEdge

    end

    return rowOfParts
end

module.createRowOfParts = createRowOfParts
module.getCenterPosFromDesiredEdgeOffset = getCenterPosFromDesiredEdgeOffset

return module
