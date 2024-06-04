import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/scm/supplier/get_all_suplier/data/models/GetAllSupplierResponse.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SupplierListViewBody extends StatelessWidget {
  SupplierListViewBody(this.response, {super.key});
  GetAllSupplierResponse response = GetAllSupplierResponse();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: response.data?.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kSupplierDetails,
                extra: {
                  "supplierName": response.data![index].supplierName,
                  "supplierEmail": response.data![index].supplierEmail,
                  "supplierPhone": response.data![index].supplierPhone,
                  "addedBy": response.data![index].addedBy,
                  "id": response.data![index].id,
                },
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side:
                    const BorderSide(color: ColorsApp.primaryColor, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                    leading: const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage(
                        AssetsData.profile,
                      ),
                    ),
                    title: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        response.data![index].supplierName!,
                        style: Styles.font18DarkBlueBold(context),
                      ),
                    ),
                    subtitle: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        response.data![index].supplierEmail!,
                        style: Styles.font14BlueSemiBold(context),
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.pink,)),
              ),
            ),
          );
        });
  }
}
