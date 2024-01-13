# **Decorator design pattern**

Adding Layers Like an Onion

> In a nutshell, the decorator pattern empowers you to customize existing functionality without modifying its core, adding layers of magic like toppings on your sandwich.

## Review

1. Decorators wrap the base object, inheriting its interface and adding their own functionality.
2. Clients interact with the decorated object, unaware of the base object or additional layers.
3. Decorators can chain together, forming a stack of modifications on top of the base object.

## Benefits

* **Extend functionality without modifying the base object**
  No need to touch the core code, keeping it clean and maintainable.
* **Dynamic customization**
  Add or remove layers as needed at runtime.
* **Open-closed principle**
  Extend functionality without modifying existing code.
* **Code reuse**
  Create reusable decorators for common functionalities.

## Example

```python
def my_decorator(func):
    def wrapper(*args, **kwargs):
        print("Before calling the function")
        result = func(*args, **kwargs)
        print("After calling the function")
        return result
    return wrapper

@my_decorator
def say_hello(name):
    print(f"Hello, {name}!")

say_hello("Tom")  # Output:
# Before calling the function
# Hello, Tom!
# After calling the function
```

## Remember

* Use decorators for adding specific functionalities, not for major changes.
* Overuse can lead to deeply nested layers and complex code.
* Choose meaningful names for decorators to clarify their purpose.
