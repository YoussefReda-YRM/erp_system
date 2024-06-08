import 'package:erp_system/core/helpers/contstatnts.dart';
import 'package:erp_system/features/inventory/product/update_product/data/models/update_product_request_body.dart';
import 'package:erp_system/features/inventory/product/update_product/data/repos/update_product_repo.dart';
import 'package:erp_system/features/inventory/product/update_product/logic/update_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProductCubit extends Cubit<UpdateProductState> {
  final UpdateProductRepo _updateProductRepo;
  UpdateProductCubit(this._updateProductRepo) : super(UpdateProductInitial());

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

  void updateProduct(int productId) async {
    emit(UpdateProductLoading());
    final response = await _updateProductRepo.updateProduct(
      UpdateProductRequestBody(
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
      productId,
    );

    response.when(
      success: (updateProductResponse) {
        emit(UpdateProductSuccess(updateProductResponse));
      },
      failure: (error) {
        emit(UpdateProductFailure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
