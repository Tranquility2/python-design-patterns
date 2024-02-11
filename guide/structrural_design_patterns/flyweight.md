# **Flyweight Design Pattern**

Sharing for Lightweight Efficiency

> In essence, the flyweight Design Pattern promotes memory efficiency and performance optimization by sharing identical components, making it a valuable tool for building robust and resource-conscious applications.

---

## Review

1. Flyweight factory: Creates and manages a pool of flyweight objects with different intrinsic states (e.g., different letters).
2. Client interaction: Requests specific flyweight objects based on their intrinsic state.
3. Extrinsic state: The client adds its own extrinsic state (e.g., position) to the flyweight object for individual use.

---

## Benefits

* **Reduced memory footprint**
  Sharing identical components minimizes object creation and memory consumption.
* **Improved performance**
  Faster object creation and reduced memory pressure lead to smoother performance.
* **Simplified code**
  Less code duplication for managing similar objects.
* **Efficient resource management**
  Sharing resources like fonts, icons, and database connections.

---

## Example

```python
class Font:
    def __init__(self, font_name, font_size):
        self.font_name = font_name
        self.font_size = font_size

    def get_font_data(self):
        # Simulate loading font data from a file or resource
        print(f"Loading font {self.font_name} with size {self.font_size}...")
        return f"Font data for {self.font_name} {self.font_size}"

class FontFactory:
    _fonts = {}  # Flyweight pool

    def get_font(self, font_name, font_size):
        key = (font_name, font_size)
        if key not in self._fonts:
            self._fonts[key] = Font(font_name, font_size)
        return self._fonts[key]

# Client code
font_factory = FontFactory()

font1 = font_factory.get_font("Arial", 12)
font2 = font_factory.get_font("Arial", 12)  # Same font object will be returned
font3 = font_factory.get_font("Times New Roman", 14)

print(font1.get_font_data())  # Loads font data only once
print(font2.get_font_data())  # Uses cached font data
print(font3.get_font_data())  # Loads different font data
```

---

## Remember

* Use flyweight when dealing with large numbers of similar objects with shared intrinsic state.
* Overuse can lead to complex management and reduced code readability.
* Choose appropriate intrinsic and extrinsic state separation for efficient sharing.
