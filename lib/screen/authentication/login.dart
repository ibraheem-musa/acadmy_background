import 'package:academy/help/colors.dart';
import 'package:academy/help/custom_design.dart';
import 'package:academy/help/custom_textformfield.dart';
import 'package:academy/help/navigation_trnsition.dart';
import 'package:academy/help/static_variables.dart';
import 'package:academy/screen/authentication/signup.dart';
import 'package:academy/screen/authentication/widget/tringle.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool itsForSignup=false;

  String _email = '';
  String _password = '';
  bool isCheckedRememberMe = false;
  bool incorrectEmail = false;
  bool incorrectPassword = false;
  bool _showPassword = true;
  bool expanded=false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                ClipPath(
                clipper: CustomTriangleClipper(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.center,
                      colors: [AcademyColors.maineBlue.withOpacity(0.5), AcademyColors.maineBlue],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height/2,
                ),
          ),
                Column(
                  children: [
                    SizedBox(
                        height:  MediaQuery.of(context).size.height/5.4,
                        child: Center(child:VerticalDivider(color: AcademyColors.grey60,thickness: 2),)),
                    Center(child: Icon(Icons.sunny,color: AcademyColors.grey60,size: 150,),),
                  ],
                )
              ],
            ),
            //-------Email Text------
            CustomTextFormField(
              hintText:
              StaticVariables()
                  .translated(context, "enter_email"),
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
                  .translated(context,"enter_password" ),
              showPassword: _showPassword,
              textInputType: TextInputType.visiblePassword,
              onChanged: (value) {
                _password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return
                    StaticVariables()
                        .translated(context,"mandatory_field" );
                } else {
                  if (incorrectPassword) {
                    return
                      StaticVariables()
                          .translated(context, "Incorrect_password" );
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
                      child: Icon(Icons.remove_red_eye,color:AcademyColors.maineBlue,))
                      : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:
                      Icon(Icons.remove_red_eye_outlined,color:AcademyColors.maineBlue))),
            ),
            // forgot_your_password
            InkWell(
              onTap: (){
                // Navigator.of(context)
                //     .push(
                //   NavigationTransitions.slideLeftTransition(
                //       time: 300, page:ForgetPassword() ),
                // );
              },
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                  child: Container(
                    width: StaticVariables().width(context),
                    child: Text(StaticVariables().translated(context, 'forgot_your_password'),
                      style: TextStyle(decoration: TextDecoration.underline ,color: AcademyColors.maineBlue,fontWeight: FontWeight.w600,fontSize: 15),textAlign: TextAlign.start,),
                  )),
            ),
            //--------LogIn and signup----
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: expanded?3:5,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 20, 8, 6),
                        child: InkWell(
                          onTap: ()async{
                            // Messages().Loading(context);
                            // UserModel userModel=UserModel(
                            //   password:_password ,
                            //   email: _email,
                            // );
                            // if(_formKey.currentState!.validate()){
                            //   await RegistrationController.login(userModel).then((loginUser) {
                            //     if(loginUser[0]==200){
                            //       userModel.token =loginUser[1].token;
                            //       userModel.name=loginUser[1].name;
                            //       userModel.save();
                            //       Navigator.pop(context);
                            //       Navigator.of(context)
                            //           .pushReplacement(
                            //         NavigationTransitions.slideLeftTransition(
                            //             time: 300, page:HomeScreen() ),
                            //       );
                            //     }else{
                            //       Navigator.pop(context);
                            //       Messages().MessageAlert(context: context,
                            //           message:  "something_went_wrong",
                            //           onPressed: (){
                            //             Navigator.pop(context);},
                            //           roundedButtonTitle: "back",
                            //           icon: Icons.close
                            //       );
                            //     }
                            //   });
                            // }else{
                            //   Navigator.pop(context);
                            // }
                            //

                          },
                          child: Container(
                            height: 60,
                            decoration: CustomDesign().costumeBoxDecorationWithOutBorder(contenarColor: AcademyColors.maineBlue,borderRadios: 5),
                            child: Center(child: Text(StaticVariables()
                                .translated(context,"login" ),style: TextStyle(color: AcademyColors.backGroundBlue,fontWeight: FontWeight.w600,fontSize: 18),)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: expanded?5:3,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 20, 8, 6),
                        child: InkWell(
                          onTap: (){

                            setState(() {
                              expanded=!expanded;
                            });
                            // Navigator.of(context)
                            //     .push(
                            //   NavigationTransitions.slideTransitionFromDownToUp(
                            //       time: 300, page:SignUp() ),
                            // );
                          },
                          child: Container(height: 60,
                            decoration: CustomDesign().costumeBoxDecoration(contenarColor: AcademyColors.backGroundBlue,circular: 5,borderColor: Colors.black87,borderWidth: 1.5),
                            child: Center(child: Text(StaticVariables()
                                .translated(context,"signup" ),style: TextStyle(color: AcademyColors.maineBlue,fontWeight: FontWeight.w600,fontSize: 18),)),

                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            //-------SignUp----

        ],),),
      ),
    );
  }
}
