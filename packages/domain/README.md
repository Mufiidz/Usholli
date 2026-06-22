<div align="center">
    <h1>Usholli - Domain</h1>
    <p>Pure business logic, core entities, and repository interfaces (Clean Architecture Domain Layer).</p>
</div>

---

## Overview

The `domain` package encapsulates the pure business rules and entities of the Usholli application. It defines the core data models, the repositories responsible for retrieving/persisting data, and single-purpose Use Cases that orchestrate specific actions. It isolates application rules from database implementations, network structures, or user interface configurations.

## Tech Stack & Key Libraries

- **Location Services**: [geolocator](https://pub.dev/packages/geolocator) (user coordinates query) & [geocoding](https://pub.dev/packages/geocoding) (city reverse search)
- **Serialization**: [dart_mappable](https://pub.dev/packages/dart_mappable)
- **Collections Helper**: [collection](https://pub.dev/packages/collection)
- **Internal Dependencies**: Depends on `core`, `network`, and `storage` modules.

## Package Structure

- **`model/`**: Pure data entities representing domain-specific models (e.g., prayer times, coordinates, calendars).
- **`repository/`**: Repository contracts and concrete classes coordinating database queries and network fetches:
  - `CalendarRepository`: Manages calendar and date conversions.
  - `LocationRepository`: Manages GPS coordinates and city details.
  - `PrayerRepository`: Manages prayer schedules, sync, and alerts.
- **`usecase/`**: Single-responsibility commands executing specific domain actions:
  - `GetPrayerTimeTodayUseCase`: Fetches today's prayer times for a city.
  - `GetCityNameUseCase`: Resolves city names from coordinates.
  - `NextPrayerUseCase`: Identifies the next prayer name and countdown timing.
  - `CalendarTodayUseCase`: Retrieves today's hijri/gregorian calendar info.

## Code Generation

This package uses code generation for models serialization and dependency registration.

To run `build_runner` once:
```bash
dart run melos generate
```
and then choose `domain` option.

Or, you can run build_run from specific folder package
```bash
dart run build_runner build --delete-conflicting-outputs
```

To run `build_runner` in watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
