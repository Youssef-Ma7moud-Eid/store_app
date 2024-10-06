import 'package:store_app_project/helper/api.dart';

class GetAllCatagoriesServices {
  Future<List<dynamic>> allCatagories() async {
    String url = 'https://fakestoreapi.com/products/categories';

    List<dynamic> data = await Api().get(url: url);

    return data;
  }
}
