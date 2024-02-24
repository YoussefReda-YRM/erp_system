import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/core/widgets/custom_back_button.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupplierDetails extends StatelessWidget {
  final String? supplieraddedby;
  final String? supplierphone;
  final String? supplieremail;
  final String? suppliername;
 // final GlobalKey<ScaffoldState> scaffoldKey;

  SupplierDetails({required this.suppliername,required this.supplieremail,required this.supplierphone,required this.supplieraddedby});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Column(children: [
        CustomAppBarProduct(

          title: "Supplier details",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 34,
              color: ColorsApp.grey,
            ),
            onPressed: () {
             CustomBackButton();
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
     CustomAppBody(child:
     Container(
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

     ),
     )
      ],)


    );

  }
}
