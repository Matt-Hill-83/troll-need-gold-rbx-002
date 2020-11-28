local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

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
    local locationBillboardImage = Utils.getFirstDescendantByName(scene,
                                                                  'LocationBillboardImage')
    local imageId = Utils.getDecalIdFromName({name = sceneConfig.name})
    imageLabelFront.Image = 'rbxassetid://' .. imageId
    locationBillboardImage.Image = 'rbxassetid://' .. imageId

    -- Label
    -- Label
    local locationModelLabel = Utils.getFirstDescendantByName(scene,
                                                              "LocationModelLabel")
    local textLabel = Utils.getFirstDescendantByName(locationModelLabel,
                                                     'TextLabel')
    local locationBillboardText = Utils.getFirstDescendantByName(scene,
                                                                 'LocationBillboardText')
    textLabel.Text = Utils.getDisplayNameFromName({name = sceneConfig.name})
    locationBillboardText.Text = Utils.getDisplayNameFromName(
                                     {name = sceneConfig.name})

end

return module
