import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:flutter/material.dart';

class SupplierDetails extends StatelessWidget {
  final String? supplieraddedby;
  final String? supplierphone;
  final String? supplieremail;
  final String? suppliername;
  // final GlobalKey<ScaffoldState> scaffoldKey;

  const SupplierDetails(
      {super.key,
      required this.suppliername,
      required this.supplieremail,
      required this.supplierphone,
      required this.supplieraddedby});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            CustomAppBarApp(
              title: "Supplier details",
              iconLeading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 34,
                  color: ColorsApp.grey,
                ),
                onPressed: () {
                  const CustomBackButton();
                  // scaffoldKey.currentState!.openDrawer();
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
                                      Expanded(
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
                                      Expanded(
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
                                      Expanded(
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
                      height: 10,
                    ),
                    AppTextButton(
                      buttonText: "Edit",
                      width: MediaQuery.of(context).size.width / 2.5,
                      backgroundColor: Colors.green,
                      textStyle: Styles.font13BlueSemiBold(context),
                      onPressed: () {
                        //showEditProductDialog(context, size);
                      },
                    ),
                  ],
                ),
              ),
            )
                /* Container(
       padding: const EdgeInsets.all(20),
       margin: const EdgeInsets.all(10),

       decoration: BoxDecoration(color: ColorsApp.border,borderRadius: BorderRadius.circular(10)),
       child: Column(
         // mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Supplier Name: ${suppliername ?? "N/A"}', style: Styles.font24BlackBold(context)),
           Text('Supplier Email: ${supplieremail ?? "N/A"}', style: Styles.font24BlackBold(context)),
           Text('Supplier Phone: ${supplierphone ?? "N/A"}', style: Styles.font24BlackBold(context)),
           Text('Supplier Added By: ${supplieraddedby ?? "N/A"}', style: Styles.font24BlackBold(context)),
         ],
       ) ,

     ),*/
                )
          ],
        ));
  }
}
