import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/services/database_services.dart';
import 'package:ur_fine/services/routes.dart';
import 'package:ur_fine/services/show_snack_bar.dart';

import '../services/user_details_provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserDetailsProvider>(context);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome Back!!!",
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
                              const SizedBox(height: 40),
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[ ]'))
                                ],
                                controller: passwordController,
                                decoration: InputDecoration(
                                  icon: const Icon(Icons.lock),
                                  hintText: 'Enter password',
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      icon: isPasswordVisible
                                          ? const Icon(Icons.visibility)
                                          : const Icon(Icons.visibility_off)),
                                ),
                                obscureText: !isPasswordVisible,
                                onSaved: (String? value) {
                                  // This optional block of code can be used to run
                                  // code when the user saves the form.
                                },
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }
                                  if (value.length < 8) {
                                    return "Password must be 8 character long";
                                  }
                                  if (!value
                                      .contains(RegExp(r'[1234567890]'))) {
                                    return "Password must have a digit";
                                  }
                                  if (!value.contains(RegExp(r'[A-Z]'))) {
                                    return "Password must have a uppercase alphabet";
                                  }
                                  if (!value.contains(RegExp(r'[a-z]'))) {
                                    return "Password must a lowercase alphabet";
                                  }
                                  if (!value.contains(
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>_+-=]'))) {
                                    return "Password must have a special character";
                                  }

                                  return null; // Return null if validation passes
                                },
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, RouteGenerator.resetPassword);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: Colors.red),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                width: double.maxFinite,
                                child: ElevatedButton(
                                    onPressed: () {

                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus?.unfocus();

                                        DatabaseServices().checkIfUserExists(emailController.text, passwordController.text).then((value){
                                          if(value.$1 == 200){
                                            userProvider.setUserUsingUid(value.$2!);
                                            ShowSnackBar.showSnackBar(context, "User login Successful");

                                            Navigator.pushReplacementNamed(
                                                context, RouteGenerator.dashboard);
                                          }
                                          else {
                                            ShowSnackBar.showSnackBar(context, "Invalid Credentials",color: Colors.red);
                                          }
                                        });

                                      }
                                    },
                                    child: Text(
                                      "Log In",
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
