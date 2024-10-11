import 'package:flutter/material.dart';
import 'package:liftlog/Widgets/square_button.dart';
import 'package:liftlog/colors.dart';

class SetDetails extends StatefulWidget {
  const SetDetails({super.key});

  @override
  State<SetDetails> createState() => _SetDetailsState();
}

class _SetDetailsState extends State<SetDetails> {
  final WeightController = TextEditingController();
  final RepsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColor.ThemeColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Heading',
              style: TextStyle(color: Colors.white),
            ),
            
            ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Weight :'),
                  TextField(
                    controller: WeightController,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                  Text('Reps :'),
                  TextField(
                    controller: RepsController,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ],
              );
            },),
        
            SquareButton(
              widthSize: 0.7,
               heading: 'Add set',
                heightSize: 0.1,
                onPress:() {
                  
                },
                )
          ],
        ),
      ),
    );
  }
}
