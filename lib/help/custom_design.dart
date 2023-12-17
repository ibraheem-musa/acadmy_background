import 'package:academy/help/colors.dart';
import 'package:academy/help/localization.dart';
import 'package:academy/help/static_variables.dart';
import 'package:flutter/material.dart';




class CustomDesign {
  BoxDecoration costumeBoxDecoration({Color contenarColor=Colors.white,Color borderColor=Colors.white,double borderWidth=0,double circular=16}){

    return  BoxDecoration(
      borderRadius: BorderRadius.circular(circular),
      color: contenarColor ,
      border: Border.all(
        color:  borderColor,
        style: BorderStyle.solid,
        width: borderWidth,
      ),
    );
  }

  BoxDecoration costumeBoxDecorationWithOutBorder({Color contenarColor=Colors.white,double borderRadios=0, }){
    return  BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadios),
      color: contenarColor ,

    );
  }

  Widget titleUpperTextFormField(String title ,BuildContext context,{bool haveStar=true,bool haveExlaMark=false,int extraTitle=0,}){
    return  Padding(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Visibility(
          visible: haveExlaMark,
          child:  Text(' ⓘ ',style: TextStyle(fontSize: 20,color: AcademyColors.grey30),),
        ),
          Visibility(
            visible: haveStar,
            child: Text(
              " * ",
              style: TextStyle(color: Colors.red,fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Visibility(
            visible: extraTitle!=0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
              child: extraNumber(context,extraTitle),
            ),
          ),
          Text(
            StaticVariables().translated(context, title),
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget extraNumber(BuildContext context,int index){
    switch(index) {
      case 1: {
        return Text(
          StaticVariables().translated(context, "firstly"),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        );
      }
      case 2: {
        return Text(
        StaticVariables().translated(context,  "secondly"),
    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
      }

    }
    return  Text(
      index.toString(),
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
    );
  }

  Widget addServiceProgress(BuildContext context,{required String number,bool firstOne=false, bool doneStep=false,bool onStep=false,bool nextStep=false}){
    return  Directionality(
      textDirection: StaticVariables().lang(context) == 'ar'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Row(children: [
        Visibility(
          visible: !firstOne,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(height: StaticVariables().width(context)/12,width: StaticVariables().width(context)/12,
                  child: Divider(color: doneStep||onStep||nextStep?AcademyColors.maineBlue:AcademyColors.grey10,thickness: 2,),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            doneStep?Container(height: StaticVariables().width(context)/12,width: StaticVariables().width(context)/12,
              decoration: CustomDesign().costumeBoxDecorationWithOutBorder
                (borderRadios: 100,contenarColor: AcademyColors.maineBlue),
              child: Center(child: Icon(Icons.check,color: Colors.white,),),
            ):
            Container(height: StaticVariables().width(context)/12,width: StaticVariables().width(context)/12,
              decoration: CustomDesign().costumeBoxDecoration
                (circular: 100,contenarColor: Colors.white,borderColor:onStep? AcademyColors.maineBlue:AcademyColors.grey10,borderWidth: 2),
              child: Center(child:Text(StaticVariables().translated(context, number),style: TextStyle(fontSize: 14,color: onStep? AcademyColors.maineBlue:AcademyColors.grey10),)),
            ),

          ], ),
      ],
      ),
    );
  }

  Widget titleBetweenTowLine(BuildContext context, String title){
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Divider(
              height: 1,
              color: AcademyColors.maineBlue,
              thickness: 1,
            ),
          ),
        ),
        Center(
          child: Text(
         AppLocalizations.of(context)!.translate(title).toString(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: AcademyColors.grey60,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Divider(
              height: 1,
              color: AcademyColors.maineBlue,
              thickness: 1,
            ),
          ),
        ),
      ],
    );
  }
}