import 'package:erp_system/core/dependency_injection/service_locator.dart';
import 'package:erp_system/core/utils/app_router.dart';
import 'package:erp_system/core/utils/colors_app.dart';
import 'package:erp_system/core/utils/styles.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_state.dart';
import 'package:erp_system/features/inventory/category/get_all_category/ui/widgets/build_taps.dart';
import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_circular_progress_indicator.dart';
import 'package:erp_system/features/inventory/product/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CategoryListViewBody extends StatelessWidget {
  const CategoryListViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsApp.primaryColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          border: Border.all(width: 0, color: Colors.transparent),
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
          ),
        ),
        child: Column(
          children: [
            // const CategorySearchWidget(),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return const Expanded(
                    child: CustomCircularProgressIndicator(),
                  );
                } else if (state is CategorySuccess &&
                    state.categories.isNotEmpty) {
                  listOfCategoryIsEmpty = false;
                  return Expanded(
                      child: BuildTaps(
                    categories: state.categories,
                    firstParentId: state.categories[0].parentCategoryId!,
                  ));
                } else if (state is CategoryFailure) {
                  return Expanded(child: CustomErrorWidget(error: state.error.toString()));
                } else {
                  listOfCategoryIsEmpty = true;
                  return Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "There is no parent category.\n Create a new category now",
                            style: Styles.font18LightGreyBold(context),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              GoRouter.of(context)
                                  .push(AppRouter.kAddParentCategory);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  GoRouter.of(context)
                                      .push(AppRouter.kAddParentCategory);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "create",
                                    style: Styles.font18DarkBlueBold(context)
                                        .copyWith(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
