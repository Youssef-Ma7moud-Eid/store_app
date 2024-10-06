import 'package:store_app_project/helper/api.dart';
import 'package:store_app_project/models/product_model.dart';

class AddProductServices {
  Future<ProductModel> addproduct({
    required String description,
    required int id,
    required String title,
    required double price,
    required String image,
  }) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://fakestoreapi.com/products',
      body: {
        'title': title,
        'description': description,
        'id': id,
        'image': image,
        'price': price,
      },
    );

    return ProductModel.fromjson(data);
  }
}
