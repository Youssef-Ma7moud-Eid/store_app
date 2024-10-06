import 'package:store_app_project/helper/api.dart';
import 'package:store_app_project/models/product_model.dart';

class GetAllProductServices {
  Future<List<ProductModel>> getallproducts() async {
    List<dynamic> list =
        await Api().get(url: 'https://fakestoreapi.com/products');
    List<ProductModel> data = [];
    for (int i = 0; i < list.length; i++) {
      data.add(
        ProductModel.fromjson(list[i]),
      );
    }
    return data;
  }
}
