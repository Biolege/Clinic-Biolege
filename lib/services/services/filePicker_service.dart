import 'package:clinicapp/app/locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

class FilePickHelperService {
  Future<PickedFile> pickImage(ImageSource imageSource) async {
    // _________________________________________________________________________
    // Locating the Dependencies

    final SnackbarService _snackBarService = locator<SnackbarService>();
    // _________________________________________________________________________
    // Start file picking process
    final picker = ImagePicker();

    final pickedFile =
        await picker.getImage(imageQuality: 70, source: imageSource);
    // If picked return the file else show a error
    if (pickedFile != null) return pickedFile;
    _snackBarService.showSnackbar(message: "No file was selected");
    return null;
  }
}
