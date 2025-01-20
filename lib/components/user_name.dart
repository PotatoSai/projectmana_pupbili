

import 'package:flutter/material.dart';

class MyCurrentName extends StatelessWidget {
  const MyCurrentName({super.key});

  void openUserNameBox(BuildContext context){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Your username"),
          content: const  TextField(
            decoration: InputDecoration(
              hintText: "Input your new username..."
            ),
          ),
          actions: [
            //cancel button
            MaterialButton(
                onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),


            //save button
            MaterialButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Save "),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Welcome,",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openUserNameBox(context),
            child: Row(
              children: [
                //name
                Text("Cydrick James",
                  style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            
                //edit
                Icon(Icons.edit
                ),
            
            
              ],
            ),
          )
        ],
      ),
    );
  }
}
