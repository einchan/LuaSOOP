--[[ LuaSOOP - Simple Object Oriented Programming]]

local object = {}

-- Returns a table with .parent field and metatable __index pointing to self.
-- This mean that any key not in the child will be looked up in the parent.
-- Even when keys are overridden, the parent can be accessed through ._parent
-- eg. Fiction = Book:subclass()
function object:subclass ()
    local child = {}
    setmetatable(child, {__index = self})
    child._parent = self
	return child
end

-- Essentailly an alias of object:subclass()
-- eg. Dog = class (Animal)
function class (parentClass)
    local parent = parentClass or object
    return parent:subclass()
end


-- Create a new instance of a class.
-- If passed a table, it calls :init(table) on the new instance,
-- which copies the table to the instance unless :init() has been overridden.
-- eg. ball = Toy:new({bouncy = true, colour = "red", price = 6.5})
function object:new (params)
    instance = object.subclass(self)
    if type(params) == "table" then 
        instance:init(params)
    end
    return instance
end

-- Essentially an alias of object:new()
-- eg. tree1 = instance (OakTree, {position = {34, 17}, squirrels = true})
function instance (parentClass, params)
    local parent = parentClass or object
    return parent:new(params)
end

-- Copies a table to the object which calls it.
function object:init (params)
    if type (params) == "table" then
        for k, v in pairs(params) do self[k] = v end
    end
end