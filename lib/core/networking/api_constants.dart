class ApiConstants {
  static const String apiBaseUrl =
      "http://yahya2002-001-site1.anytempurl.com/api";
  static const String login = "/Auth/Login";
  static const String signup = "/Auth/register";
  static const String getAllProducts = "/Product/AllProducts";
  static const String getAllCategories = "/Category";
  static const String deleteSubcategory = "/Category/SubCategory/{subCategoryId}";
  static const String createParent = "/Category/ParentCategory";
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
