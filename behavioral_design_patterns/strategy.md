# **Strategy design pattern**

A Toolbox for Algorithms, Switching on the Fly

> In essence, the Strategy design pattern empowers your program to be like a master chef, wielding a toolbox of algorithms and choosing the right tool for the job, adapting effortlessly to any situation.

## Workflow

1. Define an interface for the "strategy" (the algorithm). This specifies the methods the strategy needs to implement for performing the desired operation.
2. Create concrete strategy classes. Each class implements the interface with its own specific algorithm for handling a particular situation.
3. The main program has a "context" object. This object holds a reference to the current strategy and delegates the actual operation to the chosen strategy.
4. The context can change the strategy at runtime. Based on the situation, it can choose and assign a new strategy object, effectively switching the algorithm used.

## Benefits

* **Increased flexibility**
  You can easily add new algorithms without modifying the core logic.
* **Improved maintainability**
  Code for each algorithm is isolated and easier to manage.
* **Open/closed principle**
  The core logic is closed for modification but open for extension with new strategies.
* **Decoupling**
  The context doesn't depend on the specific implementation of the chosen strategy.

## Example

```python
from abc import ABC, abstractmethod

class SortingStrategy(ABC):
    @abstractmethod
    def sort(self, data):
        pass

class BubbleSort(SortingStrategy):
    def sort(self, data):
        # Implement bubble sort algorithm here
        return sorted_data

class MergeSort(SortingStrategy):
    def sort(self, data):
        # Implement merge sort algorithm here
        return sorted_data

class Context:
    def __init__(self, strategy):
        self.strategy = strategy

    def set_strategy(self, strategy):
        self.strategy = strategy

    def sort_data(self, data):
        return self.strategy.sort(data)

# Client code using the Strategy pattern
context = Context(BubbleSort())  # Start with bubble sort
data = [3, 1, 5, 2, 4]
sorted_data = context.sort_data(data)
print(sorted_data)  # Output: [1, 2, 3, 4, 5]

context.set_strategy(MergeSort())  # Switch to merge sort
more_data = [6, 8, 1, 4, 9]
sorted_more_data = context.sort_data(more_data)
print(sorted_more_data)  # Output: [1, 4, 6, 8, 9]

```

## Remember

* Increased flexibility: You can easily add new algorithms without modifying the core logic.
* Improved maintainability: Code for each algorithm is isolated and easier to manage.
* Open/closed principle: The core logic is closed for modification but open for extension with new strategies.
* Decoupling: The context doesn't depend on the specific implementation of the chosen strategy.
