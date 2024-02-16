# **Different Approch**

> Big thanks goes to [ChibiDenDen](https://github.com/ChibiDenDen) for suggesting this ❤️

## Original

Lets first review the clasic approch:

**Creational Patterns:**
Deal with object creation in a flexible and efficient way.

**Structural Patterns:**
Focus on how objects and classes are composed to form larger structures.

**Behavioral Patterns:**
Define how objects communicate and collaborate with each other.

### Summary

| Group      | Focus                                  | Key Benefits                                      | Examples                           |
| ---------- | -------------------------------------- | ------------------------------------------------- | ---------------------------------- |
| Creational | Creating objects                       | Flexibility, decoupling, code reuse               | Singleton, Factory Method, Builder |
| Structural | Composing objects and classes          | Improved organization, flexibility, extensibility | Adapter, Composite, Proxy          |
| Behavioral | Object communication and collaboration | Loose coupling, flexibility, easier testing       | Observer, Strategy, Command        |

---

## Alternative

And now lets review the different approch ✨
lets consider different approch to design patterns, we can categorize them based on the following:

### Building Blocks

Lets define a group of design patterns used as basic building blocks.

- Builder (thats an easy one)
- Prototype
- Adapter
- Bridge
- Composite
- Facade
- Iterator

---

### Strange and Unusual

Some of the design patterns are weirder than others, but it doesn't mean they are not useful.

- Singleton
- Flyweight
- Memento

*In a way, you can remember them as having soemthing to do with memory or trying to conserve resources.*

---

### Based on callbacks

Now this is a big one, quite a few design patterns utilize **callbacks**:

- Factory Method
- Abstract Factory
- Decorator
- Observer
- Proxy
- Strategy
- Command
- Template Method
- State
- Chain of Responsibility
- Visitor
- Mediator

we can use it to simplify our work and make it easier to understand and maintain.

---

#### Callbacks

##### What are callbacks ?

Callbacks are essentially executable code chunks passed as arguments to other functions.
These functions (recipients) can then "call back" or execute the passed code later as needed.

Benefits of using callbacks:

- Dynamic Behavior
  Allow flexible customization of function behavior through different callback implementations.
- Asynchronous Handling
  Enable handling asynchronous operations where results aren't immediately available (callback is invoked when ready).
- Modular Design
  Promote code reusability and organization by encapsulating reusable functionality within callbacks.

---

###### Lambdas

Create anonymous functions on the fly, suitable for simple, short-lived callbacks within a specific scope.

**Pros**
Easy to define anonymous functions on the fly within a specific scope.

**Cons**
Limited functionality and readability for complex logic.

```python
def greet(name, callback):
  print(f"Hello, {name}!")
  callback()

greet("Bob", lambda: print("Goodbye from lambda"))
```

---

###### Bound Methods

Pass methods bound to specific objects, allowing the callback to access object attributes and methods when needed.

**Pros**
Useful when the callback needs to access an object's attributes or methods.

**Cons**
Binds the method to a specific object instance.

```python
class Person:
  def __init__(self, name):
    self.name = name

  def greet(self, greeting):
    print(f"{greeting}, {self.name}!")

person = Person("Alice")
greet("Hi", person.greet)
```

---

###### Classes

Define separate classes for complex callback logic, offering a structured and organized approach for intricate behaviors.

**Pros**
Ideal for complex callback logic requiring structure and organization.

**Cons**
More verbose and might be overkill for simple tasks.

```python
class GoodbyeMessage:
  def __init__(self, name):
    self.name = name

  def __call__(self):
    print(f"Goodbye, {self.name}!")

greet("David", GoodbyeMessage("David"))
```

---

##### Connecting Callbacks and Design Patterns

Design patterns leverage callbacks to achieve specific functionalities, some examples:

###### Strategy Pattern

Encapsulate different algorithms within interchangeable "strategies" (objects with callback methods).

> The main function receives a strategy object and calls its callback method to execute the chosen algorithm dynamically.

###### Observer Pattern

Define a one-to-many relationship where "subjects" notify registered "observers" (objects with callback methods) about changes.

> When a subject changes, it calls the update callback method of all registered observers, notifying them about the change.

###### Command Pattern

Encapsulate requests as objects, allowing queuing, logging, and undo/redo capabilities.

> The command object's execute method acts as a callback, encapsulating the actual request execution logic.

---

##### Choosing the Right Approach

###### Consider the complexity of the callback logic

Simple tasks might be well-suited for lambdas or bound methods, while complex scenarios benefit from classes.

###### Evaluate the need for object context

Bound methods are essential when the callback requires access to object-specific data or behavior.

###### Maintainability and clarity

Prioritize the approach that makes your code easy to understand and modify in the long run.

---

### Summary

Lets summarize the different approch to design patterns groups:

| Group               | Focus                             | Examples                      |
| ------------------- | --------------------------------- | ----------------------------- |
| Building Blocks     | Basic and very common             | Builder, Adapter, Facade    |
| Strange and Unusual | Resource manipulation            | Flyweight, Memento           |
| Based on callbacks  | Advance handeling using functions | Observer, Visitor, Mediator |
