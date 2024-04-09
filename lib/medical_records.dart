import 'package:flutter/material.dart';
import 'package:ur_fine/automatic_suggestion.dart';
import 'package:ur_fine/utils/dimesions.dart';
import 'package:ur_fine/widgets/ButtonWidget.dart';
import 'package:ur_fine/widgets/LoginText.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
class MedicalRecords extends StatefulWidget {
  const MedicalRecords({Key? key}) : super(key: key);

  @override
  State<MedicalRecords> createState() => _MedicalRecordsState();
}

class _MedicalRecordsState extends State<MedicalRecords> {

  final MultiSelectController<String> _controller = MultiSelectController();
  List<String?> s = [];
  List<ValueItem<String>> s2 = [];
  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginBigText(
                text: "Tell us your symptoms and got best choices for you.",
                size: Dimensions.font20,
            ),
             SizedBox(height: Dimensions.height15,),
            Image.asset(
              "assets/images/my.png",
              height:300,
              width:200,
            ),
            SizedBox(height: Dimensions.height25,),
            SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              const Text(
              "Select Symptomps"
              ),
              const SizedBox(
              height: 4,
              ),
              MultiSelectDropDown<String>(
              controller: _controller,
              clearIcon: const Icon(Icons.cancel),
              onOptionSelected: (options) {
                  s2 = options;
                  s = options.map((e) => e.value).toList();
              },
              options: const <ValueItem<String>>[
              ValueItem(
              label: 'Option 1',
                value: 'User 1',

             ),
              ValueItem(
              label: 'Option 2',
              value:  'User 2'),
              ValueItem(
              label: 'Option 3',
              value: 'User 3', ),
              ValueItem(
              label: 'Option 4',
              value:  'User 4'),
              ValueItem(
              label: 'Option 5',
              value: 'User 5', ),
              ],
              maxItems: 4,
              singleSelectItemStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold),
              chipConfig: const ChipConfig(
              wrapType: WrapType.wrap, backgroundColor: Colors.red),
              optionTextStyle: const TextStyle(fontSize: 16),
              selectedOptionIcon: const Icon(
              Icons.check_circle,
              color: Colors.pink,
              ),
              selectedOptionBackgroundColor: Colors.grey.shade300,
              selectedOptionTextColor: Colors.blue,
              dropdownMargin: 2,
              onOptionRemoved: (index, option) {},
              optionBuilder: (context, valueItem, isSelected) {
              return ListTile(
              title: Text(valueItem.label),
              trailing: isSelected
              ? const Icon(Icons.check_circle)
                  : const Icon(Icons.radio_button_unchecked),
              );
              },
              ),
            ],
          ),
        ),
             SizedBox(height: Dimensions.height50,),
             ButtonWidget(
                text: "Proceed With the Selected Symptomps",
                size: Dimensions.font15,
               onPress: (){
                  if (s2.isEmpty){
                    final snackBar = SnackBar(
                      content: const Text('Please Select a Option'),
                      action: SnackBarAction(
                        label: 'Close',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Suggestion(s2: s, s: s2)),
                    );
                  }
               },

            )
         ],
    ),
    ),
    );
  }
}
