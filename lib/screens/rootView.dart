import 'package:clinicapp/screens/rootViewModel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Root extends StatelessWidget {
  static const routeName = "/root";
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, child, model) {
        return Scaffold();
      },
      onModelReady: (model) => model.handleStartupLogic(),
      viewModelBuilder: () => RootViewModel(),
    );
  }
}
