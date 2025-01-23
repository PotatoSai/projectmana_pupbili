import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_quantity_selector.dart';
import 'package:projectmana_pupbili/model/cart_item.dart';
import 'package:projectmana_pupbili/model/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder: (context, restaurant, child) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8)
          ),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(cartItem.food.imagePath,
                  height: 100,
                  width: 100,
                  ),
                ),

                const SizedBox(width: 20,),


                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food name
                    Text(cartItem.food.name),

                    //food price
                    Text('\₱' + cartItem.food.price.toString())
                  ],
                ),

                const Spacer(),


                // increment and decrement
                        QuantitySelector(
                            quantity: cartItem.quantity,
                            food: cartItem.food,
                            onDecrement: (){
                              restaurant.removeFromCart(cartItem);
                            },
                            onIncrement: () {
                              restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                            }
                        )
                      ],
                    ),
                  ),

                //add ons
                SizedBox(
                  height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: cartItem.selectedAddons
                        .map(
                          (addon) => FilterChip(
                            label: Row(
                              children: [
                                // addon name
                                Text(addon.name),

                                //addon price
                                Text(addon.price.toString()),
                          ],
                        ),
                      onSelected: (value) {},
                      ),
                    )
                    .toList(),
                  ),
                )


              ],
             ),
            )
    );
  }
}
