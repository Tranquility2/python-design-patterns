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

- In Python, a callback is a function that is passed as an argument to another function.
- Allows the recipient function to "call back" the passed function later on, often when a certain event occurs or a condition is met.

You can think about it like giving another function instructions to execute later with potentially different data.

- Since functions are objects in Python, they can be passed around like any other data type. This makes callbacks possible.

---

Check out the following example:

```python
def greet(name, callback):
  print(f"Hello, {name}!")
  callback(name)

def say_goodbye(name):
  print(f"Goodbye, {name}!")

greet("Alice", say_goodbye)
```

In this example, the greet function takes a name and a callback function as arguments.
It prints a greeting and then calls the callback function with the name as an argument.
The say_goodbye function is then used as the callback, printing a goodbye message.

---

##### Common use cases for callbacks in Python

###### Event handling

Callbacks are often used in event-driven programming, where functions are registered to be called when specific events occur.
This is common in GUI frameworks and network programming.

###### Asynchronous programming

Callbacks can be used to handle asynchronous operations like network requests or file I/O, where the result isn't available immediately.
The callback function is invoked with the result when it becomes available.

###### Higher-order functions

Many higher-order functions in Python take callback functions as arguments, allowing you to customize their behavior.
Examples include functions like `map`, `filter`, and `reduce`.

Overall, callbacks offer a powerful tool for dynamically customizing function behavior and event handling in Python **very common in design patterns**.

---

### Summary

Lets summarize the different approch to design patterns groups:

| Group               | Focus                             | Examples                      |
| ------------------- | --------------------------------- | ----------------------------- |
| Building Blocks     | Basic and very common             | Builder, Adapter, Facade    |
| Strange and Unusual | Resource manipulation            | Flyweight, Memento           |
| Based on callbacks  | Advance handeling using functions | Observer, Visitor, Mediator |
