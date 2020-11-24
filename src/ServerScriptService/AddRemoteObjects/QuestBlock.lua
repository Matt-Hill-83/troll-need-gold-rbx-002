local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)

local module = {}

renderQuestBlock = function(props)
    local parent = props.parent
    local sibling = props.sibling
    local size = props.size

    local desiredOffsetFromParentEdge = Vector3.new(0, 0, 36)

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

    return Part.createPartWithVectors(blockProps)

end

module.renderQuestBlock = renderQuestBlock

return module
