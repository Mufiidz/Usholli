<div align="center">
    <h1>Usholli - Core</h1>
    <p>Foundational module for shared utilities, themes, dependency injection, and common widgets.</p>
</div>

---

## Overview

The `core` package acts as the shared kernel of the Usholli codebase. It defines core infrastructure that is shared across multiple modules. To reduce boilerplate imports in other packages, `core` re-exports frequently used third-party dependencies (e.g., `bloc`, `go_router`, `injectable`).

## Tech Stack & Key Libraries

- **State Management**: [bloc](https://pub.dev/packages/bloc) & [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) & [injectable](https://pub.dev/packages/injectable)
- **Serialization**: [dart_mappable](https://pub.dev/packages/dart_mappable)
- **Environment Management**: [envied](https://pub.dev/packages/envied)
- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Formatting & Localization**: [intl](https://pub.dev/packages/intl)
- **Typography & Styling**: [google_fonts](https://pub.dev/packages/google_fonts)
- **Logging**: [logger](https://pub.dev/packages/logger)

## Package Structure

- **`base/`**: Generic baseline architectures such as base classes for BLoCs.
- **`error/`**: Generic model representations for custom app exceptions and errors.
- **`theme/`**: Color schemes, typographies, and theme configurations for consistent visual design across screens.
- **`util/`**: Reusable helper methods, formatting functions, extension helpers, and date/time manipulation utilities.
- **`widgets/`**: Common UI components and shared UI structures (e.g., `bloc_effect.dart`).
- **`env.dart`**: Environment variables loader and wrapper utilizing `envied`.
- **`get_it.dart`**: Service locator provider setup.

## Code Generation

This package uses code generation for dependency injection and environment configurations.

To run `build_runner` once:
```bash
dart run melos generate
```
and then choose `core` option.

Or, you can run build_run from specific folder package
```bash
dart run build_runner build --delete-conflicting-outputs
```

To run `build_runner` in watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
