local Sss = game:GetService("ServerScriptService")
local Part = require(Sss.Source.AddRemoteObjects.Part)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Texts = require(Sss.Source.AddDialog.Texts)
local Utils = require(Sss.Source.Utils.Utils)

local module = {}

renderDialog = function(props)
    local parent = props.parent
    local dialogConfigs = props.dialogConfigs

    local dialogContainer = renderDialogContainer({parent = parent})
    local textsContainer = renderTextsContainer({parent = dialogContainer})

    Utils.setMaterialPebble(parent)

    local renderTextsProps = {
        parent = textsContainer,
        dialogConfigs = dialogConfigs
    }
    Texts.renderTexts(renderTextsProps)

    return dialogContainer
end

renderDialogContainer = function(props)
    local parent = props.parent

    local childSize = Vector3.new(20, 12, 1)
    local desiredOffsetFromParentEdge = Vector3.new(-1, -1, 1.1)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, -1),
        moveTowardZero = Vector3.new(-1, -1, -1),
        alignToChildFarEdge = Vector3.new(-1, -1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local dialogBlockProps = {
        name = 'DialogContainer',
        parent = parent,
        color = BrickColor.new("Buttermilk"),
        size = childSize,
        position = childPos
    }

    return Part.createPartWithVectors(dialogBlockProps)

end

renderTextsContainer = function(props)
    local parent = props.parent

    local childSize = Vector3.new(parent.Size.X - 2, 10, 1)
    local desiredOffsetFromParentEdge = Vector3.new(0, 0, 0)

    local itemDuplicationConfig = {
        alignToParentFarEdge = Vector3.new(1, 1, -1),
        moveTowardZero = Vector3.new(-1, -1, -1),
        alignToChildFarEdge = Vector3.new(-1, -1, -1)
    }

    local offsetProps = {
        parent = parent,
        childSize = childSize,
        itemDuplicationConfig = itemDuplicationConfig,
        offset = desiredOffsetFromParentEdge
    }

    local childPos = RowOfParts.getCenterPosFromDesiredEdgeOffset(offsetProps)

    local dialogBlockProps = {
        name = 'textsContainer',
        parent = parent,
        color = BrickColor.new("White"),
        size = childSize,
        position = childPos
    }

    return Part.createPartWithVectors(dialogBlockProps)
end

module.renderDialog = renderDialog
return module
