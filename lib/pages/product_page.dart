import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/services/update_product_services.dart';
import 'package:store_app_project/widgets/buttom_widget.dart';
import 'package:store_app_project/widgets/text_field.dart';

class ProductPage extends StatefulWidget {
  ProductPage({super.key});
  static String product_id = "Product_page";
  bool call = false;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? productname, description, image, price;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: widget.call,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(mainAxisSize: MainAxisSize.min, children: [
            Text(
              'Update ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'product',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ]),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFieldWidget(
                  hinttext: 'Product Name',
                  obscureText: false,
                  onchanged: (data) {
                    productname = data;
                  },
                  input: null,
                ),
                TextFieldWidget(
                  hinttext: 'description',
                  obscureText: false,
                  onchanged: (data) {
                    description = data;
                  },
                  input: null,
                ),
                TextFieldWidget(
                  hinttext: 'price',
                  obscureText: false,
                  onchanged: (data) {
                    price = data;
                  },
                  input: TextInputType.number,
                ),
                TextFieldWidget(
                  hinttext: 'image',
                  obscureText: false,
                  onchanged: (data) {
                    image = data;
                  },
                  input: null,
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtomWidget(
                  buttomtext: 'Update',
                  onTap: () async {
                    setState(() {
                      widget.call = true;
                    });
                    await updateProduct(product);
                    try {
                      print('sucsses');
                    } on Exception catch (e) {
                      print(e.toString());
                    }
                    setState(() {
                      widget.call = false;
                    });
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productname == null ? product.title : productname!,
      price: price == null ? product.price.toString() : price!,
      desc: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.catagory,
      id: product.id,
    );
  }
}
