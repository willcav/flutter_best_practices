# :writing_hand: Flutter Clean Architecture - Error Handling

This project covers:

- A way to Handle Exceptions in your Flutter Projects that use Clean Architecture.
- A few good practices like abstractions of third party libraries and dependency injection

# Table of Contents

1. [Service Locator Abstraction](#service-locator)

## Service Locator Abstraction/Wrapper <a name="service-locator"></a>

Abstractions serve as a high-level representation of the functionality provided by third-party
libraries.

By leveraging abstractions and wrappers, we can achieve greater maintainability in our codebases.
When the need arises to switch to a different service locator library or upgrade to a newer version,
**the changes can be confined to the implementation of the abstraction** or wrapper.

In this project, the **GetIt** dependency is encapsulated within the **GetItDriver** implementation,
adhering to the interface we've defined.
