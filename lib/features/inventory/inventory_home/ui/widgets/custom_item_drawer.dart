import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomItemDrawer extends StatelessWidget {
  final Widget leading;
  final String title;
  final String? subTitle;
  final Function() onTap;
  const CustomItemDrawer({
    super.key,
    required this.leading,
    required this.title,
    required this.onTap,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        title,
        maxLines: 1,
        style: Styles.font18LightGreyBold,
      ),
      onTap: () {
        // Handle item 2 tap
        Navigator.pop(context); // Close the Drawer
      },
    );
  }
}
