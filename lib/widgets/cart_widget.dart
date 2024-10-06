import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/models/product_model.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key, required this.model});
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          height: 155,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                blurRadius: 90,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 20,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title.length > 6
                        ? model.title.substring(0, 6)
                        : model.title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 103, 100, 100),
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        r'$' '${model.price.toString()}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          var store = BlocProvider.of<GetstoreCubit>(context);

                          store.removeproductincart(model: model);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          right: 80,
          child: Image.network(
            model.image,
            height: 95,
          ),
        ),
      ],
    );
  }
}
