import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/cubit_status.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/services/get_all_product_services.dart';

class GetstoreCubit extends Cubit<Allstatus> {
  GetstoreCubit() : super(Storestatefailure());
  List<ProductModel> model = [];
  Set<ProductModel> set = {};
  // ProductModel? model;
  // Future<void> getweather({required String city}) async {
  //   try {
  //     model = await WeatherServices().getcurweather(catagory: city);
  //     emit(WeatherstateSucsses());
  //   } on Exception catch (e) {
  //     emit(NoWeatherstate());
  //   }
  // }
  IconData getshapeicon(Dataicon) {
    late var icon;
    if (Dataicon == Icons.favorite_border) {
      icon = Icons.favorite;
      emit(Iconred());
    } else {
      icon = Icons.favorite_border;
      emit(Iconwhite());
    }
    return icon;
  }

  Future<void> getallproduct() async {
    try {
      model = await GetAllProductServices().getallproducts();
      emit(StorestateSucsses());
    } on Exception catch (e) {
      emit(Storestatefailure());
    }
  }

  Set<ProductModel> addproductincart({required ProductModel model}) {
    set.add(model);

    emit(Productset());

    return set;
  }

  void removeproductincart({required ProductModel model}) {
    set.remove(model);

    emit(Productset());
  }
}
