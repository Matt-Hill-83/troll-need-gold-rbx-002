local Sss = game:GetService("ServerScriptService")
local Constants = require(Sss.Source.Constants.Constants)
local module = {}

deleteInstanceByNameStub = function(props)
    local nameStub = props.nameStub
    local parent = props.parent

    local children = parent:GetChildren()
    for _, item in pairs(children) do
        local match = string.match(item.Name, nameStub)
        if item:IsA('Part') and match then
            print('item' .. ' - start');
            print(item);
            print('item' .. ' - end');
            item:Destroy()
            --
        end
    end
end

module.deleteInstanceByNameStub = deleteInstanceByNameStub

return module
