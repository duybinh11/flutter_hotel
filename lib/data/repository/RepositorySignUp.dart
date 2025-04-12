import 'dart:ffi';

import 'package:book_hotel/Model/CustomerModel.dart';
import 'package:book_hotel/data/domain/EndpointCustomer.dart';
import 'package:dio/dio.dart';

class Repositorysignup {
  final Dio dio;

  Repositorysignup({
    required this.dio,
  });

  Future<void> signUp(
      {required CustomerModel data,
      required Function() success,
      required Function(String? e) error}) async {
    print(data.toJson());
    try {
      Response response =
          await dio.post(Endpointcustomer.signUp, data: data.toJson());
      if (response.statusCode == 200) {
        success();
      }
    } on DioException catch (e) {
      error("loi");
    }
  }
}
