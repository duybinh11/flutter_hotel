import 'dart:io';

import 'package:book_hotel/Model/HotelModel.dart';
import 'package:book_hotel/core/util/util_message_api.dart';
import 'package:book_hotel/data/domain/EndpointHotel.dart';
import 'package:dio/dio.dart';

class Repositoryhotelsignup {
  final Dio dio;
  Repositoryhotelsignup({required this.dio});

  Future<void> signUp(
      {required HotelModel hotel,
      required Function() success,
      required Function(String? e) error}) async {
    try {
      print(hotel.toJson());
      Response response =
          await dio.post(Endpointhotel.signUp, data: hotel.toJson());
      print(response);
      if (response.statusCode == 200) {
        success();
      }
    } on DioException catch (e) {
      print(e);
      if (e.response?.statusCode == 400) {
        String? messageError = UtilMessageApi.getMessage(e);
        error(messageError);
      }
    }
  }

  Future<String?> uploadImage(File imageFile) async {
    String fileName = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });
    try {
      print(fileName);
      final response = await dio.post(
        Endpointhotel.uploadImg,
        data: formData,
        options: Options(headers: {
          "Content-Type": "multipart/form-data",
        }),
      );
      print(' Upload success: ${response.data}');
      if (response.statusCode == 200) {
        return response.data["img"];
      }
    } catch (e) {
      return "loi";
    }
  }
}
