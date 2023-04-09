import 'package:either_dart/either.dart';
import 'package:location/location.dart';

import '../../../infrastructure/errors/location_exception.dart';

abstract class GetUserLocationUsecase {
  Future<Either<LocationException, LocationData>> call();
}
