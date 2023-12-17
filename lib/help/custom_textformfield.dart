import 'package:academy/help/colors.dart';
import 'package:academy/help/static_variables.dart';
import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool showPassword;
  final Widget? suffixWidget;
  final bool enabled;
  final int maxLines;
  final int? maxLength;
  final double textHeight;
   CustomTextFormField({
    this.controller,
    this.hintText='',
    this.onChanged,
    this.textInputType=TextInputType.text,
    this.validator,
    this.showPassword=false,
    this.suffixWidget,
    this.enabled=true,
    this.maxLines=1,
    this.maxLength,
     this.textHeight=1,
  }) ;

    InputBorder textFieldBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: AcademyColors.maineBlue),
    );


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 16),
      child: Directionality(
        textDirection: StaticVariables().lang(context) == 'ar' ? TextDirection.rtl : TextDirection.ltr,
        child: TextFormField(
          autofocus: false,
          maxLength: maxLength,
          maxLines: maxLines,
          enabled: enabled,
          keyboardType: textInputType,
            controller:controller ,
          obscureText: showPassword,
            textInputAction: TextInputAction.next,
            style:  TextStyle(
              color: AcademyColors.maineBlue,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              height: textHeight,
            ),
            decoration: InputDecoration(
              // hintText: hintText,
              label: Text(hintText),
              labelStyle: TextStyle(color:AcademyColors.maineBlue,fontSize: 14,fontWeight: FontWeight.w500,),
              fillColor: enabled? Colors.transparent:AcademyColors.grey10,
              filled: true,
              suffixIcon: suffixWidget,
              focusedBorder: textFieldBorder,
              enabledBorder: textFieldBorder,
              border: textFieldBorder,
            ),
            onChanged: onChanged,
            validator: validator,

        ),
      ),
    );
  }
}
