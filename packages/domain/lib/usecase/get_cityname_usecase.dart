import 'package:core/core.dart';
import 'package:geolocator/geolocator.dart';

import '../repository/location_repository.dart';
import 'base_usecase.dart';

@lazySingleton
class GetCityNameUseCase extends BaseUseCase<String, NoParam> {
  final LocationRepository locationRepository;

  GetCityNameUseCase(this.locationRepository);

  @override
  Future<String> execute(NoParam param) async {
    final Position position = await locationRepository.getLocationPosition();
    return locationRepository.getCityName(position);
  }

  // @override
  // Future<BaseResult<String>> execute(NoParam param) async {
  //   try {
  //     final Position position = await locationRepository.getLocationPosition();

  //     final String city = await locationRepository.getCityName(position);
  //     return DataResult(city);
  //   } on BaseException catch (e) {
  //     logger.e('Error GetCityName: ${e.message} $e');
  //     return ErrorResult(e.message, e);
  //   } catch (e) {
  //     return ErrorResult('Error GetCityName');
  //   }
  // }
}
