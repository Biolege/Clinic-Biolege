import 'dart:typed_data';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/filePicker_service.dart';
import '../../../../model/clinic.dart';
import '../../../../services/services/dataFromApiService.dart';

class ClinicProfileScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();
  final StorageService _storageService = locator<StorageService>();
  // final NavigationService _navigatorService = locator<NavigationService>();

  // __________________________________________________________________________
  // Variables
  Clinic _clinic;
  Clinic get getClinic => _clinic;

  String _clinicLocationType;
  String get getClinicLocationType => _clinicLocationType;

  Uint8List _clinicLogoToDisplay;
  Uint8List get getClinicLogoToShow => _clinicLogoToDisplay;

  void showMap() async {
    String lat = _clinic.location.latitude.toString();
    String lang = _clinic.location.longitude.toString();
    String url = "http://maps.google.com/maps?&z=10&q=loc:$lat+$lang";

    var uri = Uri.parse("google.maps:q=$lat,$lang");
    print(url);
    if (await canLaunch(url))
      await launch(url);
    else
      throw 'Could not launch ${uri.toString()}';
  }

  // __________________________________________________________________________
  @override
  Future futureToRun() async {
    try {
      _clinic = _dataFromApiService.getClinic;

      _clinicLogoToDisplay = _filePickHelperService
          .dataFromBase64String(_dataFromApiService.getClinic.logo);
      _clinicLocationType = _storageService.getClinicLocationType == 0
          ? "Attach to pharmacy"
          : _storageService.getClinicLocationType == null
              ? "Separate clinic"
              : "Separate clinic";
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
