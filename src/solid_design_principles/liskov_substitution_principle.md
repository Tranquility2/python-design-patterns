# Liskov Substitution Principle

Replacing Parts Without Breaking the Whole

> In essence, the Liskov Substitution Principle promotes building a robust software ecosystem where interchangeable parts work seamlessly together, ensuring smooth operation and reliable functionality.

## How LSP works

1. **Subtypes inherit the supertype's contract.** They inherit the supertype's methods and properties, ensuring compatibility with existing code.
2. **Subtypes preconditions must be weaker or equal.** The subtypes' methods can have weaker preconditions (accepting more input types) than the supertype, but not stricter ones.
3. **Subtypes postconditions must be stronger or equal.** The subtypes' methods can have stronger postconditions (guaranteeing more output guarantees) than the supertype, but not weaker ones.
4. **Subtypes exceptions must be the same or subclasses of the supertype's exceptions.** The subtypes' methods can throw only the same exceptions or subclasses of the exceptions thrown by the supertype.

## Benefits

* **Improved code reuse**
  Subtypes can leverage existing supertype code, reducing duplication and effort.
* **Enhanced flexibility**
  You can easily replace objects with different subtypes without rewriting the program.
* **Increased reliability**
  Substitutability guarantees program correctness even with changing types.
* **Reduced testing effort**
  Tests for the supertype can often apply to conforming subtypes.

## Remember

* Use LSP when you have inheritance hierarchies and want to ensure type safety and program correctness.
* Overuse can lead to unnecessary complexity and overly restrictive subtype definitions.
* Design clear and concise contracts for both supertype and subtypes for efficient substitutability.
