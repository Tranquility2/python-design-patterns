# **Mediator Design Pattern**

The Orchestrator of Collaboration, Bringing Harmony to the Code

> In essence, the Mediator Design Pattern transforms your code into a well-rehearsed orchestra, where objects collaborate seamlessly under the guidance of a central conductor. This promotes clarity, flexibility, and control in your program's communication, ensuring a harmonious symphony of functionality.

---

## Workflow

1. Define a mediator interface. This specifies the methods for sending messages, registering objects, and managing interactions.
2. Concrete objects implement the mediator interface. They register themselves with the mediator and receive messages through it.
3. The mediator acts as a central hub. It receives messages from objects, identifies the relevant target objects, and forwards the messages appropriately.
4. The mediator can also enforce communication rules. It can restrict direct communication between certain objects and ensure proper channels are used.

---

## Benefits

* **Reduced complexity**
  Direct object-to-object communication is replaced by a centralized hub, simplifying code.
* **Decoupling**
  Objects are only aware of the mediator, not each other, promoting loose coupling and easier maintenance.
* **Flexibility**
  New objects can be easily added and integrated into the communication network through the mediator.
* **Centralized control**
  The mediator can enforce rules and restrictions on communication, ensuring consistency.

---

## Example

```python
from abc import ABC, abstractmethod

class Mediator(ABC):
    @abstractmethod
    def send_message(self, sender, message):
        pass

class ChatMediator(Mediator):
    def __init__(self):
        self.users = []

    def register_user(self, user):
        self.users.append(user)

    def send_message(self, sender, message):
        for user in self.users:
            if user != sender:
                user.receive_message(sender, message)

class User:
    def __init__(self, name, mediator):
        self.name = name
        self.mediator = mediator
        mediator.register_user(self)

    def send_message(self, message):
        self.mediator.send_message(self, message)

    def receive_message(self, sender, message):
        print(f"{self.name} received message from {sender}: {message}")

# Client code using the Mediator pattern
mediator = ChatMediator()
john = User("John", mediator)
jane = User("Jane", mediator)

john.send_message("Hi Jane!")
# Output: Jane received message from John: Hi Jane!

jane.send_message("Hello John!")
# Output: John received message from Jane: Hello John!

```

---

## Remember

* Use the Mediator pattern when objects need to communicate indirectly and follow specific interaction rules.
* Overuse can lead to a central bottleneck in the mediator and unnecessary complexity for simple interactions.
* Clearly define the responsibilities of the mediator and the participants in the communication network.
