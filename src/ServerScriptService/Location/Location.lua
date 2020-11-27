local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Bridges = require(Sss.Source.Bridges.Bridges)
local Characters = require(Sss.Source.Characters.Characters)
local RowOfParts = require(Sss.Source.AddRemoteObjects.RowOfParts)
local Constants = require(Sss.Source.Constants.Constants)

local module = {}

function module.addLocation(props)
    local scene = props.scene
    local sceneConfig = props.sceneConfig

    -- Image
    -- Image
    local locationModelImage = Utils.getFirstDescendantByName(scene,
                                                              "LocationModelImage")
    local imageLabelFront = Utils.getFirstDescendantByName(locationModelImage,
                                                           'ImageLabel')
    local imageId = Utils.getDecalIdFromName({name = sceneConfig.name})
    imageLabelFront.Image = 'rbxassetid://' .. imageId

    -- Label
    -- Label
    local locationModelLabel = Utils.getFirstDescendantByName(scene,
                                                              "LocationModelLabel")
    local textLabel = Utils.getFirstDescendantByName(locationModelLabel,
                                                     'TextLabel')
    textLabel.Text = Utils.getDisplayNameFromName({name = sceneConfig.name})

end

return module
