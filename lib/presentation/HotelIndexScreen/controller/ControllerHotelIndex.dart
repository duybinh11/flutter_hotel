import 'package:book_hotel/Model/BookHotelModel.dart';
import 'package:book_hotel/core/util/UtilConst.dart';
import 'package:book_hotel/data/repository/RepositoryHotelIndex.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controllerhotelindex extends GetxController {
  final isLoading = false.obs;
  final bookedHotels = <BookHotelModel>[].obs;
  Repositoryhotelindex repositoryhotelindex = GetIt.I<Repositoryhotelindex>();
  late final SharedPreferences prefs;
  @override
  void onInit() async {
    isLoading.value = true;
    prefs = GetIt.I<SharedPreferences>();
    await getAllBookedOfHotel();
    isLoading.value = false;
    super.onInit();
  }

  Future<void> getAllBookedOfHotel() async {
    int idUser = await getIdUser();
    bookedHotels.clear();
    bookedHotels.value = await repositoryhotelindex.getAllBookedOfHotel(idUser);
  }

  Future<int> getIdUser() async {
    return prefs.getInt(UtilConst.idUser)!;
  }
}
