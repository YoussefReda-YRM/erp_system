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
  TextEditingController productInComingController = TextEditingController();
  TextEditingController productOutGoingController = TextEditingController();
  TextEditingController productSellPriceController = TextEditingController();
  TextEditingController productCostPriceController = TextEditingController();
  TextEditingController activeOrderController = TextEditingController();
  TextEditingController addedByController = TextEditingController();
  TextEditingController subCategoryIdController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void addProduct() async {
    emit(AddProductLoading());
    final response = await _addProductRepo.addProduct(
      AddProductRequestBody(
        productName: 'newTest22', //productNameController.text,
        productOnHand: 5, //int.parse(productOnHandController.text),
        productBarcode:
            'new product', //int.parse(productBarcodeController.text),
        productInComing: 0, //int.parse(productInComingController.text),
        productOutGoing: 0, //int.parse(productOutGoingController.text),
        productSellPrice: 50, //int.parse(productSellPriceController.text),
        productCostPrice: 30, //int.parse(productCostPriceController.text),
        activeOrder: 0, //int.parse(activeOrderController.text),
        addedBy:
            'ea930fe1-75b8-431d-9810-85b25c8b9ca1', //addedByController.text,
        subCategoryId: 21, // int.parse(subCategoryIdController.text),
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
