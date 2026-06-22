import 'package:core/core.dart';

import '../model/base_result.dart';

abstract class BaseUseCase<T, Param> {

  /// This will execute the usecase and return a [BaseResult]
  Future<BaseResult<T>> safeExecute(Param param) async {
    try {
      final T result = await execute(param);
      return DataResult(result);
    } on MapperException catch (e) {
      AppLogger.e(sender: this, reason: e, message: e.message);
      return ErrorResult(e.message, e);
    } on BaseException catch (e) {
      AppLogger.e(sender: this, reason: e, message: e.message);
      return ErrorResult(e.message, e);
    } catch (e) {
      AppLogger.e(sender: this, reason: e);
      return ErrorResult(e.toString());
    }
  }

  Future<T> execute(Param param);
}

class NoParam {
  const NoParam();
}
