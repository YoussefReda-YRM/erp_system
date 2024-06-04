import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountingPopupMenuButton extends StatelessWidget {
  const AccountingPopupMenuButton({
    super.key,
    required this.supplierId,
  });

  final int supplierId;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      icon: const Icon(
        size: 34,
        Icons.more_vert_outlined,
        color: ColorsApp.lightGrey, // Change the color here
      ),
      onSelected: (value) {
        GoRouter.of(context).push(
          AppRouter.kGetAllInvoicesOfSupplier,
          extra: supplierId,
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'Get All Invoices',
          child: ListTile(
            leading: const Icon(
              Icons.receipt,
              color: ColorsApp.primaryColor,
            ),
            title: Text(
              'Get All Invoices',
              style: Styles.font14BlueSemiBold(context),
            ),
          ),
        ),
      ],
    );
  }
}
