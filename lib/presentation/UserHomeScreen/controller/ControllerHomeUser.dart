import 'dart:convert';

import 'package:book_hotel/Model/HotelModel.dart';
import 'package:book_hotel/Model/ProvinceVn.dart';
import 'package:book_hotel/data/repository/RepositoryIndexUser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class Controllerhomeuser extends GetxController {
  Repositoryindexuser repositoryindexuser = GetIt.I<Repositoryindexuser>();
  final hotels = <HotelModel>[].obs;
  final isLoading = false.obs;
  final isLoadingSearch = false.obs;
  final provinces = <ProvinceVn>[].obs;

  ProvinceVn? selectProvince;
  final nameHotel = TextEditingController();

  final pathData = 'assets/data/ProvinceData.json';

  @override
  void onInit() {
    isLoading.value = true;
    getHotels();
    getProvinces();
    isLoading.value = false;
    super.onInit();
  }

  void getHotels() async {
    hotels.clear();
    hotels.value = await repositoryindexuser.getAllHotel();
  }

  void getProvinces() async {
    String jsonString = await rootBundle.loadString(pathData);
    Map<String, dynamic> mapData = jsonDecode(jsonString);
    List<dynamic> listData = mapData['province'];
    provinces.clear();
    provinces.value = listData.map((e) => ProvinceVn.fromMap(e)).toList();
  }

  void seacherHotel() async {
    if (selectProvince == null && nameHotel.text == "") {
      return;
    }
    isLoadingSearch.value = true;
    hotels.clear();
    hotels.value =
        await repositoryindexuser.searchHotel(selectProvince, nameHotel.text);
    isLoadingSearch.value = false;
  }
}
