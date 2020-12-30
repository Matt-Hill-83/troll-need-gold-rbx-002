local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function getCFrameFromDesiredOffset(props)
    local parent = props.parent
    local child = props.child

    local defaultOffsetConfig = {
        useParentNearEdge = {true, true, true},
        useParentNearEdge = {true, true, true},
        offsetAdder = Vector3.new(0, 0, -10)
    }

    offsetConfig = offsetConfig or defaultOffsetConfig

    -- local parentFarEdge = -1
    -- local childFarEdge = -1
    local useParentFarEdge = Vector3.new(0, 1, -1)
    local useChildFarEdge = Vector3.new(0, -1, 1)

    -- local offsetX = 0
    -- local offsetY =
    --     (childFarEdge * child.Size.Y + parentFarEdge * parent.Size.Y) / 2 - 20
    -- local offsetZ =
    --     (childFarEdge * child.Size.Z + parentFarEdge * parent.Size.Z) / 2 - 10

    local offset = (useParentFarEdge * parent.Size - useChildFarEdge *
                       child.Size) / 2 + offsetConfig.offsetAdder

    local offsetCFrame = CFrame.new(offset)
    -- local offsetCFrame = CFrame.new(offsetConfig.offsetAdder)
    -- local offsetCFrame = CFrame.new(offsetX, offsetY, offsetZ)

    local offsetConfig = {
        parentFarEdge = {x = true, y = true, z = true},
        childFarEdge = {x = true, y = true, z = true}
    }

    child.CFrame = parent.CFrame:ToWorldSpace(offsetCFrame)
    --  
    --  
    --  
    -- local offsetConfig = props.offsetConfig

    -- local childSize = child.Size
    -- local childPosition = child.Position

    -- local defaultOffsetConfig = {
    --     useParentNearEdge = {true, true, true},
    --     useParentNearEdge = {true, true, true}

    -- }

    -- offsetConfig = offsetConfig or defaultOffsetConfig

    -- local parentFarEdge = -1
    -- local childFarEdge = -1

    -- local offsetX = 0
    -- local offsetY = (childFarEdge * dockPositioner.Size.Y + parentFarEdge *
    --                     parent.Size.Y) / 2 - 20
    -- local offsetZ = (childFarEdge * dockPositioner.Size.Z + parentFarEdge *
    --                     parent.Size.Z) / 2 - 10

    -- local offsetCFrame = CFrame.new(offsetX, offsetY, offsetZ)

    -- local output = parent.CFrame:ToWorldSpace(offsetCFrame)
    -- return output

end

renderQuestBlock = function(props)
    local parent = props.parent
    local size = props.size
    local wallSize = props.wallSize
    local dockModel = props.questBlockTemplate

    local dockBase = Utils.getFirstDescendantByName(dockModel, "DockBase")

    local dockWallFront = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallFront")
    local dockWallBack = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallBack")
    local dockWallRight = Utils.getFirstDescendantByName(dockModel,
                                                         "DockWallRight")
    local dockWallLeft = Utils.getFirstDescendantByName(dockModel,
                                                        "DockWallLeft")
    -- 
    -- 
    local dockPositioner = Instance.new("Part", parent)
    dockPositioner.Size = size

    -- -- 
    -- -- 
    -- -- 
    -- local parentFarEdge = -1
    -- local childFarEdge = -1

    -- local offsetX = 0
    -- local offsetY = (childFarEdge * dockPositioner.Size.Y + parentFarEdge *
    --                     parent.Size.Y) / 2 - 20
    -- local offsetZ = (childFarEdge * dockPositioner.Size.Z + parentFarEdge *
    --                     parent.Size.Z) / 2 - 10

    -- local offsetCFrame = CFrame.new(offsetX, offsetY, offsetZ)

    local offsetConfig = {
        parentFarEdge = {x = true, y = true, z = true},
        childFarEdge = {x = true, y = true, z = true},
        offsetAdder = Vector3.new(0, 0, 0)
    }

    local translateCFrameProps = {
        parent = parent,
        child = dockPositioner,
        offsetConfig = offsetConfig
    }

    -- dockPositioner.CFrame = parent.CFrame:ToWorldSpace(offsetCFrame)
    local newCFrame = getCFrameFromDesiredOffset(translateCFrameProps)
    -- dockPositioner.CFrame = newCFrame
    -- 
    -- 
    -- 

    dockBase.CFrame = dockPositioner.CFrame
    dockBase.Size = dockPositioner.Size

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

module.renderQuestBlock = renderQuestBlock

return module
