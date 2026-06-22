<div align="center">
    <h1>Usholli - Storage</h1>
    <p>Local database persistence and key-value preference storage layer.</p>
</div>

---

## Overview

The `storage` package handles the offline persistence layer for Usholli. It implements a reactive SQLite database using `drift` for caching offline prayer times, search results, and configurations. It also wraps `shared_preferences` to persist key-value pairs representing app-level preferences (such as selected city, notification preferences, etc.).

## Tech Stack & Key Libraries

- **ORM / Local Database**: [drift](https://pub.dev/packages/drift) (SQLite wrapper)
- **Database Engine Loader**: [drift_flutter](https://pub.dev/packages/drift_flutter)
- **Key-Value Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Directory Path Helper**: [path_provider](https://pub.dev/packages/path_provider)
- **Internal Dependencies**: Depends on the `core` module.

## Package Structure

- **`database/`**: Configures the SQLite instance:
  - `app_database.dart`: Declares tables, schema versions, migration methods, and initializes the connection.
  - **`daos/`**: Data Access Objects defining specific queries to isolate read/write transactions (e.g., saving daily prayer times).
- **`shared_prefs/`**: Type-safe shared preferences wrappers providing quick get/set operations for settings.

## Code Generation

This package uses code generation for table queries and database bindings via `drift_dev`.

To run `build_runner` once:
```bash
dart run melos generate
```
and then choose `storage` option.

Or, you can run build_run from specific folder package
```bash
dart run build_runner build --delete-conflicting-outputs
```

To run `build_runner` in watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
