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
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Fixed-size Food image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(
                        cartItem.food.imagePath,
                        fit: BoxFit.cover, // Ensures it covers the box while maintaining aspect ratio
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Name and price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food name
                      Text(cartItem.food.name),

                      // Food price
                      Text(
                        '\₱' + cartItem.food.price.toString(),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 10,),

                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Increment and decrement

                ],
              ),
            ),

            // Add-ons
            SizedBox(
              height: cartItem.selectedAddons.isEmpty ? 0 : 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding:
                const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                children: cartItem.selectedAddons
                    .map(
                      (addon) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Row(
                        children: [
                          // Addon name
                          Text(addon.name),

                          // Addon price
                          Text(' (₱${addon.price})'),
                        ],
                      ),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color:
                              Theme.of(context).colorScheme.primary)),
                      onSelected: (value) {},
                      backgroundColor:
                      Theme.of(context).colorScheme.secondary,
                      labelStyle: TextStyle(
                        color:
                        Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
