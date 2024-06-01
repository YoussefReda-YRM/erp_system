import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/orders/scm_order/get_all_scm_order/data/models/GetAllScmOrdersModel.dart';
import 'package:flutter/material.dart';

class GetAllScmOrderListViewItem extends StatelessWidget {
  GetAllScmOrderListViewItem({super.key, required this.data,required this.index});
  final GetAllScmOrdersModel data;
  int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: ColorsApp.primaryColor),
      ),
      color: Colors.white,
      child: SizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Product Name: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(data.scmOrderProducts![index].productName.toString(),
                        //  scmOrderProducts![1].productName.toString(),
                          style: Styles.font13BlueSemiBold(context)
                              .copyWith(color: Colors.pink),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Quantity Of Order: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.scmOrderProducts![index].quantity.toString(),
                          style: Styles.font13BlueSemiBold(context)
                              .copyWith(color: Colors.pink),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Reference: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.reference.toString(),
                          style: Styles.font13BlueSemiBold(context)
                              .copyWith(color: Colors.pink),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
