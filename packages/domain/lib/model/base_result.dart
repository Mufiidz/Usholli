import 'package:core/core.dart';

part 'base_result.mapper.dart';

sealed class BaseResult<T> {
  const BaseResult();

  TResult when<TResult extends Object?>({
    required TResult Function(T data) result,
    required TResult Function(String message, Object? exception) error,
  }) => switch (this) {
    DataResult<T>(:final data) => result(data),
    ErrorResult<T>(:final message, :final exception) => error(message, exception),
  };

  bool get isSuccess => this is DataResult<T>;
  bool get isError => this is ErrorResult<T>;

  DataResult<T>? get dataObject => isSuccess ? this as DataResult<T> : null;

  ErrorResult<T>? get errorObject => isError ? this as ErrorResult<T> : null;

  T get onDataResult => (this as DataResult<T>).data;

  String get errorMessage => errorObject?.message ?? 'ERROR RESULT';

  Exception get exception => errorObject?.cause ?? Exception(errorMessage);

  Future<BaseResult<R>> flatMap<R>(Future<BaseResult<R>> Function(T data) transform) async {
    return switch (this) {
      DataResult<T>(:final data) => await transform(data),
      ErrorResult<T>(:final message, :final cause) => ErrorResult<R>(message, cause),
    };
  }
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify)
class DataResult<T> extends BaseResult<T> with DataResultMappable<T> {
  final T data;
  DataResult(this.data);
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.stringify)
class ErrorResult<T> extends BaseResult<T> with ErrorResultMappable<T> {
  final String message;
  final Exception? cause;
  ErrorResult(this.message, [this.cause]);
}

extension BaseResultFutureExtension<T> on Future<BaseResult<T>> {
  Future<BaseResult<R>> flatMap<R>(Future<BaseResult<R>> Function(T data) transform) async {
    final result = await this;
    return result.flatMap(transform);
  }
}
