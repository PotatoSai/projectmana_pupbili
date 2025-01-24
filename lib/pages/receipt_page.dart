
import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_receipt_tile.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("We're Cooking!"),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }



  //custom nav bar
  Widget _buildBottomNavbar(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [

          //detail of store
          Container(decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              shape: BoxShape.circle,
          ),
          child: IconButton(
              onPressed: (){},
              icon: const Icon(Icons.storefront)),
          ),

          const SizedBox(width: 10,),
          
          
          
          //store details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sid Wolfgeng-geng",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

              ),
              Text("Stall 10",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),

          const Spacer(),

          Row(
            children: [
              //track your stall
              Container(decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.location_pin),
                    color: Colors.red,
                ),
              ),

              const SizedBox(width: 10,),


              //details of stall
              Container(decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
                child: IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.menu_book),
                    color: Theme.of(context).colorScheme.primary,
                ),
              ),

            ],
          )
          


        ],
      ),
    );
  }

}
