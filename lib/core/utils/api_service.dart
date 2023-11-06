import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static const String baseUrl = "https://student.valuxapps.com/api/";

  static Dio dio = Dio(BaseOptions(headers: {'Content-Type':'application/json'}));

  static Future<Response>getData({
    Map<String,dynamic>? query,
    required String endpoint,
    String lang = "en",
    // String? token = "5huzQ1kfKpa6H7k6y1z35VGGp8D7XwwytQWxnuWCggjZGAPTMfYLkYVGGbVqXYYeFE3JtN",
  }
  )
  async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : prefs.getString("token")
    };
    return await dio.get(
        "${DioHelper.baseUrl}$endpoint",
        queryParameters: query);
  }
  static Future<Response>postData({
    required Map<String,dynamic> data,
    required String endpoint,
    String lang = "en",
    String? token = " ",
  })async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers = {
      'lang' : lang,
      'Authorization' : prefs.getString("token")
    };
    return await dio.post("${DioHelper.baseUrl}$endpoint", data : data);
  }
}