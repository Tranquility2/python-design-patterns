# Bridge Design Pattern

Decoupling Abstraction from Implementation.

> In essence, the bridge pattern decouples abstraction from implementation, promoting flexibility, maintainability, and cleaner code.

## Ojective

* Separate hierarchies: Define one for abstraction (Shape, Triangle, etc.) and another for implementation (RedDrawer, BlueDrawer, etc.).
* Bridge objects: Each abstraction holds a reference to an implementation object (its "color").
* Client independence: Clients only interact with the abstraction, unaware of the implementation details.

## Benefits

* **Independent change**
  Modifying one hierarchy (shapes or colors) doesn't affect the other.
* **Flexible extension**
  Add new shapes or colors without messing up existing code.
* **Improved decoupling**
  Makes code cleaner and easier to maintain.

## Example

```python
# Abstraction: Shape
class Shape:
    def __init__(self, drawer):
        self.drawer = drawer

    def draw(self):
        self.drawer.draw_shape(self)

# Refined Abstractions: Circle, Square
class Circle(Shape):
    def __str__(self):
        return "Circle"

class Square(Shape):
    def __str__(self):
        return "Square"

# Implementor: Drawer
class Drawer:
    def draw_shape(self, shape):
        raise NotImplementedError("Implement in subclasses")

# Concrete Implementors: RedDrawer, BlueDrawer
class RedDrawer(Drawer):
    def draw_shape(self, shape):
        print(f"Drawing {shape} in red")

class BlueDrawer(Drawer):
    def draw_shape(self, shape):
        print(f"Drawing {shape} in blue")

# Client code
red_circle = Circle(RedDrawer())
blue_square = Square(BlueDrawer())

red_circle.draw()  # Output: Drawing Circle in red
blue_square.draw()  # Output: Drawing Square in blue
```

## Remember

* Use bridge when there are multiple independent dimensions (like shapes & colors) to avoid an explosion of subclasses.
* Overuse can lead to complex structures. Weigh the benefits against increased code complexity.
