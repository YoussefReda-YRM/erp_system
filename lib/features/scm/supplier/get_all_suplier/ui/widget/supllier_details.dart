import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupplierDetails extends StatelessWidget {
  final String? supplieraddedby;
  final String? supplierphone;
  final String? supplieremail;
  final String? suppliername;
  final int? id;
  // final GlobalKey<ScaffoldState> scaffoldKey;

  const SupplierDetails(
      {super.key,
      required this.suppliername,
      required this.supplieremail,
      required this.supplierphone,
      required this.supplieraddedby,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBarApp(
              title: 'Supplier Details',
              iconLeading: CustomBackButton(),
            ),
            CustomAppBody(
                child: Padding(
              padding: const EdgeInsets.only(top: 10),
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
                                horizontal: 20, vertical: 20),
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
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        suppliername ?? "none",
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
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        supplieremail ?? "none",
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
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        supplierphone ?? "none",
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
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        supplieraddedby ?? "none",
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
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  userRole == "HREmployee" || userRole == "HRAdmin" ? AppTextButton(
                    buttonText: 'Edit',
                    textStyle: Styles.font16LightGreyMedium(context),
                    backgroundColor: ColorsApp.primaryColor,
                    onPressed: () {
                      supplierNameControllerInGetIt = suppliername ?? "none";
                      supplierEmailControllerInGetIt =
                          supplieremail ?? "none";
                      supplierPhoneControllerInGetIt =
                          supplierphone ?? "none";
              
                      GoRouter.of(context)
                          .push(AppRouter.kUpdateSupplier, extra: {"id": id});
                      //showEditProductDialog(context, size);
                    },
                  ): const SizedBox(),
                ],
              ),
            ))
          ],
        ));
  }
}
