import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/product/add_product/ui/widgets/body_show_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key, required this.ctxt});
  final BuildContext ctxt;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorsApp.primaryColor,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: false,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          context: ctxt,
          builder: (context) {
            return const BodyShowModalBottomSheet();
          },
        );
      },
      child: Text(
        "New",
        style: Styles.font13LightGreyRegular,
      ),
    );
  }
}
