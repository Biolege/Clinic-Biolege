import 'package:clinicapp/model/clinic.dart';
import 'package:clinicapp/model/clinicEmployee.dart';
import 'package:clinicapp/model/diagnosticCustomer.dart';

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
  // Data to be used globally for current clinic
  static Clinic _clinic;
  Clinic get getClinic => _clinic;
  void setClinic(Clinic x) => _clinic = x;
  // ___________________________________________________________________________
  // Data to be used globally for all clinics
  static List<Clinic> _clinicsList;
  List<Clinic> get getAllClinics => _clinicsList;
  void setclinicList(List<Clinic> x) => _clinicsList = x;
  // ___________________________________________________________________________
  // Data to be used globally for current employee
  static ClinicEmployee _employee;
  ClinicEmployee get getClinicEmployee => _employee;
  void setClinicEmployee(ClinicEmployee x) => _employee = x;
  // ___________________________________________________________________________
  // Data to be used in the doctors tab in bottom navigation bar for doctor's
  // customer
  static List<DiagnosticCustomer> _diagnosticCustomersList;
  List<DiagnosticCustomer> get getDiagnosticCustomerList =>
      _diagnosticCustomersList;
  void setDiagnosticCustomerList(List<DiagnosticCustomer> x) =>
      _diagnosticCustomersList = x;
  void setDiagnosticCustomer(DiagnosticCustomer x) =>
      _diagnosticCustomersList.add(x);
  // ___________________________________________________________________________
  // Data to be used to show clinic employees
  static List<ClinicEmployee> _clinicEmployeeList;
  List<ClinicEmployee> get getClinicEmployeeList => _clinicEmployeeList;
  void setClinicEmployeeList(List<ClinicEmployee> x) => _clinicEmployeeList = x;
  // ___________________________________________________________________________
  // Data to be used in the doctors tab in bottom navigation bar
  static List<Doctor> _doctorsListForClinic;
  List<Doctor> get getDoctorsListForClinic => _doctorsListForClinic;
  // ------------------------------------------------------------------
  // Mapping of Doctors(ID) with their details
  static Map<String, Doctor> _doctorsListMapped;
  Map<String, Doctor> get getDoctorsListMapped => _doctorsListMapped;
  Future setDoctorsListMapped(Map<String, Doctor> x) async =>
      _doctorsListMapped = x;
  // Mapping of Doctors(ID) with their clinic details
  static Map<String, ClinicElement> _clinicDetailsOfDoctor;
  Map<String, ClinicElement> get getClinicDetailsOfDoctor =>
      _clinicDetailsOfDoctor;

  // ------------------------------------------------------------------
  // Mapping of patients(ID) with their details for faster access
  static Map<String, DiagnosticCustomer> _diagnosticCustomerOfDoctorsMapped;
  Map<String, DiagnosticCustomer> get getDiagnosticCustomersMappedList =>
      _diagnosticCustomerOfDoctorsMapped;
  Future setDiagnosticCustomersMappedList(
          Map<String, DiagnosticCustomer> x) async =>
      _diagnosticCustomerOfDoctorsMapped = x;
  // ------------------------------------------------------------------
  // Data to be used during searching of doctors / adding a doctors
  // to clinic profile  (Complete List of Doctors)
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
    print("All doctors saved");
  }

  Future setClinicsList() async {
    _clinicsList = [];
    _clinicsList = await _apiServices.getAllClinics();
    print("All clinics saved");
  }

  Future setDiagnosticCustomersList() async {
    _diagnosticCustomersList = [];
    _diagnosticCustomersList = await _apiServices.getAllDiagnosticCustomers();
    print("All diagnostic customers saved");
  }

  Future setClinicDetails() async {
    _clinic = Clinic();
    await _apiServices.getClinicFromApiAndSetGlobally();
    print("Clinic saved");
  }

  Future setEmployeeDetails() async {
    _employee = ClinicEmployee();
    await _apiServices.getClinicEmployeeFromApiAndSetGlobally();
    print("Clinic Employee saved");
  }

  Future setDoctorsListForClinic() async {
    String clinicId = _storageService.getClinicId;
    // Filtering the doctors which work for Clinic Id
    _doctorsListForClinic = [];
    _clinicDetailsOfDoctor = {};

    _doctorsList.forEach((doctor) =>
        doctor.clinics.forEach((clinic) => clinic.clinic.id == clinicId
            ? {
                _doctorsListForClinic.add(doctor),
                _clinicDetailsOfDoctor.putIfAbsent(doctor.id, () => clinic)
              }
            : null));

    print("Clinic details for $clinicId is saved");

    print("Doctors for $clinicId is saved ");
  }

  // ___________________________________________________________________________
}
