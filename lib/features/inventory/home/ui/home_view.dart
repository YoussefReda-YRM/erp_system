import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/home/logic/home_viewmodel.dart';
import 'package:erp_system/features/inventory/home/ui/widget/items_inventory.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text("Home   "),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(22))),
      ),

      body: ItemsInventory(),
      drawer:  Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: ColorsApp.primaryColor),
              child: Center(child: Text("MAIN",style: TextStyle(color: ColorsApp.moreLightGrey),)),
            ),
            SizedBox(height: 10,),
            buildDrawerRow(Icons.production_quantity_limits, "Products", (){
              /*currentWidget = categoriesTab;
              Navigator.pop(context);
              setState(() {});*/
            }),
            SizedBox(height: 10,),
            buildDrawerRow(Icons.category, "Category", (){
              /*currentWidget = SettingsTab();
              Navigator.pop(context);
              setState(() {});*/
            })
          ],
        ),
      ),

    bottomNavigationBar:
     BottomNavigationBar(
    unselectedItemColor: ColorsApp.grey,
    selectedItemColor: ColorsApp.darkBlue,
    showSelectedLabels: false,
    onTap: (index) {
    viewModel.changeSelectedTab(index);
    },
    iconSize: 35,
    currentIndex: viewModel.currentTabIndex,
    items: [
    buildBottomNavIcon(
        AssetsData.logo, viewModel.currentTabIndex == 0),
    buildBottomNavIcon(
        AssetsData.logo, viewModel.currentTabIndex == 1),
    buildBottomNavIcon(
        AssetsData.logo, viewModel.currentTabIndex == 2),
    buildBottomNavIcon(
        AssetsData.logo, viewModel.currentTabIndex == 3),
    ],
    ),


    );
  }

  buildBottomNavIcon(String asset, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            child: ImageIcon(
              AssetImage(asset),
              size: 30,
            ))
            : ImageIcon(AssetImage(asset), size: 30),
        label: "");
  }

  buildDrawerRow(IconData iconData, String title, Function onClick){
    return InkWell(
      onTap: (){
        onClick();
      },
      child: Row(
        children: [
          SizedBox(width: 8,),
          Icon(iconData),
          SizedBox(width: 4,),
          Text(title),
        ],
      ),
    );
  }
}


