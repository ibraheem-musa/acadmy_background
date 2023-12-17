import 'package:academy/help/colors.dart';
import 'package:academy/help/custom_design.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final double height;
  final double width;
  final Color? colorBackGround;
  const RoundedButton(
      {required this.text,
      this.onPressed,
      this.height = 56,
       required this.width,
      this.colorBackGround,
      this.isLoading = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            constraints: BoxConstraints(
                minHeight: height,
                minWidth:width),
            decoration: CustomDesign().costumeBoxDecoration(borderColor: AcademyColors.maineBlue,contenarColor: colorBackGround!),
            child:Text(
                    text,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
          ),
        ));
  }
}
