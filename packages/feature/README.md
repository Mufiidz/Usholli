<div align="center">
    <h1>Usholli - Feature</h1>
    <p>User Interface components, screens, blocs, and type-safe routing.</p>
</div>

---

## Overview

The `feature` package is the presentation layer of Usholli. It contains all UI pages, custom components, feature-specific BLoCs, and type-safe routes. It consumes capabilities from the `domain` package (Usecases) and applies common widgets/themes exported by the `core` package to build the UI screens.

## Tech Stack & Key Libraries

- **Routing**: [go_router](https://pub.dev/packages/go_router)
- **Type-Safe Route Generation**: [go_router_builder](https://pub.dev/packages/go_router_builder)
- **Internal Dependencies**: Depends on the `core` and `domain` modules.

## Package Structure

- **`home/`**: Contains the dashboard home page and specific UI blocks:
  - `home_screen.dart`: Visual representation of today's prayer schedules and the next prayer countdown.
  - Sub-widgets, custom icons, and BLoC implementations specific to home operations.
- **`feature_router.dart`**: Declares declarative `TypedGoRoute` paths (e.g. `HomeRoute`) to compile type-safe route trees.

## Code Generation

This package uses code generation for compile-time safe navigation routes using `go_router_builder`.

To run `build_runner` once:
```bash
dart run melos generate
```
and then choose `feature` option.

Or, you can run build_run from specific folder package
```bash
dart run build_runner build --delete-conflicting-outputs
```

To run `build_runner` in watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
