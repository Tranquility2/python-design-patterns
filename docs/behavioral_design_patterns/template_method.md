# **Template Method Design Pattern**

Baking a Code Recipe with Flexibility

> In essence, the Template Method Design Pattern lets you bake a flexible code recipe, providing a solid foundation while allowing for creative variations and customizations to suit your specific needs.

---

## Workflow

1. Define a superclass with the core algorithm skeleton. This includes the overall flow of steps and placeholder methods for specific actions.
2. Declare the placeholder methods as abstract. These methods need to be implemented by subclasses to define the specific behavior.
3. Subclasses inherit the algorithm and implement the placeholder methods. Each subclass customizes the steps with its own logic, adding unique features or variations.
4. Clients call the main method of the superclass. This triggers the execution of the entire algorithm using the implemented placeholder steps from the chosen subclass.

---

## Benefits

* **Code reusability**
  The core algorithm is implemented once and reused by all subclasses.
* **Flexibility**
  Subclasses can customize specific steps without altering the overall structure.
* **Code organization**
  Clearly separates the core algorithm from variations and promotes modularity.
* **Improved maintainability**
  Changes in the core algorithm affect all subclasses, simplifying updates.

---

## Example

```python
from abc import ABC, abstractmethod

class AlgorithmTemplate(ABC):
    def execute(self):
        self.step1()
        self.step2()
        self.step3()

    @abstractmethod
    def step1(self):
        pass

    @abstractmethod
    def step2(self):
        pass

    @abstractmethod
    def step3(self):
        pass

class ConcreteImplementation1(AlgorithmTemplate):
    def step1(self):
        print("ConcreteImplementation1: Step 1")

    def step2(self):
        print("ConcreteImplementation1: Step 2")

    def step3(self):
        print("ConcreteImplementation1: Step 3")

class ConcreteImplementation2(AlgorithmTemplate):
    def step1(self):
        print("ConcreteImplementation2: Step 1 (with variation)")

    def step2(self):
        print("ConcreteImplementation2: Step 2")

    def step3(self):
        print("ConcreteImplementation2: Step 3 (skipped)")

# Client code using the algorithm template
implementation1 = ConcreteImplementation1()
implementation1.execute()

print("\n")  # Add a separator for visual clarity

implementation2 = ConcreteImplementation2()
implementation2.execute()

```

---

## Remember

* Use the Template Method when you have an algorithm with common steps and variations in specific details.
* Overuse can lead to unnecessary abstraction for simple tasks and complex inheritance hierarchies.
* Choose clear and descriptive names for the superclass, placeholder steps, and subclasses.
