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
  static const String getAllOrdersURL = "$_baseURL/admin/orders";
  static const String getAnalytics = "$_baseURL/admin/analytics";

  //USER
  static const String getProductsByCategoryURL = "$_baseURL/products";
  static const String getProductsSearchedForURL = "$_baseURL/products"; 
  static const String postRateProduct = "$_baseURL/products/rating";
  static const String getDealOfTheDay = "$_baseURL/products/deal_of_the_day";
  static const String postAddToCart = "$_baseURL/user/add_to_cart";
  static const String deleteFromCart = "$_baseURL/user/delete_from_cart";
  static const String postSaveNewAddress = "$_baseURL/user/address";
  static const String postSubmitOrder = "$_baseURL/user/submit_order";
  static const String getCurrentUserOrders = "$_baseURL/user/orders";
}
