import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/features/inventory/product/add_product/data/models/add_product_request_body.dart';
import 'package:erp_system/features/inventory/product/add_product/data/repos/add_product_repo.dart';
import 'package:erp_system/features/inventory/product/add_product/logic/add_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductRepo _addProductRepo;
  AddProductCubit(this._addProductRepo) : super(AddProductInitial());

  TextEditingController productNameController = TextEditingController();
  TextEditingController productOnHandController = TextEditingController();
  TextEditingController productBarcodeController = TextEditingController();
  TextEditingController productSellPriceController = TextEditingController();
  TextEditingController productCostPriceController = TextEditingController();
  TextEditingController activeOrderController = TextEditingController();
  TextEditingController subCategoryIdController = TextEditingController();
  TextEditingController productMinquantityController = TextEditingController();

    TextEditingController subCategoryNameController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addProduct() async {
    emit(AddProductLoading());
    final response = await _addProductRepo.addProduct(
      AddProductRequestBody(
        productName: productNameController.text,
        productOnHand: int.parse(productOnHandController.text),
        productBarcode:
            'new product', //int.parse(productBarcodeController.text),
        productSellPrice: double.parse(productSellPriceController.text),
        productCostPrice: double.parse(productCostPriceController.text),
        activeOrder: 0, //int.parse(activeOrderController.text),
        addedBy: userId,
        subCategoryId: int.parse(subCategoryIdController.text),
        productMinquantity: int.parse(productMinquantityController.text),
      ),
    );

    response.when(
      success: (addProductResponse) {
        emit(AddProductSuccess(addProductResponse));
      },
      failure: (error) {
        emit(AddProductFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
