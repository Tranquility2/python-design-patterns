# **Memento Design Pattern**

A Snapshot of Time, Undoing the Past, Embracing the Future

> In essence, the Memento Design Pattern empowers your code to travel through time, capturing fleeting moments and revisiting them at will. This opens doors for undo/redo functionality, versioning, and alternative paths, fostering a dynamic and flexible environment within your program.

---

## Workflow

1. Define an interface for the "memento". This specifies how to capture the state of the original object and how to restore it later.
2. The original object ("originator") creates a memento object. This happens at specific points in time or when desired, capturing its current state.
3. The memento object stores the captured state. It acts like a sealed container, protecting the information from external modifications.
4. The originator can hold onto multiple mementos. These represent different snapshots of its past states.
5. The originator can restore its state from a specific memento. This involves retrieving the captured information and applying it to its current state, effectively reverting to the saved snapshot.

---

## Benefits

* **Undo/Redo functionality**
  Allows for easily implementing undo and redo features within your program.
* **State checkpointing**
  Enables saving and restoring object states for later use or error recovery.
* **Versioning and experimentation**
  Facilitates creating different versions of an object and exploring alternative scenarios based on restored states.
* **Decoupling**
  The originator and the memento are independent, promoting loose coupling and easier maintenance.

---

## Example

```python
class Memento:
    def __init__(self, state):
        self.state = state

class TextEditor:
    def __init__(self):
        self.text = ""
        self.history = []
        self.redo_history = []

    def write(self, text):
        self.history.append(Memento(self.text))  # Save current state before modification
        self.text += text

    def undo(self):
        if self.history:
            memento = self.history.pop()
            self.redo_history.append(Memento(self.text))  # Add current state to redo history
            self.text = memento.state

    def redo(self):
        if self.redo_history:
            memento = self.redo_history.pop()
            self.history.append(Memento(self.text))  # Add current state to undo history
            self.text = memento.state

# Client code using the Memento pattern
editor = TextEditor()
editor.write("Hello")
editor.write(" world!")
print(editor.text)  # Output: Hello world!

editor.undo()
print(editor.text)  # Output: Hello

editor.redo()
print(editor.text)  # Output: Hello world!

```

---

## Remember

* Use the Memento pattern when you need to undo past actions, revert to previous states, or explore alternative scenarios based on saved states.
* Overuse can lead to complex memento hierarchies for simple objects and unnecessary overhead for frequently changing states.
* Clearly define the responsibilities of the originator and the memento, and ensure efficient storage and retrieval mechanisms for saved states.
