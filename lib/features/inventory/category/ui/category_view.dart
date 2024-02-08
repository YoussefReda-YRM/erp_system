import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/category/data/CategoryDM.dart';
import 'package:erp_system/features/inventory/category/data/repos/category_repo.dart';
import 'package:erp_system/features/inventory/category/logic/categorystate.dart';
import 'package:erp_system/features/inventory/category/logic/delete_category_cubit.dart';
import 'package:erp_system/features/inventory/category/ui/category_list_view.dart';
import 'package:erp_system/features/inventory/category/ui/widget/circular_elevated_button.dart';
import 'package:erp_system/features/inventory/category/ui/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/get_all_category_cubit.dart';
class CategoryView extends StatefulWidget {
  CategoryView({super.key});


  @override
  State<CategoryView> createState() => _CategoryViewState();
}
int currentTab=0;
String bearerToken="eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJ0ZXN0MjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ0ZXN0MjFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiSFIiLCJleHAiOjE3MDg3Njk3MjgsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwNjkiLCJhdWQiOiJNeVNlY3VyZWRBUElVc2VycyJ9.osVgUgjh04hkH9lhD-28V5BvaK4fFr9bWoffN7GubFk";

class _CategoryViewState extends State<CategoryView> {
  CategoryCubit viewmodel=getIt();
 // DeleteCategoryCubit viewmodel=getIt();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   viewmodel.getAllCategories(bearerToken);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        appBar: AppBarCustomization("Category")
        ,
        body: Column(children: [
          SizedBox(height: 10),
         // SizedBox(height: 30,width: 30,child: CircularElevatedButton()),
          Container(
            margin: EdgeInsets.only(left: 32,right: 32),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorsApp.border),

            child: Center(
              child: Row(
                children: [
                  Icon(Icons.search),
                  Text("Search for category"),

                ],
              ),

            ),

          ), BlocConsumer<CategoryCubit, CategoryState>(
            bloc: viewmodel,
            listener: (context, state){

            },
            builder: (context, state) {
              if (state is CategoryLoading) {
                return CircularProgressIndicator();
              } else if (state is CategorySuccess) {
                return Expanded(child: buildTabs(state.categories ));
              } else if (state is CategorySuccess) {
                return Expanded(child: buildTabs(state.categories ));
              } else {
                // Handle other states or return a default widget
                print("mony");
                return Container();
              }
            },




          ),
          Expanded(child: CircularElevatedButton()),
        ]
        ),

      ),
    );

  }

  Widget buildTabs(List<CategoryDm> categories) {
    return DefaultTabController(
      length: categories.length,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          TabBar(
              onTap: (index) {
                currentTab = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: categories
                  .map((singleSource) => buildTab(singleSource,
                  categories.indexOf(singleSource) == currentTab))
                  .toList()),
          Expanded(
            child: TabBarView(
              children: categories.map((category) {
                return CategoryListView(category: category);
              }).toList(),
            )


          )
        ],
      ),
    );
  }

  Widget buildTab(CategoryDm source, bool isSelected) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? ColorsApp.primaryColor: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.blue, width: 1)),
      child: Text(
        source.parentCategoryName ?? "",
        style: TextStyle(
            fontSize: 18, color: isSelected ? Colors.white : Colors.blue),
      ),
    );
  }

 /* Widget buildTabView(CategoryDm category, List<SubCategories> allSubCategories, bool isSelected) {
    List<SubCategories> subcategoriesForCurrentTab = allSubCategories
        .where((subCategory) => subCategory.subCategoryName == category.parentCategoryId)
        .toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.blue, width: 1)),
      child: Text(
        category.parentCategoryName ?? "",
        style: TextStyle(
            fontSize: 18, color: isSelected ? Colors.white : Colors.blue),
      ),
    );*/
 // }


}
