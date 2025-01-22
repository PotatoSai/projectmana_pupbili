import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_drawer.dart';
import 'package:projectmana_pupbili/components/app_food_tile.dart';
import 'package:projectmana_pupbili/components/app_tab_bar.dart';
import 'package:projectmana_pupbili/components/my_description_box.dart';
import 'package:projectmana_pupbili/components/sliver_app_bar.dart';
import 'package:projectmana_pupbili/components/user_name.dart';
import 'package:projectmana_pupbili/model/food.dart';
import 'package:projectmana_pupbili/model/restaurant.dart';
import 'package:projectmana_pupbili/pages/food_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  //tab controller
  late TabController _tabController;




  @override
  void  initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void  dispose(){
    _tabController.dispose();
    super.dispose();
  }


  //method for filter

  List<Food> _filterMenuBycategory(FoodCategory category, List<Food> fullMenu){
    return fullMenu.where((food) => food.category == category).toList();
  }


  //return list of foods

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return  FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuBycategory(category, fullMenu);


      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
            final food = categoryMenu[index];

            //return food tile
            return FoodTile(
                food: food,
                onTap: () => Navigator.push(
                     context,
                     MaterialPageRoute(
                     builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }



  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySliverAppBar(
          title: MyTabBar(tabController: _tabController),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),

              //my name
              const MyCurrentName(),

              //description box
              const MyDescriptionBox(),
            ],
          ),
        ),
      ],
    body: Consumer<Restaurant>(
      builder: (context, restaurant, child) => TabBarView(
    controller: _tabController,
    children: getFoodInThisCategory(restaurant.menu),
          ),
        ), //Consumer
      ),
    );
  }
}
