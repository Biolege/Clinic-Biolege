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
  static List<DoctorFromList> _doctorsListForClinic;
  List<DoctorFromList> get getDoctorsListForClinic => _doctorsListForClinic;
  // Data to be used during searching of doctors/ adding a doctors
  // to clinic profile
  static List<DoctorFromList> _doctorsList;
  List<DoctorFromList> get getDoctorsList => _doctorsList;
  // Data to display in the Doctors Details when tapped a tile in Doctors list
  // or in the Appointments
  static DoctorFromList _doctor;
  DoctorFromList get getSelectedDoctor => _doctor;
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
    _doctorsList.forEach((doctor) => doctor.clinics.forEach((clinic) =>
        clinic.id == clinicId ? _doctorsListForClinic.add(doctor) : null));

    print(
        "Doctors for $clinicId is saved : " + _doctorsListForClinic.toString());
  }

  void setDoctorForAppointmentsTab() {}
  // ___________________________________________________________________________
}
