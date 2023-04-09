import 'package:either_dart/either.dart';
import 'package:location/location.dart';

import '../../../infrastructure/errors/location_exception.dart';
import 'get_user_location_usecase_.dart';

class GetUserLocationUsecaseImpl implements GetUserLocationUsecase {
  @override
  Future<Either<LocationException, LocationData>> call() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Left(
            LocationException('O serviço de localização não está disponível'));
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return Left(LocationException('Você precisa permitir a localização'));
      }
    }

    locationData = await location.getLocation();

    return Right(locationData);
  }
}
