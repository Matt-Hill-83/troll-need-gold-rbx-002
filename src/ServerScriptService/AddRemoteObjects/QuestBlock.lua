local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

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
    -- local isFirst = props.isFirst
    local wallSize = props.wallSize
    local dockModel = props.questBlockTemplate
    local index = props.index
    local isFirst = index == 1

    local dockBase = Utils.getFirstDescendantByName(dockModel, "DockBase")

    local dockWallFront = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallFront")
    local dockWallBack = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallBack")
    local dockWallRight = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallRight")
    local dockWallLeft = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallLeft")

    local offset = 10
    -- local offset = 60

    if (isFirst) then offset = 0 end

    local changeOffset = index % 2 == 0

    local desiredOffsetFromParentEdge = nil
    local itemDuplicationConfig = nil

    if (true) then
        -- if (false) then
        -- if (changeOffset) then
        desiredOffsetFromParentEdge = Vector3.new(-offset, 0, 0)
        itemDuplicationConfig = {
            alignToParentFarEdge = Vector3.new(-1, -1, -1),
            moveTowardZero = Vector3.new(-1, 1, 1),
            alignToChildFarEdge = Vector3.new(1, -1, 1)
        }
    else
        desiredOffsetFromParentEdge = Vector3.new(0, 0, offset)
        itemDuplicationConfig = {
            alignToParentFarEdge = Vector3.new(1, -1, 1),
            moveTowardZero = Vector3.new(-1, 1, 1),
            alignToChildFarEdge = Vector3.new(-1, -1, 1)
        }

    end
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
    local glassFloor = Utils.getFirstDescendantByName(dockBase, "GlassFloor")

    local weld = Instance.new("WeldConstraint")
    weld.Parent = dockBase
    weld.Part0 = dockBase
    weld.Part1 = dockPositioner

    -- put in a layer of glass to walk on below the water
    local glassFloorY = 10

    glassFloor.CFrame = dockBase.CFrame *
                            CFrame.new(Vector3.new(0, glassFloorY, 0))
    glassFloor.Size = dockBase.Size

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

    -- local questCFrame = dockPositioner.CFrame
    -- dockPositioner.CFrame = questCFrame * CFrame.new(Vector3.new(0, -40, 0)) *
    --                             CFrame.fromEulerAnglesXYZ(0, math.rad(90), 0)
    return dockPositioner
end

module.renderQuestBlock = renderQuestBlock

return module
