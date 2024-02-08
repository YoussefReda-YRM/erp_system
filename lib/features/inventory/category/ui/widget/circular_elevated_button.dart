import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/category/ui/add_category.dart';
import 'package:flutter/material.dart';

class CircularElevatedButton extends StatefulWidget {
  @override
  _CircularElevatedButtonState createState() => _CircularElevatedButtonState();
}

class _CircularElevatedButtonState extends State<CircularElevatedButton> {
  String? _selectedCategory;

  void _selectCategory(String? value) {
    setState(() {
      _selectedCategory = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 16.0,
          right: 5.0,
          child: Row(
            children: [
              DropdownButton<String?>(
                value: _selectedCategory,
                onChanged: _selectCategory,
                items: [
                  DropdownMenuItem(
                    value: 'Add Parent Category',
                    child: Text('Parent Category'),
                  ),
                  DropdownMenuItem(
                    value: 'Add Sub Category',
                    child: Text('Sub Category'),
                  ),
                ],
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                  if (_selectedCategory == 'Add Parent Category') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCategory(isParent: true)),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCategory(isParent: false)),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: ColorsApp.primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    _selectedCategory == 'Add Parent Category' ? Icons.add : Icons.add_circle_outline,
                    color: ColorsApp.moreLightGrey,
                    size: 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: ElevatedButton(
            onPressed: () {
              // Handle edit button press
            },
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),





























              backgroundColor: ColorsApp.primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                Icons.edit,
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