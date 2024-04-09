import 'package:flutter/material.dart';
import 'package:ur_fine/LoginScreen.dart';
import 'package:ur_fine/homepage.dart';
import 'package:ur_fine/utils/dimesions.dart';
import 'package:ur_fine/widgets/ButtonWidget.dart';
import 'package:ur_fine/widgets/DisplayText.dart';
import 'package:ur_fine/widgets/InputWidget.dart';
import 'package:ur_fine/widgets/LoginGradientText.dart';
import 'package:ur_fine/widgets/LoginText.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width.toString()); //392.72
    // print(MediaQuery.of(context).size.height.toString()); //781.09
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        padding:  EdgeInsets.only(left:Dimensions.width25,right: Dimensions.width25,top: Dimensions.height40,bottom: 0),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(94,252,232,1), Color.fromRGBO(59, 190, 239, 1), Color.fromRGBO(115,110,254,1)],
              transform: GradientRotation(-0.3)
          ),
        ),
        child:Column(
          children: [
            Container(
                height: Dimensions.height620,
                width: Dimensions.width350,
                alignment: Alignment.center,
                padding:  EdgeInsets.all(Dimensions.height20),

                decoration: BoxDecoration(
                    color: const Color.fromRGBO(88, 130, 193, 0.28),
                    border: Border.all(
                      color: const Color.fromRGBO(88, 139, 193, 0.49),
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(25)
                ),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      "assets/images/Frame.png",
                      height: Dimensions.height50,
                      width: Dimensions.width60,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: LoginBigText(text: "Register"),

                    ),
                     Align(
                        alignment: Alignment.topLeft,
                        child:

                          RichText(
                            text:  TextSpan(
                              text: 'Create an', // Default text
                              style:  TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: Dimensions.font16,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' account', // Text with bold style
                                  style:  TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w900,
                                    fontSize: Dimensions.font16,
                                    color: Color.fromRGBO(87, 93, 251, 1),
                                  ),
                                ),
                                TextSpan(
                                  text: ' to stay fit  and healthy with us', // Text with a different color
                                  style:  TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: Dimensions.font16,
                                  ),
                                ),
                                TextSpan(
                                  text: ' R U Fine!', // Text with larger font size
                                  style:  TextStyle(
                                    fontFamily: "Inter",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: Dimensions.font16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                     ),
                     SizedBox(height: Dimensions.height10),
                    Align(
                        alignment: Alignment.topLeft,
                        child: InputWidget(
                          label: "Your Name",
                          hint: 'Ex. Vijay Gunwant',
                          icon: Icons.person_outline,
                        ) ,
                    ),
                     SizedBox(height: Dimensions.height5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InputWidget(
                        label: "Phone Number",
                        hint: 'Ex. 764xxxxx45',
                        icon: Icons.phone_android_outlined,
                      ) ,
                    ),
                    SizedBox(height: Dimensions.height5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InputWidget(
                        label: "Your Email",
                        hint: 'Ex. abc@gmail.com',
                        icon: Icons.email_outlined,
                      ) ,
                    ),
                    SizedBox(height: Dimensions.height5),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InputWidget(
                        label: "Your Password",
                        hint: "*********",
                        icon: Icons.lock_outline_rounded,
                      ) ,
                    ),
                    SizedBox(height: Dimensions.height10),
                     ButtonWidget(text: "Register", onPress: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => const HomePage()),
                       );
                     },),
                     DisplayText(
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      text1: "Already have an account?",
                      text2: "LogIn",
                    ),

                  ],
                )
            ),
            SizedBox(height: Dimensions.height5),
             LinearGradientText(
              text: "Your health matters. Join us to take the first step towards a healthier tomorrow.",
                fontSize: Dimensions.font20,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(70, 94, 251, 1),
                      Color.fromRGBO(221, 209, 246, 1.0),
                    ]
                )
            )

          ],
        ),
      ),
    );
  }
}
