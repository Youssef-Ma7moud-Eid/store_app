import 'package:store_app_project/helper/api.dart';
import 'package:store_app_project/models/product_model.dart';

class GetCatagoryServices {
  Future<List<ProductModel>> getCatagoryproducts(
      {required String categoryname}) async {
    String url = 'https://fakestoreapi.com/products/category/$categoryname';
    List<dynamic> list = await Api().get(url: url);
    List<ProductModel> data = [];
    for (int i = 0; i < list.length; i++) {
      data.add(
        ProductModel.fromjson(list[i]),
      );
    }
    return data;
  }
}
