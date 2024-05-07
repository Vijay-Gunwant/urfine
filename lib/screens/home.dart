import 'package:flutter/material.dart';

import '../services/routes.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Greetings Anshika!!!",style: Theme.of(context).textTheme.headlineLarge,),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sleep",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      const SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                            text: "5 \\",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                            children: [
                              TextSpan(
                                text: " 8hr",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Exercise",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      const SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                            text: "1 \\",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Theme.of(context).colorScheme.onSecondaryContainer),
                            children: [
                              TextSpan(
                                text: " 2 hr",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Water",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      const SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                            text: "1.5 \\",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color:  Theme.of(context).colorScheme.onSecondaryContainer),
                            children: [
                              TextSpan(
                                text: " 3L",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      border: Border.all(color: Colors.blueAccent, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Meditate",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      const SizedBox(height: 20,),
                      RichText(
                        text: TextSpan(
                            text: "0.5 \\",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color:  Theme.of(context).colorScheme.onSecondaryContainer),
                            children: [
                              TextSpan(
                                text: " 1hr",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primary,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
