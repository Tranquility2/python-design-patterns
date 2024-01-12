# **Proxy design pattern**

Bridge to Control and Flexibility

> In a nutshell, the proxy design pattern acts as a versatile bridge between clients and real objects, offering control, flexibility, and enhanced functionality in your software architecture.

## Flow

1. The client interacts with the proxy as if it were the real object, unaware of the intermediary.
2. The proxy receives the client's request, performs any necessary pre-processing or access control, and forwards it to the real object.
3. The real object fulfills the request and sends the response back to the proxy.
4. The proxy processes the response (if needed) and delivers it to the client.

## Benefits

* **Control access**
  You can restrict or modify client requests before reaching the real object.
* **Improved performance**
  Caching or lazy loading can be implemented through the proxy.
* **Enhanced security**
  Sensitive operations can be hidden from direct client access.
* **Increased flexibility**
  You can easily change the real object behind the proxy without affecting the client.

## Example

```python
class RealSubject:
    def request(self):
        print("RealSubject: Handling request.")

class Proxy:
    def __init__(self):
        self._real_subject = None

    def request(self):
        if self._real_subject is None:
            self._real_subject = RealSubject()
        print("Proxy: Pre-processing request.")
        self._real_subject.request()
        print("Proxy: Post-processing request.")

# Client code
proxy = Proxy()
proxy.request()  # Output:
# Proxy: Pre-processing request.
# RealSubject: Handling request.
# Proxy: Post-processing request.
```

## Remember

* Use the proxy pattern when controlling client access or behavior is crucial.
* Overuse can add complexity and mask the real object's location.
* Choose meaningful proxy names to clarify their purpose.
