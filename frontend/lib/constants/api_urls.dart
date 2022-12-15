class ConstantApiUrls {
  static const String _baseURL = 'http://192.168.1.3:3000';

  //AUTH
  static const String registerURL = "$_baseURL/api/register";
  static const String loginURL = "$_baseURL/api/login";
  static const String getCurrentUserURL = '$_baseURL/api/user';

  //ADMIN
  static const String addProductURL = "$_baseURL/admin/add_product";
  static const String getAllProductsURL = "$_baseURL/admin/products";
  static const String deleteSingleProductURL = "$_baseURL/admin/product";

  //USER
  //Products
  static const String getProductsByCategoryURL = "$_baseURL/products";
}
