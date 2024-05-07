import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:ur_fine/services/show_snack_bar.dart';

class SymptomDetection extends StatelessWidget {
  const SymptomDetection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,

      body: SafeArea(
        child: Column(
          children: [
            Transform.scale(
                scale: 0.8,
                child: Image.asset("assets/images/my.png"),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MultiSelectDropDown(
                clearIcon: const Icon(Icons.close),
                onOptionSelected: (options) {
                  debugPrint(options.toString());
                },
                optionsBackgroundColor: Theme.of(context).colorScheme.surface,
                fieldBackgroundColor: Theme.of(context).colorScheme.surface,
                options: const <ValueItem>[
                  ValueItem(label: 'Option 1', value: '1'),
                  ValueItem(label: 'Option 2', value: '2'),
                  ValueItem(label: 'Option 3', value: '3'),
                  ValueItem(label: 'Option 4', value: '4'),
                  ValueItem(label: 'Option 5', value: '5'),
                  ValueItem(label: 'Option 6', value: '6'),
                ],
                selectionType: SelectionType.multi,
                dropdownHeight: 300,
                optionTextStyle: const TextStyle(fontSize: 16),
                selectedOptionIcon: const Icon(Icons.check_circle),
              ),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              ShowSnackBar.showSnackBar(context, "Working on It");
            }, child: const Text("Proceed With selected symptom"))
          ],
        ),
      ),
    );
  }
}
