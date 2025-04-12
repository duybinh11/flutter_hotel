import 'package:book_hotel/Model/BookHotelModel.dart';
import 'package:book_hotel/Model/RequestBookHotelModel.dart';
import 'package:book_hotel/data/domain/EndpointCustomer.dart';
import 'package:dio/dio.dart';

class Repositoryuserdetailbooked {
  final Dio dio;

  Repositoryuserdetailbooked({
    required this.dio,
  });

  Future<void> updateStatusBooked(int idBooked, String status,
      {required Function(BookHotelModel data) success,
      required Function() e}) async {
    Response response = await dio
        .put("${Endpointcustomer.updateStatusBooked}/$idBooked/$status");
    if (response.statusCode == 200) {
      final data = BookHotelModel.fromMap(response.data);
      success(data);
    } else {
      e();
    }
  }

  Future<void> updateBookedHotel(
      {required Function(BookHotelModel data) success,
      required RequestBookHotelModel data,
      required Function() e}) async {
    print(data.toJson());
    Response response =
        await dio.put(Endpointcustomer.updateStatusBooked, data: data.toJson());
    if (response.statusCode == 200) {
      final data = BookHotelModel.fromMap(response.data);
      success(data);
    } else {
      e();
    }
  }
}
