# Interface Segregation Principle

Designing for Focused Functionalities

> In essence, the Interface Segregation Principle promotes designing focused interfaces that cater to specific needs, resulting in a more user-friendly, flexible, and maintainable system.

## How ISP works

1. Break down a large interface into smaller, cohesive interfaces. Each interface should group related functionalities focusing on a specific task.
2. Clients depend on the specific interfaces they need. They use only the functionalities relevant to their current task, ignoring others within the broader interface.
3. Implementation classes provide specific functionalities. Concrete classes implement the specific interfaces they offer, avoiding implementing functionalities they don't support.

## Benefits

* **Improved usability**
  Smaller, focused interfaces are easier to understand and use for specific tasks.
* **Reduced coupling**
  Clients depend on only the functionalities they need, leading to looser coupling and improved maintainability.
* **Increased flexibility**
  New functionalities can be added by creating new interfaces without modifying existing ones.
* **Promotes code reuse**
  Smaller interfaces encourage code reuse for common functionalities across different contexts.

## Remember

* Use ISP when a large interface has diverse functionalities with different client needs.
* Overuse can lead to a proliferation of small interfaces, creating unnecessary complexity.
* Choose clear and descriptive names for interfaces and their methods.
