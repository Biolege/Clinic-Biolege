import 'dart:typed_data';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../app/locator.dart';
import '../../../../services/services/local_storage.dart';
import '../../../../services/services/filePicker_service.dart';
import '../../../../model/clinic.dart';
import '../../../../services/services/dataFromApi_service.dart';

class ClinicProfileScreenViewModel extends FutureViewModel {
  // __________________________________________________________________________
  // Locating the Dependencies
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final DataFromApi _dataFromApiService = locator<DataFromApi>();
  final StorageService _storageService = locator<StorageService>();
  // final NavigationService _navigatorService = locator<NavigationService>();
  final FilePickHelperService _filePickHelperService =
      locator<FilePickHelperService>();

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
    // String url =
    //     "https://www.google.com/maps/@?api=1&map_action=map&center=$lat,$lang";

    var uri = Uri.parse("google.navigation:q=$lat,$lang");
    if (await canLaunch(uri.toString()))
      await launch(uri.toString());
    else
      throw 'Could not launch ${uri.toString()}';
  }

  // __________________________________________________________________________
  @override
  Future futureToRun() async {
    try {
      _clinic = _dataFromApiService.getClinic;

      _clinicLogoToDisplay = _filePickHelperService
          .dataFromBase64String(_storageService.getClinicLogo);
      _clinicLocationType = _storageService.getClinicLocationType == 0
          ? "Attach to pharmacy"
          : "Separate clinic";
    } catch (e) {
      _snackBarService.showSnackbar(message: e.toString());
    }
    throw UnimplementedError();
  }
}
