<div align="center">
    <h1>Usholli - Network</h1>
    <p>Remote API clients and HTTP network configurations wrapping the Muslim API.</p>
</div>

---

## Overview

The `network` package manages external HTTP communications. It acts as the remote data source layer for Usholli, calling endpoints from the [Muslim API](https://api.myquran.com/) to retrieve cities list, daily prayer times, monthly schedules, and Islamic calendar conversions.

## Tech Stack & Key Libraries

- **HTTP Client**: [dio](https://pub.dev/packages/dio)
- **REST Client Generator**: [retrofit](https://pub.dev/packages/retrofit)
- **Logging Interceptor**: [pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger) (outputs detailed API requests/responses in debug mode)
- **Serialization**: [dart_mappable](https://pub.dev/packages/dart_mappable)
- **Internal Dependencies**: Depends on the `core` module.

## Package Structure

- **`data/`**: Retrofit client interfaces defining HTTP routes and request parameters:
  - `PrayerApiClient`: Interfaces for query search, prayer schedules by date, and city metadata.
  - `CalendarApiClient`: Interfaces for hijri and gregorian calendar information.
- **`response/`**: Raw JSON-to-Dart mapping responses generated for API payloads.
- **`utils/`**: Helper methods and extensions for asynchronous task handling (e.g., `future_ext.dart`).

## Code Generation

This package uses code generation for generating type-safe Retrofit clients (`retrofit_generator`) and JSON mappings (`dart_mappable_builder`).

To run `build_runner` once:
```bash
dart run melos generate
```
and then choose `network` option.

Or, you can run build_run from specific folder package
```bash
dart run build_runner build --delete-conflicting-outputs
```

To run `build_runner` in watch mode:
```bash
dart run build_runner watch --delete-conflicting-outputs
```
