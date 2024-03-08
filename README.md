# :writing_hand: Flutter Best Practices

This project aims to demonstrate best practices and architectural patterns for developing Flutter applications.

This project covers:

- A way to Handle Failures in your Flutter Projects.
- A few good practices like abstractions of third party libraries and dependency injection.

# Table of Contents

1. [Features](#features)
2. [Usage](#usage)
3. [Service Locator Abstraction](#service-locator)

# Features <a name="features"></a>

- **User Feature:** Demonstrates the implementation of clean architecture principles (domain, data, presentation) for managing user-related functionality.
- **Network Package:** Provides a comprehensive network layer abstraction with domain-driven design. It separates concerns into domain, data, and infrastructure layers, offering flexibility and ease of testing.
- **Core:** Includes essential definitions and abstractions, such as `Failure` and `Either` classes for handling errors and `ServiceLocator` working as an abstraction of `GetIt`.

# Usage <a name="usage"></a>

1. Clone the repository:

```bash
git clone https://github.com/willcav/flutter_best_practices.git
```

2. Navigate to the project directory:

```bash
cd flutter_best_practices
```

3. Install dependencies

```dart
flutter pub get
```

4. Explore the project structure and adapt it to your application`s needs.

# Core Concepts

## Clean Architecture

The project follows clean architecture principles to separate concerns and maintain a clear separation of layers: domain, data, and presentation.

## Network Abstraction

The `Network` package provides a robust network layer abstraction, facilitating HTTP requests with flexibility and testability. It utilizes domain-driven design and inversion of control principles for effective dependency management.

The current network implementation utilizes `Dio`, however, it can be effortlessly replaced with another library without requiring modifications to the app, as the structure adheres to the defined interfaces.

This architecture allows for seamless integration with different HTTP client implementations while maintaining consistency and flexibility in your application's network layer. The defined interfaces facilitate dependency injection and decoupling, making it easy to adapt to changes in requirements or technology stacks without disrupting the overall architecture.

## Service Locator Abstraction/Wrapper <a name="service-locator"></a>

Abstractions serve as a high-level representation of the functionality provided by third-party
libraries.

By leveraging abstractions and wrappers, we can achieve greater maintainability in our codebases.
When the need arises to switch to a different service locator library or upgrade to a newer version,
**the changes can be confined to the implementation of the abstraction** or wrapper.

In this project, the **GetIt** dependency is encapsulated within the **GetItDriver** implementation,
adhering to the interface we've defined.

# Contributing

I welcome contributions to enhance and expand this repository! Here are some ways you can contribute:

- Implement additional features or architectural patterns.
- Improve documentation and code quality.
- Address existing issues or **propose new ideas**.
