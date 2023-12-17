import 'package:academy/help/colors.dart';
import 'package:academy/help/loading_widget.dart';
import 'package:academy/help/localization.dart';
import 'package:academy/help/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Messages {
  Loading(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    AlertDialog alert = AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      titleTextStyle: TextStyle(
          fontSize: 14, color: AcademyColors.maineBlue, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: SizedBox(
          child: LoadingWidget(isFromAlertDialog: true)),
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  MessageAlert({required BuildContext context,
    required String message,
    required String roundedButtonTitle,
    required void Function()? onPressed,
required IconData icon,
  } ) {
    Widget nextButton = RoundedButton(
      width:  MediaQuery.of(context).size.width / 2.7,
        text: AppLocalizations.of(context)!.translate(roundedButtonTitle)!,
        onPressed: onPressed,
        colorBackGround:AcademyColors.maineBlue,
        );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      titleTextStyle: TextStyle(
          fontSize: 20, color: AcademyColors.maineBlue, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AcademyColors.maineBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  height: 112,
                  width: 112,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AcademyColors.maineBlue,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    height: 112 - 17,
                    width: 112 - 17),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(icon ,size: 60,color: Colors.white,),
                    height: 112 - 17,
                    width: 112 - 17),

              ],
            ),
          )
        ],
      ),
      content: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, right: 10, left: 10, bottom: 0),
          child: Text(
            AppLocalizations.of(context)!.translate(message).toString(),
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
          child: Center(child: nextButton),
        ),
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }

  MessageAlertWithoutIcon({required BuildContext context,
    required String message,
    required String title,
    required String roundedButtonTitle,
    required Color roundedButtonColor,
    required void Function()? onPressed,
  } ) {
    Widget nextButton = RoundedButton(
      width:  MediaQuery.of(context).size.width / 2.7,
        text: AppLocalizations.of(context)!.translate(roundedButtonTitle)!,
        onPressed: onPressed,
      colorBackGround: roundedButtonColor,
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      titleTextStyle: TextStyle(
          fontSize: 20, color: AcademyColors.maineBlue, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text( AppLocalizations.of(context)!.translate(title).toString(),
            style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600,color: Colors.black87),)
        ],
      ),
      content: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, right: 10, left: 10, bottom: 0),
          child: Text(
            AppLocalizations.of(context)!.translate(message).toString(),
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 30),
          child: Center(child: nextButton),
        ),
      ],
    );

    // show the dialog
    showDialog(
      // barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => true, child: alert);
      },
    );
  }

  MessageAlertWIthTowButton({required BuildContext context,
    required String message,
    required String roundedButtonTitle,
    required void Function()? onPressed,
    required IconData icon,
  } ) {
    Widget nextButton = RoundedButton(
      width:  100,
      text: AppLocalizations.of(context)!.translate(roundedButtonTitle)!,
      onPressed: onPressed,
      colorBackGround:AcademyColors.maineBlue,
    );
    Widget backButton = RoundedButton(
      width: 100,
      text: AppLocalizations.of(context)!.translate('back')!,
      onPressed: (){Navigator.pop(context);},
      colorBackGround:AcademyColors.maineBlue,

    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      titleTextStyle: TextStyle(
          fontSize: 20, color: AcademyColors.maineBlue, fontFamily: 'Cairo'),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AcademyColors.maineBlue.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  height: 112,
                  width: 112,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: AcademyColors.maineBlue,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    height: 112 - 17,
                    width: 112 - 17),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(icon ,size: 60,color: Colors.white,),
                    height: 112 - 17,
                    width: 112 - 17),

              ],
            ),
          )
        ],
      ),
      content: Container(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, right: 10, left: 10, bottom: 0),
          child: Text(
            AppLocalizations.of(context)!.translate(message).toString(),
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Padding(
              padding: const EdgeInsets.fromLTRB(7, 15, 7, 30),
              child: Center(child: backButton),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 15, 7, 30),
              child: Center(child: nextButton),
            ),
          ],
        ),


      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(onWillPop: () async => false, child: alert);
      },
    );
  }
}