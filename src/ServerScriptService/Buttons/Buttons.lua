local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local module = {nextButtonEvent = nil, prevButtonEvent = nil}

function updateButtonActiveStatus2(props)
    local pageNum = props.pageNum
    local numPages2 = props.numPages
    local sgui = props.sgui

    local nextButton = Utils.getFirstDescendantByName(sgui, "NextPageButton")
    local prevButton = Utils.getFirstDescendantByName(sgui, "PrevPageButton")
    local pageNumLabel = Utils.getFirstDescendantByName(sgui, "PageNumLabel")

    local lastPage = pageNum >= numPages2
    nextButton.Active = not lastPage
    nextButton.Text = not lastPage and Constants.buttonLabels.NextPage or "---"

    prevButton.Active = pageNum > 1
    prevButton.Text = prevButton.Active and Constants.buttonLabels.PrevPage or
                          "---"

    pageNumLabel.Text = "Page: " .. pageNum .. " of " .. numPages2
end

module.updateButtonActiveStatus2 = updateButtonActiveStatus2
return module
