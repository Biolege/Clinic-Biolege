import 'package:clinicapp/model/clinic.dart';

import '../../services/services/local_storage.dart';
import '../../app/locator.dart';
import '../../services/services/api_service.dart';
import '../../model/doctor.dart';

class DataFromApi {
  // ___________________________________________________________________________
  // Locating the Dependencies
  final APIServices _apiServices = locator<APIServices>();
  final StorageService _storageService = locator<StorageService>();
  // ___________________________________________________________________________
  // ___________________________________________________________________________
  // Data to be used in the Doctors bottom navigationbar
  static List<Doctor> _doctorsListForClinic;
  List<Doctor> get getDoctorsListForClinic => _doctorsListForClinic;
  // ------------------------------------------------------------------
  // Mapping of Doctors(ID) with their clinic details
  static Map<String, ClinicElement> _clinicDetailsOfDoctor;
  Map<String, ClinicElement> get getClinicDetailsOfDoctor =>
      _clinicDetailsOfDoctor;
  // ------------------------------------------------------------------
  // Data to be used during searching of doctors/ adding a doctors
  // to clinic profile
  static List<Doctor> _doctorsList;
  List<Doctor> get getDoctorsList => _doctorsList;
  // ------------------------------------------------------------------
  // Data to display in the Doctors Details when tapped a tile in Doctors list
  // or in the Appointments
  static Doctor _doctor;
  Doctor get getSelectedDoctor => _doctor;
  // ___________________________________________________________________________
  // Helper Function
  Future setDoctorsList() async {
    _doctorsList = [];
    _doctorsList = await _apiServices.getAllDoctors();
    print("All doctors saved : " + _doctorsList.toString());
  }

  Future setDoctorsListForClinic() async {
    String clinicId = _storageService.getClinicId;
    // Filtering the doctors which work for ClinicId
    _doctorsListForClinic = [];
    _clinicDetailsOfDoctor = {};
    _doctorsList.forEach(
        (doctor) => doctor.clinics.forEach((clinic) => clinic.id == clinicId
            ? {
                _doctorsListForClinic.add(doctor),
                _clinicDetailsOfDoctor.putIfAbsent(doctor.id, () => clinic)
              }
            : null));
    print("ClinicDetails for $clinicId is saved : " +
        _clinicDetailsOfDoctor.toString());
    print(
        "Doctors for $clinicId is saved : " + _doctorsListForClinic.toString());
  }

  void setDoctorForAppointmentsTab() {}
  // ___________________________________________________________________________
}
