import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/category/ui/add_category.dart';
import 'package:flutter/material.dart';

class CircularElevatedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: ElevatedButton(

            onPressed: () {
              // Handle button press
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddCategory()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              backgroundColor: ColorsApp.primaryColor
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.add,
                color: ColorsApp.moreLightGrey,
                size: 30.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}