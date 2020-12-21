import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked/stacked.dart';
import 'doctorsListTabScreens/doctorsListScreen/doctorListScreenView.dart';
import 'appointmentHomeScreen/appointmentHomeScreenView.dart';

class HomeScreenViewModel extends BaseViewModel {
  final widgetOptions = [
    AppointmentHomeScreenView(),
    DoctorsListScreenView(),
    Text('Notification'),
    Text('Profile'),
  ];

  int _index = 0;

  int get getIndex => _index;

  List<BottomNavigationBarItem> items = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: Icon(MaterialIcons.assignment), label: 'Appointments'),
    BottomNavigationBarItem(icon: Icon(FontAwesome5.user), label: 'Doctors'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.bell), label: 'Notifications'),
    BottomNavigationBarItem(
        icon: Icon(FontAwesome.user_circle), label: 'Profile'),
  ];

  void setCurrentIndex(int selIndex) {
    _index = selIndex;
    notifyListeners();
  }
}
