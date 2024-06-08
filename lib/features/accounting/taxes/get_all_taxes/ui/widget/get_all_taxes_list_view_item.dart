import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/accounting/taxes/get_all_taxes/data/models/GetAllTaxesModel.dart';
import 'package:flutter/material.dart';

class GetAllTaxesListViewItem extends StatelessWidget {
  const GetAllTaxesListViewItem({super.key, required this.data});
  final GetAllTaxesModel data;

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Tax Name: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.taxName.toString(),
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
                        "Tax Value: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.taxValue.toString(),
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
                        "Tax Type: ",
                        style: Styles.font13BlueSemiBold(context),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          data.taxType.toString(),
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
