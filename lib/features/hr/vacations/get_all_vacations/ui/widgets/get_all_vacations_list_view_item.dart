import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/assets.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/core/widgets/custom_text_button.dart';
import 'package:erp_system/features/hr/vacations/get_all_vacations/data/models/get_all_vacation_model.dart';
import 'package:erp_system/features/hr/vacations/update_status_of_vacation/logic/update_status_of_vacation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GetAllVacationsListViewItem extends StatelessWidget {
  const GetAllVacationsListViewItem({
    super.key,
    required this.data,
  });

  final GetAllVacationModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsVacationView, extra: data);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: ColorsApp.primaryColor,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    AssetsData.profile,
                  ),
                ),
                title: Text(
                  data.employee!,
                  style: Styles.font14BlueSemiBold(context),
                ),
                subtitle: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: Text("${data.start} - ${data.end}",
                      style: Styles.font16DarkBlueBold(context)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: AppTextButton(
                        borderRadius: 8,
                        buttonText: "Reject",
                        backgroundColor: const Color(0xffFF7F74),
                        textStyle: Styles.font13BlueSemiBold(context),
                        onPressed: () {
                          context
                              .read<UpdateStatusOfVacationCubit>()
                              .updateVacatoin(
                                data.id.toString(),
                                2,
                              );
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () {
                              GoRouter.of(context).push(
                                AppRouter.kGetAllVacationsView,
                              );
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppTextButton(
                        borderRadius: 8,
                        buttonText: "Accept",
                        backgroundColor: const Color(0xff30BEB6),
                        textStyle: Styles.font13BlueSemiBold(context),
                        onPressed: () {
                          context
                              .read<UpdateStatusOfVacationCubit>()
                              .updateVacatoin(
                                data.id.toString(),
                                1,
                              );
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () {
                              GoRouter.of(context).push(
                                AppRouter.kGetAllVacationsView,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
