import 'package:academy/help/colors.dart';
import 'package:academy/help/custom_design.dart';
import 'package:academy/help/custom_textformfield.dart';
import 'package:academy/help/static_variables.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool itsForSignup=false;

  String _email = '';
  String _Username = '';
String _phone ='';
  String _password = '';
  String _confirmPassword = '';
  bool isCheckedRememberMe = false;
  bool incorrectEmail = false;
  bool incorrectPassword = false;
  bool _showPassword = true;
  bool _showConfirmPassword = true;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AcademyColors.backGroundBlue,
      body: Container(
        height:MediaQuery.of(context).size.height ,
        width:MediaQuery.of(context).size.width ,
        child: Stack(
          children: [
           Positioned(
            top: -50,
                left: -20,
                child: Image.asset('assets/images/up.png',width: MediaQuery.of(context).size.width*1.1 ,)),
            Center(
              child: SingleChildScrollView(

                child: Form(
                  key: _formKey,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //-------name Text------
                       SizedBox(height: StaticVariables().height(context)/7, ),
                      //-------name Text------
                      CustomTextFormField(
                        hintText:
                        StaticVariables()
                          .translated(context,"user_name" ),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ) {
                            return
                            StaticVariables()
                              .translated(context,"mandatory_field" );
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _Username = value.trim();
                        },
                      ),
                      //-------Email Text------
                      CustomTextFormField(
                        hintText:
                        StaticVariables()
                          .translated(context,"enter_email" ),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                  .hasMatch(value.trim())) {
                            return
                            StaticVariables()
                              .translated(context,"mandatory_field" );
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _email = value.trim();
                        },
                      ),
                      //--------Password---
                      CustomTextFormField(
                        hintText:
                        StaticVariables()
                            .translated(context,"enter_password"),
                        showPassword: _showPassword,
                        textInputType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          _password = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return
                            StaticVariables()
                                .translated(context, "mandatory_field");
                          } else {
                            if (incorrectPassword) {
                              return
                              StaticVariables()
                                .translated(context,"confirmation_field_not_match_password" );
                            } else {
                              if (_password.length < 8) {
                                return
                                StaticVariables().translated(
                                  context, "password_should_have");
                              }
                            }
                          }
                          return null;
                        },
                        suffixWidget: InkWell(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            child: !_showPassword
                                ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.remove_red_eye))
                                : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                Icon(Icons.remove_red_eye_outlined))),
                      ),
                      //--------confirm_password---
                      CustomTextFormField(
                        hintText:
                        StaticVariables()
                            .translated(context,"confirm_password"),
                        showPassword: _showConfirmPassword,
                        textInputType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          _confirmPassword = value;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return
                              StaticVariables()
                                  .translated(context, "mandatory_field");
                          } else {
                            if (incorrectPassword) {
                              return
                                StaticVariables()
                                    .translated(context,"confirmation_field_not_match_password" );
                            } else {
                              if (_password.length < 8) {
                                return
                                  StaticVariables().translated(
                                      context, "password_should_have");
                              }
                            }
                          }
                          return null;
                        },
                        suffixWidget: InkWell(
                            onTap: () {
                              setState(() {
                                _showConfirmPassword = !_showConfirmPassword;
                              });
                            },
                            child: !_showConfirmPassword
                                ? Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Icons.remove_red_eye))
                                : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child:
                                Icon(Icons.remove_red_eye_outlined))),
                      ),
                     //--phone -------
                      Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                          child: IntlPhoneField(
                            style: const TextStyle(
                              fontSize: 16.0,
                              height: 1.0,
                            ),
                            flagsButtonPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                            textAlign: TextAlign.end,
                            decoration: InputDecoration(
                              label:Text( StaticVariables().translated(context, 'phone'),),
                              labelStyle: TextStyle(color:AcademyColors.maineBlue,fontSize: 14,fontWeight: FontWeight.w500,),
                              border:UnderlineInputBorder(
                                borderSide: BorderSide(color: AcademyColors.maineBlue,width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AcademyColors.maineBlue,width: 2),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AcademyColors.maineBlue,width: 2),),
                            ),
                            validator: (value){
                              if (value!.number=='') {
                                return StaticVariables().translated(context, "mandatory_field");
                              }
                              return null;
                            },
                            // showDropdownIcon: false,
                            initialCountryCode: 'JO',
                            // showCountryFlag: false,
                            onChanged: (phone) {
                              setState(() {
                                _phone=phone.completeNumber;
                                // _phoneWithoutCountryCOde=phone.
                              });
                            },
                          )
                      ),
                      //--------signup----
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 6),
                        child: InkWell(
                          onTap: ()async{
                            // Messages().Loading(context);
                            // setState(() {
                            //   incorrectPassword=false;
                            // });
                            // UserModel userModel=UserModel(
                            //   password:_password ,
                            //   name: _Username,
                            //   email: _email,
                            //   phone: _phone,
                            // );
                            // if(_formKey.currentState!.validate()){
                            //   if(_password==_confirmPassword){
                            //     await RegistrationController.signup(userModel,_confirmPassword).then((signUpUser) {
                            //
                            //       if(signUpUser[0]==200){
                            //         userModel.token =signUpUser[1].token;
                            //         userModel.save();
                            //
                            //         Navigator.pop(context);
                            //         Messages().MessageAlert(context: context,
                            //             message:  "restoration_successfully",
                            //             onPressed: (){
                            //               Navigator.pop(context);
                            //
                            //               Navigator.of(context).pushAndRemoveUntil(
                            //                   NavigationTransitions.fadeInTransition(
                            //                       page:const HomeScreen()),(Route<dynamic> route) => false);
                            //               },
                            //             roundedButtonTitle: "go_to_the_garden",
                            //             icon: Icons.check
                            //         );
                            //
                            //       }else{
                            //         Navigator.pop(context);
                            //         Messages().MessageAlert(context: context,
                            //             message:  "something_went_wrong",
                            //             onPressed: (){
                            //               Navigator.pop(context);},
                            //             roundedButtonTitle: "back",
                            //             icon: Icons.close
                            //         );
                            //       }
                            //     });
                            //   }else{
                            //     _formKey.currentState!.validate();
                            //     setState(() {
                            //       incorrectPassword=true;
                            //     });
                            //   }
                            //
                            // }else{
                            //   Navigator.pop(context);
                            // }

                          },
                          child: Container(height: 60,width: MediaQuery.of(context).size.width,
                            decoration: CustomDesign().costumeBoxDecoration(contenarColor: AcademyColors.maineBlue,circular: 50,borderColor: Colors.black87,borderWidth: 1),
                            child: Center(child: Text(StaticVariables()
                                .translated(context,"create_new_account" ),style: TextStyle(color: AcademyColors.backGroundBlue,fontWeight: FontWeight.w600,fontSize: 18),)),
                          ),
                        ),
                      ),
                      //-------login----
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 6, 15, 6),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(height: 60,width: MediaQuery.of(context).size.width,
                            decoration: CustomDesign().costumeBoxDecoration(contenarColor: AcademyColors.backGroundBlue,circular: 50,borderColor: Colors.black87,borderWidth: 1.5),
                            child: Center(child: Text(StaticVariables()
                                .translated(context,"back_to_LogIn"),style: TextStyle(color: AcademyColors.maineBlue,fontWeight: FontWeight.w600,fontSize: 18),)),
                          ),
                        ),
                      ),
                      //---------------
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
