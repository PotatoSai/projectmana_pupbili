import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:projectmana_pupbili/model/cart_item.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food

  final List<Food> _menu = [
    //chicken

    Food(
      name: "Chicken Shawarma",
      description: "A delicious Middle Eastern wrap filled with grilled chicken, fresh veggies, and flavorful sauce.",
      imagePath: "lib/images/meals/chicken_shawarma.png",
      price: 75.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Chicken", price: 10.00),
        Addon(name: "Cheese", price: 15.00),
        Addon(name: "Quality Time ni Sid", price: 10.00),
        Addon(name: "Extra Wrap", price: 20.00),
      ],
    ),
    Food(
      name: "Korean Fried Chicken",
      description: "Crispy and juicy double-fried chicken glazed with a sweet and spicy Korean sauce.",
      imagePath: "lib/images/meals/korean_fried_chicken.png",
      price: 180.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Sauce", price: 20.00),
        Addon(name: "Cheese Dip", price: 25.00),
        Addon(name: "Kiss ni Jose", price: 30.00),
      ],
    ),
    Food(
      name: "Buffalo Wings",
      description: "Spicy and tangy chicken wings served with a side of ranch or blue cheese dressing.",
      imagePath: "lib/images/meals/buffalo_wings.png",
      price: 150.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Spicy", price: 15.00),
        Addon(name: "Garlic Parmesan", price: 20.00),
        Addon(name: "Hug ni Renze", price: 10.00),
      ],
    ),
    Food(
      name: "Chicken Adobo",
      description: "A classic Filipino dish made with chicken braised in soy sauce, vinegar, and garlic.",
      imagePath: "lib/images/meals/chicken_adobo.png",
      price: 120.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Boiled Egg", price: 15.00),
        Addon(name: "Extra Rice", price: 20.00),
        Addon(name: "Selfie Pic ni Carlito", price: 40.00),
      ],
    ),
    Food(
      name: "Hainanese Chicken Rice",
      description: "Steamed chicken served with fragrant rice, ginger sauce, and chili dip.",
      imagePath: "lib/images/meals/hainanese_chicken_rice.png",
      price: 160.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Rice", price: 20.00),
        Addon(name: "Soy Sauce Dip", price: 10.00),
        Addon(name: "Dance Number ni Ella", price: 25.00),
      ],
    ),


    //pork
    Food(
      name: "Lechon Kawali",
      description: "Crispy deep-fried pork belly served with liver sauce or spicy vinegar.",
      imagePath: "lib/images/meals/lechon_kawali.png",
      price: 160.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Skin", price: 30.00),
        Addon(name: "Chili Vinegar", price: 15.00),
      ],
    ),
    Food(
      name: "Pork Sisig",
      description: "Sizzling chopped pork cheeks with onions, chili, and creamy mayonnaise.",
      imagePath: "lib/images/meals/pork_sisig.png",
      price: 140.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Egg", price: 15.00),
        Addon(name: "Extra Mayo", price: 10.00),
      ],
    ),
    Food(
      name: "Pork BBQ",
      description: "Grilled marinated pork skewers served with a sweet and smoky glaze.",
      imagePath: "lib/images/meals/pork_bbq.png",
      price: 90.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Stick", price: 30.00),
        Addon(name: "Spicy Glaze", price: 10.00),
      ],
    ),
    Food(
      name: "Crispy Pata",
      description: "Deep-fried pork leg with crispy skin and tender meat, best served with soy vinegar sauce.",
      imagePath: "lib/images/meals/crispy_pata.png",
      price: 350.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Vinegar Sauce", price: 15.00),
        Addon(name: "Chopped Garlic", price: 10.00),
      ],
    ),
    Food(
      name: "Pork Sinigang",
      description: "A tangy and savory pork stew with tamarind broth, vegetables, and tender pork cuts.",
      imagePath: "lib/images/meals/pork_sinigang.png",
      price: 140.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Tamarind Soup", price: 20.00),
        Addon(name: "Extra Vegetables", price: 25.00),
      ],
    ),


    // Desserts
    Food(
      name: "Leche Flan",
      description: "A creamy caramel custard dessert with a smooth and rich texture.",
      imagePath: "lib/images/desserts/leche_flan.png",
      price: 70.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Caramel", price: 10.00),
      ],
    ),
    Food(
      name: "Halo-Halo",
      description: "A refreshing Filipino dessert with crushed ice, milk, beans, jellies, and ice cream.",
      imagePath: "lib/images/desserts/halo_halo.png",
      price: 120.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Ice Cream", price: 20.00),
      ],
    ),
    Food(
      name: "Chocolate Lava Cake",
      description: "A decadent chocolate cake with a gooey melted center, served with vanilla ice cream.",
      imagePath: "lib/images/desserts/chocolate_lava_cake.png",
      price: 150.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Ice Cream", price: 25.00),
      ],
    ),
    Food(
      name: "Mango Float",
      description: "A no-bake layered dessert with graham crackers, whipped cream, and fresh mango slices.",
      imagePath: "lib/images/desserts/mango_float.png",
      price: 110.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra Mango", price: 20.00),
      ],
    ),
    Food(
      name: "Ube Cheesecake",
      description: "A creamy cheesecake infused with sweet and nutty ube (purple yam).",
      imagePath: "lib/images/desserts/ube_cheesecake.png",
      price: 180.00,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 15.00),
      ],
    ),



    // Meals
    Food(
      name: "Beef Tapa",
      description: "Filipino-style marinated beef served with garlic rice and a fried egg.",
      imagePath: "lib/images/meals/beef_tapa.png",
      price: 140.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Egg", price: 15.00),
        Addon(name: "Extra Rice", price: 20.00),
      ],
    ),
    Food(
      name: "Bangsilog",
      description: "Fried boneless bangus (milkfish) paired with garlic rice and egg.",
      imagePath: "lib/images/meals/bangsilog.png",
      price: 130.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Fish", price: 50.00),
        Addon(name: "Vinegar Dip", price: 10.00),
      ],
    ),
    Food(
      name: "Bistek Tagalog",
      description: "Tender beef slices in a tangy soy sauce and calamansi sauce, served with rice.",
      imagePath: "lib/images/meals/bistek_tagalog.png",
      price: 150.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Onion", price: 10.00),
        Addon(name: "Extra Beef", price: 40.00),
      ],
    ),
    Food(
      name: "Salisbury Steak",
      description: "Beef patties smothered in mushroom gravy, served with mashed potatoes or rice.",
      imagePath: "lib/images/meals/salisbury_steak.png",
      price: 170.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Gravy", price: 10.00),
        Addon(name: "Extra Patty", price: 50.00),
      ],
    ),
    Food(
      name: "Grilled Salmon",
      description: "Freshly grilled salmon fillet with lemon butter sauce, served with rice or veggies.",
      imagePath: "lib/images/meals/grilled_salmon.png",
      price: 250.00,
      category: FoodCategory.meals,
      availableAddons: [
        Addon(name: "Extra Sauce", price: 15.00),
        Addon(name: "Steamed Veggies", price: 30.00),
      ],
    ),


    // Sandwiches
    Food(
      name: "BLT Sandwich",
      description: "Classic sandwich with crispy bacon, fresh lettuce, and tomatoes on toasted bread.",
      imagePath: "lib/images/sandwiches/blt_sandwich.png",
      price: 100.00,
      category: FoodCategory.sandwiches,
      availableAddons: [
        Addon(name: "Extra Bacon", price: 20.00),
        Addon(name: "Cheese", price: 15.00),
      ],
    ),
    Food(
      name: "Clubhouse Sandwich",
      description: "Layered sandwich with chicken, ham, bacon, lettuce, tomato, and mayo.",
      imagePath: "lib/images/sandwiches/clubhouse_sandwich.png",
      price: 130.00,
      category: FoodCategory.sandwiches,
      availableAddons: [
        Addon(name: "Extra Ham", price: 15.00),
        Addon(name: "Fries", price: 30.00),
      ],
    ),
    Food(
      name: "Grilled Cheese",
      description: "Golden-brown sandwich with gooey melted cheese inside.",
      imagePath: "lib/images/sandwiches/grilled_cheese.png",
      price: 90.00,
      category: FoodCategory.sandwiches,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 20.00),
        Addon(name: "Tomato Soup", price: 40.00),
      ],
    ),
    Food(
      name: "Philly Cheesesteak",
      description: "Sliced beef with melted cheese and sautéed onions in a hoagie roll.",
      imagePath: "lib/images/sandwiches/philly_cheesesteak.png",
      price: 150.00,
      category: FoodCategory.sandwiches,
      availableAddons: [
        Addon(name: "Extra Meat", price: 40.00),
        Addon(name: "Jalapenos", price: 10.00),
      ],
    ),
    Food(
      name: "Chicken Pesto Sandwich",
      description: "Grilled chicken with pesto sauce and mozzarella on ciabatta bread.",
      imagePath: "lib/images/sandwiches/chicken_pesto_sandwich.png",
      price: 120.00,
      category: FoodCategory.sandwiches,
      availableAddons: [
        Addon(name: "Extra Pesto", price: 15.00),
        Addon(name: "Sun-Dried Tomatoes", price: 20.00),
      ],
    ),



    // Drinks
    Food(
      name: "Iced Coffee",
      description: "Chilled coffee with milk and sweetener, served over ice.",
      imagePath: "lib/images/drinks/iced_coffee.png",
      price: 90.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 20.00),
        Addon(name: "Whipped Cream", price: 15.00),
      ],
    ),
    Food(
      name: "Milk Tea",
      description: "Sweetened tea with milk and chewy tapioca pearls.",
      imagePath: "lib/images/drinks/milk_tea.png",
      price: 110.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Pearls", price: 20.00),
        Addon(name: "Cream Cheese", price: 30.00),
      ],
    ),
    Food(
      name: "Fresh Mango Shake",
      description: "Refreshing blended mango drink with a hint of milk and sugar.",
      imagePath: "lib/images/drinks/mango_shake.png",
      price: 100.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 15.00),
        Addon(name: "Chia Seeds", price: 10.00),
      ],
    ),
    Food(
      name: "Strawberry Lemonade",
      description: "Tangy and sweet lemonade infused with fresh strawberries.",
      imagePath: "lib/images/drinks/strawberry_lemonade.png",
      price: 95.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Strawberries", price: 20.00),
        Addon(name: "Honey", price: 15.00),
      ],
    ),
    Food(
      name: "Hot Chocolate",
      description: "Rich and creamy hot chocolate topped with marshmallows.",
      imagePath: "lib/images/drinks/hot_chocolate.png",
      price: 80.00,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Extra Marshmallows", price: 10.00),
        Addon(name: "Whipped Cream", price: 15.00),
      ],
    ),

  ];

  //user cart
  final List<CartItem> _cart = [];

  //username can change
  String _userName = 'PUPian';

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get userName => _userName;


  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
      CartItem? cartItem = _cart.firstWhereOrNull((item) {
        // check if food items are the same
        bool isSameFood = item.food == food;

        //check if the list of selected addons are the same
        bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

        return isSameFood && isSameAddons;

      });


      if (cartItem != null) {
      cartItem.quantity++;
  }
   //otherwise add new cart
    else{
      _cart.add(
      CartItem(
      food: food,
      selectedAddons: selectedAddons,),
      );
     }
  notifyListeners();
    }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
  int cartIndex = _cart.indexOf(cartItem);

  if (cartIndex != -1) {
    if (_cart[cartIndex].quantity > 1) {
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
      }
    }
  notifyListeners();
  }

  //get total prize
  double getTotalPrice(){
    double total = 0.0;

    for(CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //total number of items in cart
  int getTotalItemCount() {
  int totalItemCount = 0;

  for (CartItem cartItem in _cart) {
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
}

  //clear cart
  void clearCart() {
  _cart.clear();
  notifyListeners();
}

  //update the username
  void updateUserName (String newUser) {
    _userName = newUser;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();


    //format the date
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("______________________");


    for (final cartItem in _cart) {
      receipt.writeln(("${cartItem.quantity} *  ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"));

      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("   Add-ons: ${_formatAddon(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("______________________");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Customer Name: $userName");


    return receipt.toString();

  }


  String _formatPrice(double price) {
    return "\ ₱${price.toStringAsFixed(2)}";
  }

  String _formatAddon(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)}), ")
        .join();
  }




}





