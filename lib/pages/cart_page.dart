import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/cubit_status.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/widgets/cart_widget.dart';

class CartPage extends StatelessWidget {
  static String id = "Cartpage";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetstoreCubit, Allstatus>(builder: (context, state) {
      Set<ProductModel> productsSet =
          BlocProvider.of<GetstoreCubit>(context).set;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'My Cart',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: productsSet.length,
            itemBuilder: (context, index) {
              ProductModel model = productsSet.elementAt(index);
              return CartWidget(model: model);
            }),
      );
    });
  }
}
