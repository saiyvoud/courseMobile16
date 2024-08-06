const baseUrl = "https://node-server-api-q7vr.onrender.com/api/v1";

class ApiPath {
  static String login = "${baseUrl}/user/login";
  static String register = "${baseUrl}/user/register";
  static String updateProfile = "${baseUrl}/user/updateProfile";
  static String chanagePassword = "${baseUrl}/user/changePassword";
  static String updateProfileImage = "${baseUrl}/user/updatedProfileImage";
  static String refreshToken = "${baseUrl}/user/refreshToken";
  //------------ banner --------
  static String getBanner = "${baseUrl}/banner/getAll";
  //------------ category --------
  static String getCategory = "${baseUrl}/category/getAll";
  static String getOneCategory = "${baseUrl}/category/getOne/";
  //------------ product --------
  static String getProduct = "${baseUrl}/product/getAll";
  static String getProductBy = "${baseUrl}/product/getByCategory/";
  // --------- address -----
  static String addAddress = "${baseUrl}/address/insert";
  static String getAllAddress = "${baseUrl}/address/getAll";
  static String getOneAddress = "${baseUrl}/address/getOne/";
  static String getAddressByUser = "${baseUrl}/address/getByUser";
  // -------- payment ------
  static String payment = "${baseUrl}/payment/insert";
  static String addOrder = "${baseUrl}/order/insert";
  static String getOrder = "${baseUrl}/order/getAll";
 // static String getOrder = "${baseUrl}/order/getAll";
  static String getOneOrder = "${baseUrl}/order/getOne/";
  static String getOrderByStatusAwait = "${baseUrl}/order/getOrderStatusAwait/";
  static String getOrderByStatusPadding = "${baseUrl}/order/getOrderStatusPadding/";
  static String getOrderByStatusSuccess = "${baseUrl}/order/getOrderStatusSuccess/";
}
