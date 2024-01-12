# **Composite design pattern**

Building Things with Building Blocks

> In essence, the composite pattern simplifies building complex structures by treating "parts" and "wholes" similarly, giving you more flexibility and code reuse.

## Ojective

1. Leaves and composites share a common interface: Both expose functionalities to draw, move, etc.
2. Clients treat everything as shapes: You can draw or move either a leaf or a composite without knowing its internal structure.
3. Composites act like containers: They manage their children (other shapes) and handle client requests through them.

## Benefits

* **Easier building**
  Create intricate structures by nesting leaves and composites.
* **Flexible hierarchy**
  Add or remove elements from the structure on the fly.
* **Uniform treatment**
  Treat all elements consistently, regardless of their complexity.
* **Code reuse**
  Common operations get implemented once for all types of shapes.

## Example

```python
# Abstract Shape class with a draw method as the common operation
class Shape:
    def __init__(self, name):
        self.name = name

    def draw(self):
        raise NotImplementedError

# Leaf shapes implementing specific draw behaviors
class Circle(Shape):
    def draw(self):
        print(f"Drawing circle named {self.name}")

class Square(Shape):
    def draw(self):
        print(f"Drawing square named {self.name}")

# Composite class that can hold other shapes and performs a recursive draw for its children
class Group(Shape):
    def __init__(self, name):
        super().__init__(name)
        self.children = []

    def add(self, shape):
        self.children.append(shape)

    def draw(self):
        print(f"Drawing group named {self.name}")
        for child in self.children:
            child.draw()

# Client code
circle1 = Circle("Circle 1")
square1 = Square("Square 1")

group1 = Group("Group 1")
group1.add(circle1)
group1.add(square1)

group2 = Group("Group 2")
group2.add(Group("Nested Group"))
group2.add(circle1)

group2.draw()  # Outputs:
# Drawing group named Group 2
# Drawing group named Nested Group
# Drawing circle named Circle 1
# Drawing group named Group 1
# Drawing circle named Circle 1
# Drawing square named Square 1
```

## Remember

* Use composite when dealing with hierarchical structures built from similar components.
* Overuse can lead to deep nesting and complex code. Balance is key.
