local module = {}

function getDescendantByName(parent, name)
    local model = parent:GetDescendants()
    for i = 1, #model do
        if model[i].Name == name then
            return model[i]
            -- 
        end
    end
end

function addcfv3(a, b)
    local x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33 = a:components()
    return CFrame.new(x + b.x, y + b.y, z + b.z, m11, m12, m13, m21, m22, m23,
                      m31, m32, m33);
end

function cloneModel(props)
    local modelName = props.modelName
    local model = props.model
    local position = props.position

    local sceneBaseModelClone = model:Clone()

    sceneBaseModelClone.Parent = model.Parent
    sceneBaseModelClone.Name = modelName .. "--clone"

    sceneBaseModelClone:MoveTo(position)
    return sceneBaseModelClone
end

local function getNames(tab, name, res, lev)
    res = res or {[tab] = "ROOT"}
    local pls = {}
    lev = lev or 0
    for k, v in pairs(tab) do
        if type(v) == "table" and not res[v] then
            local n = name .. "." .. tostring(k)
            res[v] = n
            pls[v] = n
        end
    end
    for k, v in pairs(pls) do
        getNames(k, v, res)
        pls[k] = lev
    end
    return res, pls
end

function tableToString(tab, a, b, c, d)
    a, b = a or 0, b or {[tab] = true}
    local name = b[tab]
    local white = ("\t"):rep(a + 1)
    if not c then c, d = getNames(tab, "ROOT") end
    local res = {"{"}
    for k, v in pairs(tab) do
        local value
        if type(v) == "table" then
            if d[v] == a and not b[v] then
                b[v] = true
                value = tableToString(v, a + 1, b, c, d)
            else
                value = c[v]
            end
        elseif type(v) == "string" then
            value = '"' .. v:gsub("\n", "\\n"):gsub("\t", "\\t") .. '"'
        else
            value = tostring(v)
        end
        table.insert(res, white .. tostring(k) .. " = " .. value)
    end
    white = white:sub(2)
    table.insert(res, white .. "}")
    return table.concat(res, "\n")
end

local test = {
    str = "Result:\n\t- Unknown",
    number = 12345,
    child = {a = "b"},
    cyclic = {}
}
test.child.cyclic = test.cyclic
test.another = test.child

function module.mergeTables(t1, t2)
    for k, v in pairs(t2) do
        t1[k] = v
        --
    end
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
module.tableToString = tableToString
module.cloneModel = cloneModel
module.getDescendantByName = getDescendantByName
module.addcfv3 = addcfv3

return module
