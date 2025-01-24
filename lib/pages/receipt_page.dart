
import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_buttons.dart';
import 'package:projectmana_pupbili/components/app_receipt_tile.dart';
import 'package:projectmana_pupbili/model/restaurant.dart';
import 'package:projectmana_pupbili/pages/home_page.dart';
import 'package:projectmana_pupbili/pages/map_page.dart';
import 'package:projectmana_pupbili/services/database/firestore.dart';
import 'package:provider/provider.dart';

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  //get access to db
  FirestoreService db = FirestoreService();

  @override
  void initState() {
    super.initState();

    //submit the data
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preparing your food..."),
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: _buildBottomNavbar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: MyReceipt(),

            ),

          ),
          MyButton(
            text: "Go back to Home",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            ),
          ),
          const SizedBox(height: 15,)
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
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MyMap(),),
                    );
                  },
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
