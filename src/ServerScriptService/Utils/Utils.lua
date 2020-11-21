local module = {}

function module.mergeTables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
        --
    end
    --
end

addPadding = function(props)
    local parent = props.parent
    local paddingPct = props.paddingPct

    local UIPadding = Instance.new("UIPadding", parent)

    UIPadding.PaddingBottom = UDim.new(paddingPct, 0)
    UIPadding.PaddingTop = UDim.new(paddingPct, 0)
    UIPadding.PaddingLeft = UDim.new(paddingPct, 0)
    UIPadding.PaddingRight = UDim.new(paddingPct, 0)
end

setMaterialPebble = function(part)
    part.Material = Enum.Material.Pebble
    part.BrickColor = BrickColor.new("Institutional white")
end

module.addPadding = addPadding
module.setMaterialPebble = setMaterialPebble

return module
