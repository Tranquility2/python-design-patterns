# **Chain of Responsibility Design Pattern**

Passing the Torch for Efficient Handling

> In essence, the Chain of Responsibility Design Pattern lets you hand off tasks to the most qualified handler, ensuring efficient and focused processing, just like a well-coordinated relay race.

---

## Workflow

1. Client sends a request to the first handler in the chain.
2. Each handler checks if it can handle the request based on its specific capabilities.
3. If the handler can handle the request, it performs the necessary processing and returns a result.
4. If the handler cannot handle the request, it passes it to the next handler in the chain.
5. The process continues until a handler successfully handles the request or the end of the chain is reached.

---

## Benefits

* **Loose coupling**
  Clients don't know or care which handler handles the request, promoting modularity and flexibility.
* **Improved code organization**
  Separates handling logic into specific handlers, making code cleaner and easier to maintain.
* **Flexible handling**
  Allows adding or removing handlers dynamically based on the request or context.
* **Reduced code duplication**
  Avoids redundant logic by delegating handling to specific handlers.

---

## Example

```python
class Handler:
    def __init__(self, successor=None):
        self.successor = successor

    def handle(self, request):
        handled = self._handle(request)
        if not handled and self.successor is not None:
            return self.successor.handle(request)

    def _handle(self, request):
        raise NotImplementedError("Subclasses must implement this method")

class ConcreteHandler1(Handler):
    def _handle(self, request):
        if request < 10:
            print("Handler 1 handled the request:", request)
            return True
        return False

class ConcreteHandler2(Handler):
    def _handle(self, request):
        if 10 <= request < 20:
            print("Handler 2 handled the request:", request)
            return True
        return False

class DefaultHandler(Handler):
    def _handle(self, request):
        print("No handler found for the request:", request)
        return True  # Consider returning False if unhandled requests are an error

# Create a chain of handlers
handler1 = ConcreteHandler1()
handler2 = ConcreteHandler2(handler1)
default_handler = DefaultHandler(handler2)

# Send requests through the chain
requests = [5, 15, 25]
for request in requests:
    default_handler.handle(request)

```

---

## Remember

* Use the Chain of Responsibility when you have diverse requests with specialized handling needs.
* Overuse can lead to complex chains and difficulty in identifying the responsible handler.
* Clearly define the order and responsibilities of handlers in the chain.
