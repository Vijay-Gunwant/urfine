import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ur_fine/services/database_services.dart';
import 'package:ur_fine/services/show_snack_bar.dart';

import '../services/routes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Reset Password",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(" ")
                                ],
                                controller: emailController,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.email),
                                  hintText: 'Enter your email',
                                  labelText: 'Email',
                                ),
                                validator: (String? value) {
                                  return (value==null || value==""? "Email is required": EmailValidator.validate(value) ? null: "Invalid email!!");
                                },
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: double.maxFinite,
                                child:  ElevatedButton(

                                    onPressed: () {

                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus?.unfocus();
                                        try {
                                          DatabaseServices().passwordReset(
                                              emailController.text);
                                          ShowSnackBar.showSnackBar(context, "Please check you email to reset the password!!!");

                                        }
                                        catch(e){
                                          ShowSnackBar.showSnackBar(context, "Some error occured!!!");
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Reset Password",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                text: TextSpan(
                                    text: "Don't have an account? ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "Register",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context,
                                                RouteGenerator.register);
                                          },
                                      )
                                    ]),
                              ),
                              const SizedBox(height: 10),
                              const Text("Or"),
                              const SizedBox(height: 10),

                              RichText(
                                text: TextSpan(
                                    text: "Already have an account? ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text: "Login",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            fontWeight: FontWeight.bold),
                                        recognizer: TapGestureRecognizer()..onTap = (){
                                          Navigator.pushNamed(context, RouteGenerator.login);
                                        },
                                      )
                                    ]),
                              ),


                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
