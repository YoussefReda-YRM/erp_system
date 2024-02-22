import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_list_view.dart';
import 'package:flutter/material.dart';

class SupllierViewBody extends StatelessWidget {
  const SupllierViewBody({super.key,required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarProduct(
          scaffoldKey: scaffoldKey,
          title: "Supplier",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          iconTrailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
          ),
        ),
        const Expanded(child: SupplierListView()),
      ],
    );
  }
}
