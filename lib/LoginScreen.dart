import 'package:flutter/material.dart';
import 'package:ur_fine/Register_Screen.dart';
import 'package:ur_fine/homepage.dart';
import 'package:ur_fine/utils/dimesions.dart';
import 'package:ur_fine/widgets/ButtonWidget.dart';
import 'package:ur_fine/widgets/DisplayText.dart';
import 'package:ur_fine/widgets/InputWidget.dart';
import 'package:ur_fine/widgets/LoginGradientText.dart';
import 'package:ur_fine/widgets/LoginText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            LinearGradientText(
                text: "Happiness is the highest form of health.",
                fontSize: Dimensions.font32,
                tx: TextAlign.left,
                gradient: const LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(70, 94, 251, 1),
                      Color.fromRGBO(221, 209, 246, 1.0),
                    ]
                )
            ),
            Container(
                height: Dimensions.height500,
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
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const SizedBox(height: 20),
                    Image.asset(
                      "assets/images/Frame.png",
                      height: Dimensions.height50,
                      width: Dimensions.width60,
                    ),

                    LoginBigText(text: "Login"),
                    const SizedBox(height: 20),

                    Align(
                      alignment: Alignment.topLeft,
                      child: InputWidget(
                        label: "Email",
                        hint: 'Ex. abc@gmail.com',
                        icon: Icons.email_outlined,
                      ) ,
                    ),
                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.topLeft,
                      child: InputWidget(
                        label: "Password",
                        hint: 'Ex. *******',
                        icon: Icons.lock_outline,
                      ) ,
                    ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                       'Forgot Password?', // Default text
                      style:  TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        color: Colors.white,
                        fontSize: Dimensions.font16,
                      ),
                    ),
                  ),
                    const SizedBox(height: 20),

                     ButtonWidget(
                        text: "Log In",
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },


                    ),
                     DisplayText(
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      text1: "New User?",
                      text2: "Register",
                    ),
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
