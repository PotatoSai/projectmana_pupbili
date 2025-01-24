

import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});



  @override
  Widget build(BuildContext context) {

    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );


    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),

      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //desc
          Column(
            children: [
              Text("Chao Fan", style: myPrimaryTextStyle,),
              Text("Popular Now", style: mySecondaryTextStyle,),
            ],
          ),
          //desc

          Column(
            children: [
              Text("Zy Chick N Joy", style: myPrimaryTextStyle,),
              Text("Loved by Students Now", style: mySecondaryTextStyle,),
            ],
          )
        ],
      ),
    );
  }
}
