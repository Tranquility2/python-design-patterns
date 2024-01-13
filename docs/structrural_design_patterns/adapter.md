# **Adapter Design Pattern**

Bridge between incompatible interfaces

> In a nutshell, the adapter Design Pattern is a powerful tool for building flexible and future-proof software by creating bridges between incompatible interfaces.

---

## Flow

1. Client wants "A", adaptee provides "B".
2. Adapter wraps "B" and pretends to be "A".
3. Client interacts with adapter, unaware of "B".

---

## Benefits

* **Increased compatibility**
  Existing code and new code can work together without modifying their original interfaces.
* **Improved flexibility**
  Makes code more adaptable to changes in requirements or external components.
* **Enhanced reusability**
  Adapters promote code reuse by allowing objects to work with different interfaces.
* **Simplified integration**
  Integrating third-party libraries or legacy systems becomes smoother.

---

## Example

```python
# Target interface: the interface the client expects
class Target:
    def request(self):
        pass

# Adaptee: the existing class with a different interface
class Adaptee:
    def specific_request(self):
        print("Adaptee's specific request")

# Adapter: bridges the gap between Target and Adaptee
class Adapter(Target):
    def __init__(self, adaptee):
        self.adaptee = adaptee

    def request(self):
        self.adaptee.specific_request()

# Client code
client = Client()
adapter = Adapter(Adaptee())
client.do_something(adapter)  # Client interacts with the adapter seamlessly
```

---

## Remember

* Use adapters when existing interfaces pose a compatibility issue, not just for minor differences.
* Overusing adapters can lead to a complex code structure. Balance is key.
