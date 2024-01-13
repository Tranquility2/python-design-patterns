# **Prototype design pattern**

Cloning Your Way to Efficiency

> In essence, the Prototype design pattern empowers you to leverage the success of existing objects, making your creation process faster, more efficient, and more flexible.

## Review

1. Client interacts: You choose the existing prototype you want to base your new object on.
2. Prototype cloning: The pattern creates a duplicate of the chosen prototype, preserving its state.
3. Customization (optional): You can modify the cloned object's properties to create your own variation.
4. New object creation: The customized clone becomes the new object, ready for use.

## Benefits

* **Improved performance**
  Cloning existing objects is often faster than creating new ones from scratch.
* **Reduced memory usage**
  Sharing common data between prototypes and clones saves memory.
* **Flexibility**
  Easily create variations based on existing prototypes with minimal code changes.
* **Simplified complex object creation**
  Avoids the need to manually define intricate object states.

## Example

```python
import copy

class Prototype:
    def clone(self):
        return copy.deepcopy(self)  # Create a deep copy of the object

class ConcretePrototype1(Prototype):
    def __init__(self, field1):
        self.field1 = field1

class ConcretePrototype2(Prototype):
    def __init__(self, field2):
        self.field2 = field2

# Client code
prototype1 = ConcretePrototype1("Prototype 1 data")
prototype2 = ConcretePrototype2("Prototype 2 data")

# Clone and modify prototypes
clone1 = prototype1.clone()
clone1.field1 = "Modified data for clone 1"

clone2 = prototype2.clone()
clone2.field2 = "Modified data for clone 2"

print(clone1.field1)  # Output: Modified data for clone 1
print(clone2.field2)  # Output: Modified data for clone 2
```

## Remember

* Use the Prototype pattern when creating similar objects from a common base.
* Overuse can lead to rigid object structures and difficulty in modifying prototypes.
* Choose meaningful names for prototypes and clones for clarity.
