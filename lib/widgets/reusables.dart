import 'dart:ui';

import '../theme/theme.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../app/size_configuration.dart';
import 'package:flutter/material.dart';

String logoPath = "asset/images/logo.png";

InputDecoration buildInputDecoration(String text, Icon icon) {
  return InputDecoration(
    labelText: text,
    counterText: "",
    suffixIcon: customSuffixIcon(icon),
  );
}

InputDecoration buildDateDecoration(Icon icon) {
  return InputDecoration(
    counterText: "",
    suffixIcon: customSuffixIcon(icon),
  );
}

Padding customSuffixIcon(Icon icon) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(20),
        getProportionateScreenWidth(20), getProportionateScreenWidth(20)),
    child: icon,
  );
}

RaisedButton buildOutlineButton(text, function) {
  return RaisedButton(
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(40.0),
    ),
    onPressed: function,
    child: Padding(
      padding: EdgeInsets.all(getProportionateScreenHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Icon(
            MaterialIcons.arrow_forward,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}

OutlineButton buildBasicOutlineButton(Widget child, void Function() function) {
  return OutlineButton(
      highlightedBorderColor: offWhite1,
      hoverColor: offWhite2,
      splashColor: offWhite1,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(40.0),
      ),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(15)),
      onPressed: () => function(),
      child: child);
}

OutlineButton buildBasicOutlineButtonWithLessPaddingAndRounderCorners(
    Widget child, void Function() function) {
  return OutlineButton(
      highlightedBorderColor: offWhite1,
      hoverColor: offWhite2,
      splashColor: offWhite1,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(5)),
      onPressed: () => function(),
      child: child);
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
                size: 47,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null);
}

AppBar buildAppBarWithLogo(BuildContext context) {
  return AppBar(
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
                size: 47,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            logoPath,
            width: SizeConfig.screenWidth / 4.5,
          ),
        )
      ]);
}

AppBar buildAppBarWithLogoAndText(
    BuildContext context, String text, Widget widget) {
  return AppBar(
      automaticallyImplyLeading: false,
      leading: Navigator.canPop(context)
          ? IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_rounded,
                color: Colors.black,
                size: 47,
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      centerTitle: true,
      title: Padding(padding: const EdgeInsets.only(top: 8.0), child: widget),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            logoPath,
            width: SizeConfig.screenWidth / 4.5,
          ),
        )
      ]);
}

BoxDecoration getUpperRoundedBorder(Color color) {
  return BoxDecoration(
      color: color,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          offset: Offset(0, -1),
        ),
      ],
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ));
}
