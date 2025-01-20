import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_drawer.dart';
import 'package:projectmana_pupbili/components/app_tab_bar.dart';
import 'package:projectmana_pupbili/components/my_description_box.dart';
import 'package:projectmana_pupbili/components/sliver_app_bar.dart';
import 'package:projectmana_pupbili/components/user_name.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void  dispose(){
    _tabController.dispose();
    super.dispose();
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
    body: TabBarView(
        controller: _tabController,
        children: [
          Text("Hello")

        ],
    ),
    ),
    );
  }
}
