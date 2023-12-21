import 'package:dio/dio.dart';

class dioHelper{

  static Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'http://api.alquran.cloud/',
        receiveDataWhenStatusError: true,
      )
    );
    print('init called');
  }

  static Future<Response>getSurah({
    String url,
})async{
    return await dio.get(
      url,
    );
  }

  static Future<Response>getAyat({
  String url,
})async{
    return await dio.get(
      url
    );
  }

}