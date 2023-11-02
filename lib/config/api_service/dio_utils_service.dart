import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/helpers/api_exception_handler.dart';

class DioUtil {
  Dio? _instance;
  Dio? getInstance() {
    _instance ??= createDioInstance();
    return _instance;
  }

  Dio createDioInstance() {
    var dio = Dio();
    dio.interceptors.clear();
    return dio
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        return handler.next(options); //modify your request
      }, onResponse: (response, handler) {
        ///custom exception handling as API gives 200 in all calls
        if ((response.data as Map<String, dynamic>?)?['success'] == false) {
          throw ApiException.fromJson(response);
        }
        return handler.next(response);
      }, onError: (DioException e, handler) async {
        if (e.response != null) {
          if (e.response?.statusCode == 401) {
          } else {
            try {} catch (e) {
              e.toString();
            }
          }
        }
        if (DioExceptionType.unknown == e.type) {
          handler.reject(e);
        }

        // handler.next(e);
      }));
  }
}
