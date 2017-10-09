local object = {}
function object:subclass ()
    local child = {}
    local mt = {__index = self}
    setmetatable(child, mt)
    child._parent = self
	return child
end

function object:new (params)
    instance = object.subclass(self)
    if params then self:init(params)
    return instance
end

function object:init (params)
    for k, v in pairs(params) do
        self.k = v
    end
end


function class (parentClass)
    local parent = parentClass or object
    local newclass = parent:subclass()
    return newclass
end

function instance (parentClass, params)
    local parent = parentClass or object
    return parent:new(params)
end
    
    