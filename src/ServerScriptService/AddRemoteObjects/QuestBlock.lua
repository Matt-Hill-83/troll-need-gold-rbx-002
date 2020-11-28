local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

renderFrontWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize
    local template = props.template

    local childSize = Vector3.new(parent.Size.X, wallSize.Y, wallSize.Z)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, 1),
        moveTowardZero = Vector3.new(-1, 1, -1),
        alignToChildFarEdge = Vector3.new(-1, -1, 1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'FrontWall',
        parent = parent,
        color = BrickColor.new("Lime green"),
        size = childSize,
        position = childPos
    }

    Part.createPartWithVectors(blockProps)
end

renderBackWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize

    local childSize = Vector3.new(parent.Size.X, wallSize.Y, wallSize.Z)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, -1),
        moveTowardZero = Vector3.new(-1, 1, 1),
        alignToChildFarEdge = Vector3.new(-1, -1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'FrontWall',
        parent = parent,
        color = BrickColor.new("Pastel green"),
        size = childSize,
        position = childPos
    }

    Part.createPartWithVectors(blockProps)
end

renderLeftWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize

    local childSize = Vector3.new(wallSize.X, wallSize.Y, parent.Size.Z)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, -1),
        moveTowardZero = Vector3.new(-1, 1, 1),
        alignToChildFarEdge = Vector3.new(-1, -1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'FrontWall',
        parent = parent,
        color = BrickColor.new("Lime green"),
        size = childSize,
        position = childPos
    }

    Part.createPartWithVectors(blockProps)
end

renderRightWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize

    local childSize = Vector3.new(wallSize.X, wallSize.Y, parent.Size.Z)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(-1, 1, -1),
        moveTowardZero = Vector3.new(1, 1, 1),
        alignToChildFarEdge = Vector3.new(1, -1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local blockProps = {
        name = 'FrontWall',
        parent = parent,
        color = BrickColor.new("Lime green"),
        size = childSize,
        position = childPos
    }

    Part.createPartWithVectors(blockProps)
end

renderQuestBlock = function(props)
    local parent = props.parent
    local sibling = props.sibling
    local size = props.size
    local isFirst = props.isFirst
    local newDock = props.questBlockTemplate
    local dockBase = Utils.getFirstDescendantByName(newDock, "DockBase")
    local dockBase = Utils.getFirstDescendantByName(newDock, "DockBase")

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
    dockBase.CFrame = dockPositioner.CFrame
    dockBase.Size = dockPositioner.Size

    -- local wallSize = nil
    local wallSize = Vector3.new(3, 6, 3)

    renderFrontWall({
        parent = dockBase,
        wallSize = wallSize,
        template = Utils.getFromTemplates("DockWallFront")
    })
    renderBackWall({parent = dockBase, wallSize = wallSize})
    renderLeftWall({parent = dockBase, wallSize = wallSize})
    renderRightWall({parent = dockBase, wallSize = wallSize})
    return dockPositioner
end

module.renderQuestBlock = renderQuestBlock

return module
