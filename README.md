# LuaSOOP - Simple OOP for Lua.

Example usage:

```lua
require "SimpleOOP"

Animal = class()
function Animal:move() print "Shuffle shuffle..." end

Dog = class(Animal) -- Subclass of Animal
Cat = Animal:subclass() -- Another way to subclass!

function Dog:bark()
    if self.size > 5 then
        print "WOOF!" else print "Yip!"
    end
end

d1 = Dog:new({size = 4}) -- Create a new instance
d2 = instance(Dog, {size = 7}) -- Another way to create a new instance!

d1:move() -- "Shuffle shuffle..."
d2:bark() -- "WOOF!"

Dog.size = 2

function Dog:move()
    print "The dog pads around"
end

d1:move() -- "the dog pads around"

print(d1.size) -- 4
print(d1._parent.size) -- 2

d1._parent._parent:move() -- "Shuffle shuffle..."
```