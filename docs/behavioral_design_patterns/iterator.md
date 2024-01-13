# **Iterator design pattern**

Simplifying the Journey, One Step at a Time

> In essence, the Iterator design pattern transforms your exploration of data structures into a guided journey, revealing one element at a time, empowering you to navigate efficiently and focus on what matters most.

## Worflow

1. Define an iterator interface. This specifies the methods like `hasNext()` to check for remaining elements and next() to retrieve the next element.
2. Each collection implements the iterator interface. They create and return an iterator object specific to the collection's internal structure.
3. Clients use the iterator to access elements. They call `hasNext()` to check if there are more elements and next() to retrieve and process each element one at a time.
4. The iterator manages the traversal logic. It keeps track of the current position and advances it appropriately for each `next()` call.

## Benefits

* **Simplified access**
  Clients focus on iterating elements, not worrying about the collection's internal structure.
* **Lazy evaluation**
  Elements are retrieved only when needed, not all at once, improving memory efficiency.
* **Decoupling**
  Changes in the collection's implementation don't affect the iterating client code.
* **Composable operations**
  Iterators can be used with other design patterns like chain of responsibility or observer for efficient processing.

## Example

```python
class NumberCollection:
    def __init__(self):
        self._numbers = [1, 2, 3, 4, 5]

    def __iter__(self):
        return NumberIterator(self._numbers)

class NumberIterator:
    def __init__(self, numbers):
        self._numbers = numbers
        self._index = 0

    def __iter__(self):
        return self

    def __next__(self):
        if self._index < len(self._numbers):
            number = self._numbers[self._index]
            self._index += 1
            return number
        else:
            raise StopIteration

# Client code using the iterator
collection = NumberCollection()
for number in collection:
    print(number)  # Outputs: 1, 2, 3, 4, 5

```

## Remember

* Use the Iterator pattern when you need to sequentially access elements in a collection without exposing its internal details.
* Overuse can lead to complex iterator implementations for simple structures and unnecessary abstractions.
* Choose clear and consistent naming conventions for iterator interfaces and methods.
