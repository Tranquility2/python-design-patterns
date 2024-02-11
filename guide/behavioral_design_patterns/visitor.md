# **Visitor Design Pattern**

Unleashing Flexibility Without Modifying Existing Structures

> In essence, the Visitor Design Pattern lets you unleash a variety of analyses and operations on your existing structures without getting your hands dirty. The elements work together without modifying each other, promoting clean, flexible, and adaptable code.

---

## Workflow

1. Define an interface for the "visitor" (the operation). This interface specifies the methods the visitor can use to interact with different elements.
2. Each element implements an "accept" method. This method takes a visitor as an argument and allows the visitor to perform its specific operation on the element.
3. Concrete visitor classes implement the visitor interface. Each class implements the methods defined in the interface, customizing the operation for different purposes.
4. Clients create and use specific visitor objects. They pass the chosen visitor to the elements via the "accept" method, triggering the desired analysis.

---

## Benefits

* **Enhanced flexibility**
  New operations can be implemented by creating new visitor classes without modifying existing garden elements.
* **Loose coupling**
  Garden elements and visitors are decoupled, promoting independent development and easier maintenance.
* **Open/closed principle**
  The garden elements are open for extension but closed for modification, promoting code stability.
* **Reduced code duplication**
  Common operation logic can be centralized in visitor classes, avoiding repetition.

---

## Example

```python
from abc import ABC, abstractmethod

class GardenElement(ABC):
    @abstractmethod
    def accept(self, visitor):
        pass

class Rose(GardenElement):
    def accept(self, visitor):
        visitor.visit_rose(self)

    def get_color(self):
        return "Pink"

class Lily(GardenElement):
    def accept(self, visitor):
        visitor.visit_lily(self)

    def get_scent(self):
        return "Sweet"

class Visitor(ABC):
    @abstractmethod
    def visit_rose(self, rose):
        pass

    @abstractmethod
    def visit_lily(self, lily):
        pass

class HeightVisitor(Visitor):
    def __init__(self):
        self.heights = []

    def visit_rose(self, rose):
        self.heights.append(1.5)  # Assume roses are 1.5 meters tall

    def visit_lily(self, lily):
        self.heights.append(0.8)  # Assume lilies are 0.8 meters tall

class ScentVisitor(Visitor):
    def __init__(self):
        self.scents = []

    def visit_rose(self, rose):
        self.scents.append(rose.get_color())

    def visit_lily(self, lily):
        self.scents.append(lily.get_scent())

# Client code using the visitor pattern
garden = [Rose(), Lily()]

height_visitor = HeightVisitor()
for element in garden:
    element.accept(height_visitor)
print("Average height:", sum(height_visitor.heights) / len(height_visitor.heights))

scent_visitor = ScentVisitor()
for element in garden:
    element.accept(scent_visitor)
print("Collected scents:", scent_visitor.scents)

```

---

## Remember

* Use the Visitor pattern when you need to perform diverse operations on a common set of objects without modifying them.
* Overuse can lead to complex visitor hierarchies and unnecessary abstraction for simple operations.
* Choose clear and descriptive names for the visitor interface, element methods, and visitor classes.
