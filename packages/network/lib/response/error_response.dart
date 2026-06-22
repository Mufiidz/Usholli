import 'package:dart_mappable/dart_mappable.dart';

part 'error_response.mapper.dart';

@MappableClass()
class ErrorResponse with ErrorResponseMappable {
  final String message;

  ErrorResponse({this.message = ''});
}
