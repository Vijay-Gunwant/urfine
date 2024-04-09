import 'package:flutter/material.dart';
import 'package:ur_fine/medical_records.dart';
import 'package:ur_fine/utils/dimesions.dart';
import 'package:ur_fine/widgets/ButtonWidget.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child:  Container(
        height: Dimensions.screenHeight/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Container(
                alignment: Alignment.topRight,
                child:
                IconButton(
                  padding: const EdgeInsets.all(0),
                  color:  const Color.fromRGBO(87, 93, 251, 1),
                  icon:  Icon(
                      Icons.logout_outlined,
                      size: Dimensions.font32
                  ),
                onPressed: () {  },)
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ButtonWidget(
                    text: "Medical Records",
                  onPress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MedicalRecords()),
                    );
                  },
                ),
                SizedBox(height:Dimensions.height25),
                 ButtonWidget(text: "Symptomp Analyzer", onPress: () {  },),
              ],
            )
            ]
        ),
      ),
    );
  }
}
