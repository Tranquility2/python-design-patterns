# **Anti Patterns**

(Collection of examples of anti-patterns in Python)

> Understanding and avoiding anti-patterns is crucial for writing clean, maintainable, and efficient Python code.

---

#### Not using `with` to open files

* `with` ensures proper file closing even if exceptions occur, preventing resource leaks or data corruption.
* Skipping `with` requires manual closing, prone to error.

##### Example

```python
def bad_open():
    file = open("myfile.txt", "r")
    content = file.read()
    file.close()
# --- vs ---
def good_open():
    with open("myfile.txt", "r") as file:
        content = file.read()
```

---

#### Overusing list/dict/set comprehensions

* While powerful, using them for simple tasks adds complexity and reduces readability.
* Consider simpler loops or explicit variable assignments for clarity.

##### Example

```python
filtered_users = {user['name']: user for user in users if user['age'] > 18}
# This comprehension builds a dictionary based on age filtering, but it's less clear than:
filtered_users = {}
for user in users:
    if user['age'] > 18:
        filtered_users[user['name']] = user

```

---

#### Unnecessary use of generators

* Generators are memory-efficient for large datasets, but not always necessary for small ones.
* Using them for simple iterations without performance concerns adds unneeded complexity.

##### Example
```python
def count_letters(text):
  return sum(1 for char in text if char.isalpha())  # Generator for simple counting
# --- vs ---
def count_letters(text):
  count = 0
  for char in text:
    if char.isalpha():
      count += 1
  return count  # Direct counter
```

---

#### Returning multiple object types from a function

* Makes code harder to understand and reuse.
* Use namedtuples, return dictionaries, or separate functions for clarity and flexibility.

##### Example
```python
def get_user_info(user_id):
    if user_id in active_users:
        return active_users[user_id]  # Returns a dictionary
    else:
        return None  # Returns NoneType
# This function might return a dictionary or None, making it less predictable and harder to use.
def get_user_info(user_id):
    user = active_users.get(user_id)  # Use .get() for consistent return type
    return user or {}  # Return an empty dictionary if user not found
```
---

#### Not using `get()` for default values in dictionaries

* Checking key existence and assigning a default value is verbose and inefficient.
* `dict.get(key, default)` provides a clean, one-line solution.

##### Example
```python
data = {"name": "Alice"}
if "age" in data:
  age = data["age"]
else:
    age = 30  # Hardcoded default value
# --- vs ---
data = {"name": "Alice"}
age = data.get("age", 30)  # Default value with `get()`
```
---

#### Not using `items()` to iterate over dictionaries

* Accessing keys and values separately with indexing is less efficient than the built-in `items()` method.
* `for key, value in my_dict.items():` simplifies iteration and avoids indexing errors.

##### Example
```python
user = {"name": "Alice", "age": 30}
for key in user:
  value = user[key]
  # Process key and value
# --- vs ---
user = {"name": "Alice", "age": 30}
for key, value in user.items():
  # Process key and value
```
---

#### Pushing debugger in production code

* Debuggers slow down performance and reveal sensitive information in production environments.
* Use logging or remote debugging tools for production troubleshooting.

##### Example
```python
def my_function():
    critial_data = get_critical_data()
    process_data(critial_data)
    print(critial_data)  # Debugger statement
# --- vs ---
import logging
def my_function():
    critial_data = get_critical_data()
    process_data(critial_data)
    clean_data = process_data(critial_data)
    location = save_artifact(clean_data)
    logging.info(f"Processed data: {clean_data.id} @ {location}")  # Logging statement
```
---

#### God classes

* Classes containing hundreds of lines and methods become difficult to understand, maintain, and test.
* This leads to poor maintainability, testing challenges, and potential coupling issues.
  
##### Improved Practices
- **Single Responsibility Principle (SRP)**
Break down the functionalities into smaller, focused classes responsible for specific tasks.
- **Composition and inheritance**
Create a hierarchy of classes where smaller classes inherit or compose to achieve desired functionality.
- **Modular design**
Organize code into modules or packages for logical grouping and improved reusability.

#### Magic numbers

* Hardcoded values throughout code make it inflexible and error-prone.
* Use constants or configuration files to make them easier to change and track.

##### Example
```python
# Use with clear constants:
def calculate_discount(price, discount_threshold=10):
  if price > discount_threshold:  # Hardcoded magic number
    return price * 0.8  # Another magic number
  else:
    return price
# --- vs ---
DISCOUNT_THRESHOLD = 10  # Defined constant
DISCOUNT_RATE = 0.8  # Defined constant

def calculate_discount(price):
  if price > DISCOUNT_THRESHOLD:
    return price * DISCOUNT_RATE
  else:
    return price
```
---

### Additional Resources

* [The Little Book of Python Anti-Patterns](https://github.com/quantifiedcode/python-anti-patterns/blob/master/docs/The-Little-Book-Of-Python-Anti-Patterns.pdf)
