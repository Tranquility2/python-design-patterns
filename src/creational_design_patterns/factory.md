# **Factory design pattern**

Personal Object Assembly Line

> In a nutshell, the Factory design pattern acts as your personal object assembly line, adapting to your needs and delivering the objects you need, right when you need them.

## Review

1. Client orders: You tell the factory what kind of object you need, providing any necessary specifications.
2. Factory delegation: The factory analyzes your request and chooses the appropriate concrete creator based on specifications.
3. Concrete creator builds: The chosen craftsperson utilizes their skills and tools to build the object according to your specs.
4. Product delivery: The factory then presents you with the final, completed object.

## Benefits

* **Flexibility**
  Easily create different types of objects without modifying the client code.
* **Decoupling**
  Clients rely on the factory, not specific creators, reducing dependencies.
* **Centralized control**
  Manage object creation logic and maintain code for different types in one place.
* **Open-closed principle**
  Extend functionality by adding new concrete creators without changing existing code.
* **Code reusability**
  Share common functionalities among creators for efficient development.

## Example

```python
class Product:
    def use(self):
        raise NotImplementedError("Subclasses must implement the use() method")

class ConcreteProduct1(Product):
    def use(self):
        print("Using Product 1")

class ConcreteProduct2(Product):
    def use(self):
        print("Using Product 2")

class Factory:
    @staticmethod
    def create_product(product_type):
        if product_type == "1":
            return ConcreteProduct1()
        elif product_type == "2":
            return ConcreteProduct2()
        else:
            return None

# Client code
client = Factory.create_product("1")  # Client doesn't know concrete product types
client.use()  # Output: Using Product 1

client = Factory.create_product("2")
client.use()  # Output: Using Product 2
```

## Remember

* Use the Factory pattern when you need to create multiple object types with varying specifications.
* Overuse can lead to complex factory logic and unnecessary abstraction for simple object creation.
* Choose clear and descriptive factory and creator names for intuitive usage.
