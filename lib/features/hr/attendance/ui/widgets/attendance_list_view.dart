import 'package:erp_system/features/hr/attendance/ui/widgets/attendance_list_view_item.dart';
import 'package:flutter/material.dart';

class AttendanceListView extends StatelessWidget {
  const AttendanceListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const AttendanceListViewItem();
      },
    );
  }
}
