import 'package:flutter/material.dart';

class EditDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle edit action
            },
          ),
          SizedBox(width: 16), // Adjust spacing as needed
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
    );
  }
}