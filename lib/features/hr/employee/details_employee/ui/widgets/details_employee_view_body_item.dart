import 'package:erp_system/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DetailsEmployeeViewBodyItem extends StatelessWidget {
  const DetailsEmployeeViewBodyItem({
    super.key,
    required this.title,
    required this.titleData,
  });
  final String title, titleData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              title,
              style: Styles.font13BlueSemiBold(context),
            )),
        Expanded(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              titleData,
              style: Styles.font13BlueSemiBold(context)
                  .copyWith(color: Colors.pink),
            ),
          ),
        ),
      ],
    );
  }
}
