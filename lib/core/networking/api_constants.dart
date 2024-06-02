class ApiConstants {
  static const String apiBaseUrl = "http://erp-gp.runasp.net/api";
  static const String login = "/Auth/Login";
  static const String signup = "/Auth/register";

  // product
  static const String getNumberOfProductsAndReplenishment =
      '/Product/ProductsAndReplenishmentNumbers';
  static const String getAllProducts = "/Product/AllProducts";
  static const String addProduct = "/Product/CreateProduct";
  static const String getProductById = "/Product";
  static const String updateProduct = "/Product/{productId}";

  static const String stockOutProduct = "/Product/StockOutProduct";

  static const String reOrder = "/order";

  //category
  static const String getAllCategories = "/Category";
  static const String deleteSubcategory =
      "/Category/SubCategory/{subCategoryId}";
  static const String deleteParentcategory =
      "/Category/ParentCategory/{parentCategoryId}";
  static const String createParent = "/Category/ParentCategory";
  static const String createsub = "/Category/SubCategory";
  static const String updateSubcategory =
      "/Category/SubCategory/{subCategoryId}";
  static const String updateParentcategory =
      "/Category/ParentCategory/{parentCategoryId}";

  static const String getAllSupCategory = '/Category/subCategories';

  //Supplier
  static const String getAllSuppliers = "/Supplier";
  static const String addSuppliers = "/Supplier";
  static const String updateSuppliers = "/Supplier/{id}";

  //Orders
  static const String getNumberofInventoryAndScmOrder = '/Order/OrdersNumber';
  static const String getAllInventoryOrder = '/Order/AllInventoryOrders';
  static const String getSpecificInventoryOrder = "/Order/InventoryOrder";
  static const String updateOrder = "/order/{orderId}";
  static const String getAllScmOrders = '/ScmOrder';

  //HR
  static const String addEmployee = "/Auth/register";
  static const String getAllEmployees = "/Employee";
  static const String getAllRoles = "/Employee/roles";
  static const String getSpecificEmployee = "/Employee";
  static const String deleteEmployee = "/Employee";
  static const String updateEmployee = "/Auth";

  //Departments
  static const String getAllDepartments = "/Department/GetAllDepartment";
  static const String addDepartment = "/Department";
  static const String updateDepartment = "/Department/{id}";
  static const String deleteDepartment = "/Department/{id}";

  //attendance
  static const String getAllAttendance = "/Employee/GetAllAttends";

  //vacations
  static const String getAllVacations = "/Vacation";
  static const String applyVacation = "/Vacation";
  static const String getAllVacationOfSpecificEmployee =
      "/Vacation/GetVacationsOfEmployee";
  static const String updateVacation = "/Vacation/{id}";
  static const String deleteVacation = "/Vacation/{id}";
  static const String updateStatusOfVacation = "/Vacation/status/{id}";

  //job position
  static const String getAllJobPosition = "/JobPositions/{departmentId}";
  static const String createJobPosition = "/JobPositions";
  static const String updateJobPosition = "/JobPositions/{id}";
  static const String deleteJobPosition = "/JobPositions/{id}";

  //permission
  static const String getAllPermission = "/Permission";
  static const String getAllPermissionOfSpecificEmployee =
      "/Permission/GetPermissionsOfEmployee";
  static const String addPermission = "/permission";
  static const String updatePermission = "/permission/{id}";
  static const String deletePermission = "/permission/{id}";
  static const String updateStatusOfPermission = "/permission/status/{id}";

  //Accounting
  //taxes
  static const String getAllTaxes = "/accounting/AllTaxes";
  static const String addTaxes = "/accounting/AddTax";
  static const String getAllInvoicesOfSupplier =
      "/accounting/AllInvoicesOfSupplier/{supplierId}";
  static const String registerPayment = "/accounting/RegisterPayment";
  static const String getAllInvoices = "/Accounting/AllInvoices";
  static const String getAllAccountingEmployee = '/Employee/accounting';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "nknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loadingMessage";
  static const String retryAgainMessage = "retryAgainMessage";
  static const String ok = "ok";
}
