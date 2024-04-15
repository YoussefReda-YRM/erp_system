import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/hr/attendance/data/models/attendance_response.dart';
import 'package:flutter/material.dart';

class AttendanceListViewItem extends StatelessWidget {
  const AttendanceListViewItem({
    super.key,
    required this.data,
  });
  final AttendanceData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 14,
            decoration: const BoxDecoration(
              color: ColorsApp.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14),
                bottomLeft: Radius.circular(14),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor.withOpacity(0.02),
                border: Border.all(color: ColorsApp.primaryColor, width: 1),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(14),
                  bottomRight: Radius.circular(14),
                ),
              ),
              height: 80,
              child: Center(
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        data.employee!,
                        style: Styles.font18DarkBlueBold(context),
                      ),
                    ),
                  ),
                  subtitle: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.login_outlined,
                                color: Colors.green[400]),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              data.checkIn!,
                              style:
                                  Styles.font14BlueSemiBold(context).copyWith(
                                color: Colors.green[400],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                              color: Colors.red[400],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "05:00 pm",
                              style:
                                  Styles.font14BlueSemiBold(context).copyWith(
                                color: Colors.red[400],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
