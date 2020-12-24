import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../app/locator.dart';
import '../../../../app/router.gr.dart';

class AddClinicOwnerDetailsViewModel extends BaseViewModel {
  final NavigationService _navigatorService = locator<NavigationService>();

  int _idProofType = 0;
  final clinicOwnerDetailsFormKey = GlobalKey<FormState>();
  TextEditingController clinicOwnerName = TextEditingController();
  TextEditingController clinicPhoneNumber = TextEditingController();

  void setIdProofType(int type) {
    _idProofType = type;
    print(_idProofType);
  }

  void navigateToClinicOwnerDescriptionScreen() {
    _navigatorService.navigateTo(
      Routes.clinicServiceSelectionView,
    );
  }
}
