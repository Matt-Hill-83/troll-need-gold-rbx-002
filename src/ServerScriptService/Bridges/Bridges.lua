local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local module = {}

function module.destroyBridges(props)
    -- all bridges are created in clone.
    -- remove bridges that do not go anywhere
    local sceneConfig = props.sceneConfig
    local clonedScene = props.clonedScene

    local showBottomPath = sceneConfig.showBottomPath
    local showRightPath = sceneConfig.showRightPath
    local showTopPath = sceneConfig.showTopPath
    local showLeftPath = sceneConfig.showLeftPath

    local bridgeRightModel = Utils.getFirstDescendantByName(clonedScene,
                                                            "BridgeRightModel")
    if (showRightPath) then
        local bridgeWallRight = Utils.getFirstDescendantByName(clonedScene,
                                                               "BridgeWallRight")
        bridgeWallRight.Parent = nil
        bridgeWallRight:Destroy()
    else
        bridgeRightModel.Parent = nil
        bridgeRightModel:Destroy()
    end

    if (showLeftPath) then
        local bridgeWallLeft = Utils.getFirstDescendantByName(clonedScene,
                                                              "BridgeWallLeft")

        bridgeWallLeft.Parent = nil
        bridgeWallLeft:Destroy()
    else
        Utils.deleteChildrenByName({
            parent = clonedScene,
            childName = "WallLeftOld"
        })
    end

    local bridgeBottomModel = Utils.getFirstDescendantByName(clonedScene,
                                                             "BridgeBottomModel")
    if (showBottomPath) then
        local bridgeWallFront = Utils.getFirstDescendantByName(clonedScene,
                                                               "BridgeWallFront")
        bridgeWallFront.Parent = nil
        bridgeWallFront:Destroy()
    else
        bridgeBottomModel.Parent = nil
        bridgeBottomModel:Destroy()
    end

    if (showTopPath) then
        local bridgeWallBack = Utils.getFirstDescendantByName(clonedScene,
                                                              "BridgeWallBack")
        bridgeWallBack.Parent = nil
        bridgeWallBack:Destroy()
    else
        Utils.deleteChildrenByName({
            parent = clonedScene,
            childName = "WallBackOld"
        })
    end

end

return module
