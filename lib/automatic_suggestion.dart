import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:ur_fine/utils/dimesions.dart';
import 'package:ur_fine/widgets/ButtonWidget.dart';
import 'package:ur_fine/widgets/LoginText.dart';

class Suggestion extends StatelessWidget {
  final MultiSelectController<String> _controller = MultiSelectController();
  final List<ValueItem<String>>  s;
  final List<String?>  s2;
  Suggestion({Key? key,  this.s = const [],  this.s2 = const []}) : super(key: key){
    debugPrint(s.toString());
    debugPrint(s2.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Dimensions.screenHeight,
        width: Dimensions.screenWidth,
        padding: EdgeInsets.only(
            left: Dimensions.width25,
            right: Dimensions.width25,
            top: Dimensions.height40,
            bottom: 0),
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(94, 252, 232, 1),
              Color.fromRGBO(59, 190, 239, 1),
              Color.fromRGBO(115, 110, 254, 1)
            ],
            transform: GradientRotation(-0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginBigText(
              text: "According to your symptoms these are some best for you.",
              size: Dimensions.font20,
            ),
            SizedBox(height: Dimensions.height40),
            ButtonWidget(
              text: "Diet For You",
              onPress: () {},
            ),
            SizedBox(height: Dimensions.height40),
            ButtonWidget(
              text: "Exercise For You",
              onPress: () {},
            ),
            SizedBox(height: Dimensions.height40),
            ButtonWidget(
              text: "Medicine",
              onPress: () {},
            ),
            SizedBox(height: Dimensions.height40),
            ButtonWidget(
              text: "Things to avoid",
              onPress: () {},
            ),
            SizedBox(height: Dimensions.height40),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Selected Symptoms"),
                  const SizedBox(height: 4),
                  IgnorePointer(
                    child: MultiSelectDropDown<String>(
                    
                      controller: _controller,
                    
                      clearIcon: const Icon(null),
                    
                      onOptionSelected: null,
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
                      selectedOptions: s,
                      onOptionRemoved: (index, option) {},
                      optionBuilder: (context, valueItem, isSelected) {
                        return ListTile(
                          title: Text(valueItem.label),
                          subtitle: Text(valueItem.value.toString()),
                          trailing: isSelected
                              ? const Icon(Icons.check_circle)
                              : const Icon(Icons.radio_button_unchecked),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: Dimensions.height5,),
                  Text(
                      "The options are Disabled*",
                    style:  TextStyle(
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w900,
                        fontSize: Dimensions.font15
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
