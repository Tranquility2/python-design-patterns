# **Singleton design pattern**

Your One-and-Only Object

> In essence, the Singleton design pattern acts as your city's mayor's office, ensuring centralized control, efficient resource management, and a single point of contact for vital functionalities within your application.

## Review

1. Singleton class creation: The class itself ensures that only one instance is ever created, often using private constructors and static access methods.
2. Global access point: The class provides a publicly accessible method to retrieve the single instance, often called `getInstance()`.
3. Client interaction: Clients use the `getInstance()` method to access the singleton object and utilize its functionalities.
4. Controlled state: The singleton object can maintain any necessary state, accessible only through its methods, ensuring consistency throughout the program.

## Benefits

* **Centralized control**
  Manage resource access, configuration, or stateful logic through a single point.
* **Improved performance**
  Avoids unnecessary object creation and redundant resource allocation.
* **Simplified code**
  Eliminates concerns about multiple instances and conflicting state.
* **Global accessibility**
  Provides convenient access to the single instance from any part of the code.

## Example

```python
class Singleton:
    _instance = None  # Class variable to hold the instance

    def __new__(cls, *args, **kwargs):
        if not cls._instance:
            cls._instance = super().__new__(cls, *args, **kwargs)
        return cls._instance

    def __init__(self, value):
        self.value = value

# Client code
singleton1 = Singleton(10)
singleton2 = Singleton(20)  # Won't create a new instance

print(singleton1.value)  # Output: 10
print(singleton2.value)  # Output: 10 (same instance)
print(singleton1 is singleton2)  # Output: True (same object)

```

## Remember

* Use the Singleton pattern when only one instance of a class is necessary for your application.
* Overuse can lead to tight coupling and difficulty in testing or modifying the Singleton logic.
* Choose clear and descriptive names for the Singleton class and access methods.
