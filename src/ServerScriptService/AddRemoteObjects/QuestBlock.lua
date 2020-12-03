local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

renderFrontWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize
    local template = props.template

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

    template.Size = childSize
    template.Position =
        RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

renderBackWall = function(props)
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

    template.Size = childSize
    template.Position =
        RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

renderLeftWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize
    local template = props.template

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

    template.Size = childSize
    template.Position =
        RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

renderRightWall = function(props)
    local parent = props.parent
    local wallSize = props.wallSize
    local template = props.template
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

    template.Size = childSize
    template.Position =
        RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)
end

renderQuestBlock = function(props)
    local parent = props.parent
    local sibling = props.sibling
    local size = props.size
    local wallSize = props.wallSize
    local sceneHeight = props.sceneHeight
    local dockModel = props.questBlockTemplate
    local index = props.index
    local isFirst = index == 1

    local dockBase = Utils.getFirstDescendantByName(dockModel, "DockBase")
    local dockBasement1 = Utils.getFirstDescendantByName(dockModel,
                                                         "DockBasement1")
    local dockBasement2 = Utils.getFirstDescendantByName(dockModel,
                                                         "DockBasement2")

    local dockWallFront = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallFront")
    local dockWallBack = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallBack")
    local dockWallRight = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallRight")
    local dockWallLeft = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallLeft")

    local offsetX = -Constants.islandLength
    local offsetY = -sceneHeight / 2
    local offsetZ = 0

    -- local offsetX = Constants.islandLength
    -- local offsetY = -sceneHeight
    -- local offsetZ = Constants.islandLength

    if (isFirst) then
        offsetX = 0
        offsetY = 0
        offsetZ = 0
    end

    local desiredOffsetFromParentEdge = nil
    local itemDuplicationConfig = nil

    desiredOffsetFromParentEdge = Vector3.new(offsetX, offsetY, offsetZ)
    itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(-1, -1, -1),
        moveTowardZero = Vector3.new(-1, 1, 1),
        alignToChildFarEdge = Vector3.new(1, -1, 1)
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

        material = Enum.Material.DiamondPlate,
        color = BrickColor.new("Bright red"),
        size = size,
        position = childPos
    }

    local dockPositioner = Part.createPartWithVectors(blockProps)

    dockBase.CFrame = dockPositioner.CFrame
    dockBase.Size = dockPositioner.Size
    dockBasement1.CFrame = dockPositioner.CFrame
    dockBasement1.Size = dockPositioner.Size
    dockBasement2.CFrame = dockPositioner.CFrame
    dockBasement2.Size = dockPositioner.Size

    renderFrontWall({
        parent = dockBase,
        wallSize = wallSize,
        template = dockWallFront
    })
    renderBackWall({
        parent = dockBase,
        wallSize = wallSize,
        template = dockWallBack
    })
    renderLeftWall({
        parent = dockBase,
        wallSize = wallSize,
        template = dockWallLeft
    })
    renderRightWall({
        parent = dockBase,
        wallSize = wallSize,
        template = dockWallRight
    })

    dockPositioner:Destroy()

    return dockBase
end

module.renderQuestBlock = renderQuestBlock

return module
