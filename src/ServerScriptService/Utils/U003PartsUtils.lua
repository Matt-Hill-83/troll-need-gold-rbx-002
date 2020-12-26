local TweenService = game:GetService("TweenService")
local Sss = game:GetService("ServerScriptService")

local Constants = require(Sss.Source.Constants.Constants)
local module = {}

function tween(props)
    local part = props.part
    local time = props.time
    local repeatCount = props.repeatCount or 0
    local delayTime = props.delayTime or 0
    local endPosition = props.endPosition
    local reverses = props.reverses or false
    local easingStyle = props.easingStyle or Enum.EasingStyle.Linear
    local easingDirection = props.easingDirection or Enum.EasingDirection.Out
    local anchor = props.anchor or false

    local tweenInfo = TweenInfo.new(2, -- Time
    Enum.EasingStyle.Linear, -- EasingStyle
    Enum.EasingDirection.Out, -- EasingDirection
    0, -- RepeatCount (when less than zero the tween will loop indefinitely)
    false, -- Reverses (tween will reverse once reaching it's goal)
    0 -- DelayTime
    )

    local tween = TweenService:Create(part, tweenInfo, {Position = endPosition})

    tween:Play()
    part.Anchored = true
end

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
module.tween = tween
return module
