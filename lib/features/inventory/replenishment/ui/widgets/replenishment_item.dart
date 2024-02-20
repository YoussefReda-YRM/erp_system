import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReplenishmentItem extends StatelessWidget {
  const ReplenishmentItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xffF7F8F9),
      child: ListTile(
        title: Text(
          "T-shirt",
          style: Styles.font18DarkBlueBold(context),
        ),
        subtitle: Text(
          "Clothes",
          style: Styles.font10BlueSemiBold(context).copyWith(
            color: const Color(0xff9E9E9E),
          ),
        ),
        trailing: SizedBox(
          width: 127,
          child: ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kReorderView);
            },
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              backgroundColor: const Color(0xff51CC5D),
            ),
            child: Text(
              "Reorder",
              style: Styles.font16LightGreyMedium(context).copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
