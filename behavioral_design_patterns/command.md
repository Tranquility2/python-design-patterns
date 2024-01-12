# **Command design pattern**

Wrapping Actions for Flexible Execution

> In essence, the Command design pattern simplifies your code by wrapping actions in separate objects, offering a flexible and controlled way to trigger and execute functionalities within your software.

## Workflow

1. Create a command object for each desired action. Each command encapsulates the action to be performed and any necessary parameters.
2. Bind the command object to an event or trigger. This could be a button press, menu selection, or any other user interaction.
3. When the event occurs, the command object is executed. The command retrieves any relevant information and invokes the specific method on the receiver to perform the action.
4. The receiver reacts to the command and performs the desired action. The command remains decoupled from the receiver's internal implementation.

## Benefits

* **Decoupling**
  Client code is isolated from the receiver, improving modularity and reusability.
* **Undo/redo capability**
  Commands can be stored and replayed in sequence, enabling undo/redo functionality.
* **Macro execution**
  Multiple commands can be grouped and executed together as a single unit.
* **Queuing and logging**
  Commands can be queued for later execution or logged for tracking and auditing.

## Example

```python
class Command:
    def __init__(self, receiver):
        self.receiver = receiver

    def execute(self):
        raise NotImplementedError("Subclasses must implement this method")

class ConcreteCommand1(Command):
    def execute(self):
        self.receiver.action1()

class ConcreteCommand2(Command):
    def execute(self):
        self.receiver.action2()

class Receiver:
    def action1(self):
        print("Receiver action 1 executed")

    def action2(self):
        print("Receiver action 2 executed")

# Create a invoker and receiver
invoker = Invoker()
receiver = Receiver()

# Create concrete commands and add them to the invoker
invoker.add_command(ConcreteCommand1(receiver))
invoker.add_command(ConcreteCommand2(receiver))

# Execute commands
invoker.execute_commands()

```

## Remember

* Use the Command pattern when you need to decouple actions from their execution or enable functionality like undo/redo or macro creation.
* Overuse can lead to complex code with numerous small command objects for simple tasks.
* Design clear and concise command interfaces for efficient execution and interaction.
