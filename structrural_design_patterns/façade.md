# **Facade design pattern**

One-Stop Shop for Complexity

> In a nutshell, the facade design pattern provides a simple and organized way to access complex systems, making them easier to use and maintain for both developers and users.

## Review

1. Facade class: Acts as the single point of entry, encapsulating the complexity of the system behind it.
2. Internal system: The maze of interconnected components that actually perform the work.
3. Client interaction: Clients interact only with the facade, unaware of the internal structure.

## Benefits

* **Simplifies access**
  Provides a clean and easy-to-use interface for complex systems.
* **Improves decoupling**
  Reduces client dependence on the internal implementation details.
* **Enhances maintainability**
  Isolates changes in the internal system from the facade.
* **Increases flexibility**
  Allows easy modification of the internal system without affecting the facade.

## Example

```python
class Subsystem1:
    def operation1(self):
        print("Subsystem1: Ready!")

class Subsystem2:
    def operation2(self):
        print("Subsystem2: Get ready!")

class Facade:
    def __init__(self):
        self.subsystem1 = Subsystem1()
        self.subsystem2 = Subsystem2()

    def do_something(self):
        print("Facade initializes subsystems:")
        self.subsystem1.operation1()
        self.subsystem2.operation2()
        print("Facade orders subsystems to perform actions:")
        # ... further calls to subsystem operations

# Client code
facade = Facade()
facade.do_something()  # Output:
# Facade initializes subsystems:
# Subsystem1: Ready!
# Subsystem2: Get ready!
# Facade orders subsystems to perform actions:
```

## Remember

* Use facades for complex systems with multiple entry points.
* Overuse can mask internal complexity and lead to a "black box" effect.
* Choose clear and meaningful facade names for intuitive interactions.
