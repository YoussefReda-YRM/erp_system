import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/accounting/get_all_supplier/widgets/accounting_popup_menu_button.dart';
import 'package:flutter/material.dart';

class SupplierDetailsAccounting extends StatelessWidget {
  final String? supplierAddedBy;
  final String? supplierPhone;
  final String? supplierEmail;
  final String? supplierName;
  final int? id;
  // final GlobalKey<ScaffoldState> scaffoldKey;

  const SupplierDetailsAccounting(
      {super.key,
      required this.supplierName,
      required this.supplierEmail,
      required this.supplierPhone,
      required this.supplierAddedBy,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBarApp(
              title: 'Supplier Details',
              iconLeading: const CustomBackButton(),
              iconTrailing:
                  userRole == "SuperAdmin" || userRole == "AccountingEmployee"
                      ? AccountingPopupMenuButton(
                          supplierId: id!,
                        )
                      : const SizedBox(),
            ),
            CustomAppBody(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: ColorsApp.primaryColor),
                      ),
                      color: Colors.white,
                      child: SizedBox(
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Supplier Name: ",
                                        style:
                                            Styles.font13BlueSemiBold(context),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        child: Text(
                                          supplierName ?? "none",
                                          style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Supplier Email: ",
                                        style:
                                            Styles.font13BlueSemiBold(context),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        child: Text(
                                          supplierEmail ?? "none",
                                          style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Supplier Phone: ",
                                        style:
                                            Styles.font13BlueSemiBold(context),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        child: Text(
                                          supplierPhone ?? "none",
                                          style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Added By: ",
                                        style:
                                            Styles.font13BlueSemiBold(context),
                                      ),
                                      const Spacer(),
                                      Expanded(
                                        child: Text(
                                          supplierAddedBy ?? "none",
                                          style:
                                              Styles.font13BlueSemiBold(context)
                                                  .copyWith(color: Colors.pink),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ));
  }
}
