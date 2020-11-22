local module = {}

-- 
-- 
-- 

function addcfv3(a, b)
    local x, y, z, m11, m12, m13, m21, m22, m23, m31, m32, m33 = a:components()
    return CFrame.new(x + b.x, y + b.y, z + b.z, m11, m12, m13, m21, m22, m23,
                      m31, m32, m33);
end

function getModelRoot(props)
    local modelName = props.modelName
    local parent = props.parent
    print('parent' .. ' - start');
    print(parent);
    print('parent' .. ' - end');
    print('modelName' .. ' - start');
    print(modelName);
    print('modelName' .. ' - end');
    local model = parent:FindFirstChild(modelName)
    local modelRootPart = model:FindFirstChild(modelName .. "Root")
    print('modelRootPart' .. ' - start');
    print(modelRootPart);
    print('modelRootPart' .. ' - end');
    model.PrimaryPart = modelRootPart
    return {model = model, modelRootPart = modelRootPart}
end

function cloneModel(props)
    local modelName = props.modelName
    local parent = props.parent
    local offset = props.offset

    local sceneBase = getModelRoot({
        modelName = modelName .. "Model",
        parent = parent
    })

    local sceneBaseModel = sceneBase.model
    local sceneBaseModelClone = sceneBaseModel:Clone()

    sceneBaseModelClone.Parent = sceneBaseModel.Parent
    sceneBaseModelClone.Name = modelName .. "--clone"

    local newPosition = sceneBaseModel.PrimaryPart.Position + offset

    sceneBaseModelClone:MoveTo(newPosition)
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

print(tableToString(test))

-- 
-- 
-- 

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
module.tableToString = tableToString
module.getModelRoot = getModelRoot
module.cloneModel = cloneModel
module.addcfv3 = addcfv3

return module
