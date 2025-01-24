import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/pages/chat_ai.dart';

import '../pages/cart_page.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(onPressed: (){
          //go to cart page
          Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),
            )
          );
        },
            icon: const Icon(Icons.shopping_cart)),

        //chat button
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyChatBot(),
           )
          );
        },
            icon: const Icon(Icons.chat_bubble))
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Gutom? 😋", style: TextStyle(
        fontWeight: FontWeight.bold,
      ),),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
