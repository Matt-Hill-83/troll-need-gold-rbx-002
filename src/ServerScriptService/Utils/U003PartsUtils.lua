local Sss = game:GetService("ServerScriptService")
local Constants = require(Sss.Source.Constants.Constants)
local module = {}

function module.getCenterPositionForRightOffset(props)
    local parent = props.parent
    local child = props.child

    local newVal = parent.Position.X - (child.Size.X + parent.Size.X) / 2
    return Vector3.new(newVal, child.Position.Y, child.Position.Z)
end

function module.getCenterPositionForRightFront(props)
    local parent = props.parent
    local child = props.child

    local newVal = parent.Position.Z - (child.Size.Z + parent.Size.Z) / 2
    return Vector3.new(child.Position.X, child.Position.Y, newVal)
end

function getPartFarEdge(props)
    local part = props.part
    return part.Position + (part.Size / 2) * props.alignToParentFarEdge
end

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

module.getPartFarEdge = getPartFarEdge
return module
