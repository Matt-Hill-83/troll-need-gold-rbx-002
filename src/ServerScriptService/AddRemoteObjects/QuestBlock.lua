local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

renderFrontWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize

    local desiredOffsetFromParentEdge = Vector3.new(0, 0, 0)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, 1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, -1, 1)
    }
    local childSize = Vector3.new(parent.Size.X, wallSize.Y, wallSize.Z)
    -- local childSize = parent.Size / 2

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'FrontWall',
        parent = parent,
        color = BrickColor.new("Lime green"),
        size = childSize,
        position = childPos
    }

    local wall = Part.createPartWithVectors(blockProps)
    return wall
end

renderQuestBlock = function(props)
    local parent = props.parent
    local sibling = props.sibling
    local size = props.size
    local isFirst = props.isFirst
    local questBlockTemplate = props.questBlockTemplate

    local offset = 30
    -- local offset = 60

    if (isFirst) then offset = 0 end

    local desiredOffsetFromParentEdge = Vector3.new(0, 0, offset)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, -1, 1),
        moveTowardZero = Vector3.new(-1, 1, 1),
        alignToChildFarEdge = Vector3.new(-1, -1, 1)
    }

    local offsetProps = {
        parent = sibling,
        childSize = size,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'QuestContainer',
        parent = parent,
        color = BrickColor.new("Buttermilk"),
        size = size,
        position = childPos
    }

    local dockPositioner = Part.createPartWithVectors(blockProps)
    questBlockTemplate.CFrame = dockPositioner.CFrame
    questBlockTemplate.Size = dockPositioner.Size

    -- local wallSize = nil
    local wallSize = Vector3.new(3, 6, 3)

    renderFrontWall({parent = questBlockTemplate, wallSize = wallSize})
    return dockPositioner
end

module.renderQuestBlock = renderQuestBlock

return module
