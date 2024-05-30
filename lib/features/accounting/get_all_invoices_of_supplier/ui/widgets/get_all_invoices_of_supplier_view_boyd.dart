import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/accounting/get_all_invoices_of_supplier/ui/widgets/get_all_invoices_of_supplier_list_view.dart';
import 'package:flutter/material.dart';

class GetAllInvoicesOfSupplierViewBody extends StatelessWidget {
  const GetAllInvoicesOfSupplierViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBarApp(
          title: 'All Invoices',
          iconLeading: CustomBackButton(),
        ),
        Expanded(
          child: CustomAppBody(
              child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                GetAllInvoicesOfSupplierListView(),
              ],
            ),
          )),
        )
      ],
    );
  }
}
