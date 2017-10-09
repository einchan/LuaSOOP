--[[
newobject = object:subclass() returns an object which can be inherited from by calling newobject:subclass(). newobject itself inherits this ability from object.

By passing any table as the argument to object:subclass(), that table will aquire the subclass() method.

A subclass can access all its parents' methods and fields, or override them.
Overridden methods or fields can still be accessed through self.parentObject:method() (unless you override self.parentobject).
   
Name your constructors whatever you like - :__init__(), :new(), whatever.
~~~~ local this = self or {} ~~~~ would be a good first line of any constructor.
~~~~ self.parentObject.new(this, ...) ~~~~ would be a good second line if you're inheriting.
~~~~setmetatable(this, self) will make the inheritance work.
you could then call class.new() (NO COLON!) to get an instance. Calling class:new() would operate on the base class.

EXAMPLE:
Animal = object:subclass()
function Animal:new(size)
	local this = self or {}
	this.size = size
	return this
end
function Animal:move() print("shuffle shuffle...") end
   
Dog = Animal:subclass()
Dog:move() -- "shuffle shuffle..."
function Dog:new(size, colour)
	local this = self or {}; self.parentObject.new(this, size)
	this.colour = colour
	setmetatable(this, self)
	return this
end
function Dog:bark() if self.size > 10 then print "Woof!" else print "Yap!" end end
   
d1 = Dog.new(15, "tan") -- instance
d1.bark() -- "Woof!"

Dog:new(4, "white") -- Operating on base class; remember the colon!
--All new dogs and everything inheriting will now be small and white by default.

]]



local object = {
	subclass = function (self, child)
		local child = child or {} -- Create an object if user doesn't provide one
		local mt = {__index = self}
		setmetatable(child, mt)
		child.parentObject = self
		return child
	end }
return object
