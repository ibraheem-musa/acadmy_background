import 'package:academy/help/colors.dart';
import 'package:academy/help/localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;


class StaticVariables {
  static final BorderRadius borderRadius = BorderRadius.circular(8);
  static final InputBorder textFieldBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: BorderSide(color: AcademyColors.grey60),
  );
  double height (BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  double width (BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  String lang (BuildContext context){
    return Localizations.localeOf(context).languageCode;
  }
  String translated (BuildContext context,String title){
    return AppLocalizations.of(context)!.translate(title).toString();
  }

  static final intl.DateFormat unifiedDateFormat =
  intl.DateFormat("yyyy-MM-dd");

  String formattedDate (date) {
   return intl.DateFormat('yyyy-MM-dd').format(date.toLocal());
  }

  static final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');

}