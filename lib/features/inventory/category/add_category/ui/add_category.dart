// import 'package:erp_system/core/dependency_injection/service_locator.dart';
// import 'package:erp_system/core/utils/app_router.dart';
// import 'package:erp_system/core/utils/colors_app.dart';
// import 'package:erp_system/core/utils/functions/custom_loading_indecator.dart';
// import 'package:erp_system/core/utils/functions/setup_error_state.dart';
// import 'package:erp_system/core/utils/styles.dart';
// import 'package:erp_system/core/widgets/custom_back_button.dart';
// import 'package:erp_system/core/widgets/custom_text_button.dart';
// import 'package:erp_system/core/widgets/custom_text_form_field.dart';
// import 'package:erp_system/features/inventory/category/add_category/logic/add_parent_category_cubit.dart';
// import 'package:erp_system/features/inventory/category/delete_category/logic/categorystate.dart';
// import 'package:erp_system/features/inventory/category/get_all_category/data/models/get_all_category_model.dart';
// import 'package:erp_system/features/inventory/category/add_category/logic/add_sub_category_cubit.dart';
// import 'package:erp_system/features/inventory/category/get_all_category/logic/get_category_cubit.dart';
// import 'package:erp_system/features/inventory/product/widgets/custom_app_bar_product.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// String bearerToken =
//     "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJ0ZXN0MjEiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJ0ZXN0MjFAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiSFIiLCJleHAiOjE3MDg3Njk3MjgsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcwNjkiLCJhdWQiOiJNeVNlY3VyZWRBUElVc2VycyJ9.osVgUgjh04hkH9lhD-28V5BvaK4fFr9bWoffN7GubFk";

// class AddCategory extends StatefulWidget {
//   final bool isParent;

//   const AddCategory({Key? key, required this.isParent}) : super(key: key);

//   @override
//   State<AddCategory> createState() => _AddCategoryState();
// }

// class _AddCategoryState extends State<AddCategory> {
//   CategoryAllCategoryModel? selectedCategory;

//   @override
//   /*void initState() {
//     super.initState();
//     final viewmodel = BlocProvider.of<CategoryCubit>(context);
//     viewmodel.getAllCategories(bearerToken);
//   }*/

//   Widget build(BuildContext context) {
//     // AddParentCategoryCubit viewmodel = getIt<AddParentCategoryCubit>();
//     // AddSubCategoryCubit viewmode = getIt<AddSubCategoryCubit>();

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           CustomAppBarProduct(
//             title: widget.isParent ? 'Add parentCategory' : 'Add Sub Category',
//             iconLeading: const CustomBackButton(),
//             iconTrailing: IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.more_vert_outlined,
//                 size: 34,
//                 color: ColorsApp.lightGrey,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Form(
//             //key: widget.isParent ? viewmodel.formKey : viewmode.formKey,
//             child: Column(
//               children: [
//                 AppTextFormField(
//                   // controller: widget.isParent
//                   //     ? viewmodel.parentCategoryNameController
//                   //     : viewmode.subCategoryNameController,
//                   hintText: widget.isParent
//                       ? 'parentcategory Name'
//                       : 'subCategory Name',
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: const BorderSide(
//                       color: ColorsApp.primaryColor,
//                       width: 1.3,
//                     ),
//                     borderRadius: BorderRadius.circular(16.0),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return widget.isParent
//                           ? 'Please enter a parentcategory name'
//                           : 'Please enter a subtcategory name';
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           //showDropdownSheet(context);
//           // Add a button to trigger the dropdown sheet
//           ElevatedButton(
//             onPressed: () {
//               showDropdownSheet(context);
//             },
//             child: const Text('Show Dropdown'),
//           ),

//           // DropdownButton code
//           /*   DropdownButton<String>(
//                 items: categories
//                     .map((category) => DropdownMenuItem(
//                   value: category.parentCategoryName ?? '',
//                   child: Text(category.parentCategoryName ?? ''),
//                 ))
//                     .toList(),
//                 onChanged: (String? value) {
//                   // Handle the selected category
//                   setState(() {
//                     selectedCategory = categories.firstWhere(
//                           (category) =>
//                       category.parentCategoryName == value,
//                       orElse: () => CategoryDm(), // Handle the case when no matching category is found
//                     );
//                   });
//                   print('Selected Category: $value');
//                 },
//               ),*/

//           const SizedBox(
//             height: 50,
//           ),
//           AppTextButton(
//               buttonText: 'Create',
//               textStyle: Styles.font16LightGreyMedium(context),
//               backgroundColor: ColorsApp.primaryColor,
//               onPressed: () async {
//                 if (widget.isParent == true) {
//                   final addParentCategoryCubit =
//                       getIt.get<AddParentCategoryCubit>();

//                   // Add the parent category
//                   addParentCategoryCubit.addparentcategory();

//                   // Wait for the operation to complete
//                   await addParentCategoryCubit.close();
//                 } else if (widget.isParent == false) {
//                   final addSubCategoryCubit = getIt.get<AddSubCategoryCubit>();

//                   // Add the parent category
//                   addSubCategoryCubit.addsubcategory(
//                       bearerToken, selectedCategory!.parentCategoryId!);

//                   // Wait for the operation to complete
//                 }
//                 // Refresh categories in CategoryCubit
//                 final categoryCubit = getIt.get<CategoryCubit>();
//                 categoryCubit.getAllCategories(bearerToken);

//                 // Navigate back to CategoryViewPage
//                 // Navigator.pushReplacement(
//                 //   context,
//                 //   MaterialPageRoute(builder: (context) => CategoryView()),
//                 // );
//                 GoRouter.of(context).pushReplacement(AppRouter.kCategoryView);
//               }),
//         ],
//       ),
//     );
//   }

//   void showDropdownSheet(BuildContext context) async {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         // return BlocBuilder<CategoryCubit, CategoryState>(
//         //   builder: (context, state) {
//         //     if (state is CategorySuccess) {
//         //       List<CategoryAllCategoryModel> categories = state.categories;

//         //       // Convert the DropdownMenuItem list to the correct type
//         //       List<DropdownMenuItem<CategoryAllCategoryModel>> dropdownItems =
//         //           categories
//         //               .map((category) => DropdownMenuItem(
//         //                     value: category,
//         //                     child: Text(category.parentCategoryName ?? ''),
//         //                   ))
//         //               .toList();

//         return Column(
//           children: [
//             const Text('Select a category:'),
//             DropdownButton<CategoryAllCategoryModel>(
//               items: [],
//               onChanged: (CategoryAllCategoryModel? category) {
//                 // Handle the selected category
//                 setState(() {
//                   selectedCategory = category;
//                 });
//                 Navigator.pop(context); // Close the dropdown sheet
//               },
//               value: selectedCategory,
//             ),
//           ],
//         );
//         // } else if (state is CategoryFailure) {
//         //   return Text('Error: ${state.error.toString()}');
//         // } else {
//         //   return const CircularProgressIndicator();
//         // }
//       },
//     );
//     //   },
//     // );
//   }
// }
