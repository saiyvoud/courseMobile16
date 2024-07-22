const baseUrl = "https://node-server-api-q7vr.onrender.com/api/v1";

class ApiPath {
  static String login = "${baseUrl}/user/login";
  static String register = "${baseUrl}/user/register";
  //------------ banner --------
  static String getBanner = "${baseUrl}/banner/getAll";
  //------------ category --------
  static String getCategory = "${baseUrl}/category/getAll";
  static String getOneCategory = "${baseUrl}/category/getOne/";
  //------------ product --------
  static String getProduct = "${baseUrl}/product/getAll";
  static String getProductBy = "${baseUrl}/product/getByCategory/";
}
