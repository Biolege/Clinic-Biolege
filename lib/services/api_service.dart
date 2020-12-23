import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;
import '../app/locator.dart';
import '../model/clinicEmployee.dart';
import '../services/local_storage.dart';

class APIServices {
  // __________________________________________________________________________
  // API Variables for Clinic
  String url = "http://localhost:8080/";
  String urlClinicEmployee = "clinicemployee";
  String urlClinic = "clinic";
  // ---------------------------------------------------------------------------
  // Create a new Clinic Employee and stores the response in the local storage
  Future<ClinicEmployee> createClinicEmployee(dynamic userData) async {
    // _________________________________________________________________________
    // Locating the Dependencies
    final NavigationService _navigatorService = locator<NavigationService>();
    final StorageService _storageService = locator<StorageService>();
    // _________________________________________________________________________
    final response = await http.post('$url/$urlClinicEmployee/create',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: userData);

    return clinicEmployeeFromJson(response.body);
  }
}