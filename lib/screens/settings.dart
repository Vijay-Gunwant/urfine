import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ur_fine/services/show_snack_bar.dart';
import 'package:ur_fine/services/theme_provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Anshika Joshi",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        "myemail@gmail.com",
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Consumer<ThemeProvider>(
                    builder: (BuildContext context, ThemeProvider value,
                        Widget? child) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  value.isDark
                                      ? Icons.dark_mode
                                      : Icons.light_mode,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.fontSize,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  value.isDark ? "Dark Theme" : "Light Theme",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            Switch(
                                value: value.isDark,
                                onChanged: (a) {
                                  value.setIsDark();
                                })
                          ]);
                    },
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: () {
                        ShowSnackBar.showSnackBar(context, "Working on It");
                                              },
                      child: Text(
                        "Edit Profile",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
