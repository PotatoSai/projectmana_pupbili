import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/model/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentName extends StatelessWidget {
  const MyCurrentName({super.key});

  void openUserNameBox(BuildContext context) {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your username"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter new username...",
          ),
        ),
        actions: [
          // Cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // Save button
          TextButton(
            onPressed: () {
              String newUser = textController.text;
              if (newUser.isNotEmpty) {
                context.read<Restaurant>().updateUserName(newUser);
              }
              Navigator.pop(context);
              textController.clear();
            },
            child: const Text("Save"),
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
          Text(
            "Welcome,",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openUserNameBox(context),
            child: Row(
              children: [
                // Name
                Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.userName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 5), // Add spacing between text and icon
                // Edit Icon
                const Icon(Icons.edit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
