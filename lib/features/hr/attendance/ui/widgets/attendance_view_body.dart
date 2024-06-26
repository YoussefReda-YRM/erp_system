import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_app_bar_app.dart';
import 'package:erp_system/core/widgets/custom_app_body.dart';
import 'package:erp_system/features/hr/attendance/ui/widgets/attendance_list_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceViewBody extends StatelessWidget {
  const AttendanceViewBody({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarApp(
          scaffoldKey: scaffoldKey,
          title: "Attendance",
          iconLeading: IconButton(
            icon: const Icon(
              Icons.menu,
              size: 34,
              color: ColorsApp.lightGrey,
            ),
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
        ),
        Expanded(
          child: CustomAppBody(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            Text(
                              "Today Attendance",
                              style: Styles.font18DarkBlueBold(context),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              "(${getFormattedDate()})",
                              style: Styles.font18DarkBlueBold(context),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Expanded(
                        child: AttendanceListView(),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 55,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

String getFormattedDate() {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('dd-MM-yyyy').format(now);
  return formattedDate;
}
