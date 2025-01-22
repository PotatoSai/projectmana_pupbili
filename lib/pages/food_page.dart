import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/model/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;


  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          Image.asset(widget.food.imagePath),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //food name
                Text(widget.food.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

                //food price
                Text(widget.food.price.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                const SizedBox(height: 10,),

                //food description
                Text(widget.food.description),
                
                
                Text("Add-ons", style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),

                //addons
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index) {

                    Addon addon = widget.food.availableAddons[index];

                    //get individual add ons


                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text(addon.price.toString()),
                      value: false,
                      onChanged: (value) {},
                    );
                  },
                )

              ],
            ),
          )

          


        ],
      ),
    );
  }
}

