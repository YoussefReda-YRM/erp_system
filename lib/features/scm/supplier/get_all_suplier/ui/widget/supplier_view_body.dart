import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/ui/widget/supplier_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupllierViewBody extends StatelessWidget {
  const SupllierViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
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
        ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kAddSupplier);
          },
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            backgroundColor: ColorsApp.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "Add",
              style: Styles.font18LightGreyBold(context).copyWith(fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }
}
