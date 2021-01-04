local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Utils3 = require(Sss.Source.Utils.U003PartsUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

renderQuestBlock = function(props)
    local parent = props.parent
    local size = props.size
    local questBlockTemplate = props.questBlockTemplate

    local dockBase = Utils.getFirstDescendantByName(questBlockTemplate,
                                                    "DockBase")

    local dockPositioner = Instance.new("Part", parent)
    dockPositioner.Size = size

    local translateCFrameProps = {
        parent = parent,
        child = dockPositioner,
        offsetConfig = {
            useParentNearEdge = Vector3.new(1, -1, 0),
            useChildNearEdge = Vector3.new(-1, -1, 0)
        }
    }

    local newCFrame =
        Utils3.setCFrameFromDesiredEdgeOffset(translateCFrameProps)
    dockPositioner.CFrame = newCFrame

    dockBase.Size = dockPositioner.Size
    dockBase.CFrame = dockPositioner.CFrame

    dockPositioner:Destroy()
    return questBlockTemplate
end

module.renderQuestBlock = renderQuestBlock
return module
