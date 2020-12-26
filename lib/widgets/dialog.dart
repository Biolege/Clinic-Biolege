import 'package:clinicapp/app/locator.dart';
import 'package:clinicapp/widgets/reusables.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

enum DialogType { basic, form, confirm }

void setupDialogUi() {
  var _dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (context, sheetRequest, completer) =>
        _BasicDialog(request: sheetRequest, completer: completer),
    DialogType.form: (context, sheetRequest, completer) =>
        _FormDialog(request: sheetRequest, completer: completer),
    DialogType.confirm: (context, sheetRequest, completer) =>
        _BasicConfirmDialog(request: sheetRequest, completer: completer),
  };
  _dialogService.registerCustomDialogBuilders(builders);
}

class _BasicDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Error Code",
            style: TextStyle(fontSize: 11),
          ),
          Text(
            request.title,
            style: TextStyle(fontSize: 14),
          ),
          Divider(),
          Text(request.description),
        ],
      ),
    )));
  }
}

class _BasicConfirmDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _BasicConfirmDialog({Key key, this.request, this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(request.description),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
                  Text(
                    request.mainButtonTitle,
                    style: TextStyle(fontSize: 12),
                  ),
                  () => Navigator.of(context).pop()),
            ],
          )
        ],
      ),
    )));
  }
}

class _FormDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  const _FormDialog({Key key, this.request, this.completer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(child: Text("Dude"));
  }
}
