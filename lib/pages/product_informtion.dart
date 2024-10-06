import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/cubit_status.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/widgets/buttom_widget.dart';
import 'package:store_app_project/widgets/snak_bar_widget.dart';

class ProductInformtion extends StatefulWidget {
  ProductInformtion({super.key});
  static String id = 'ProductInformtion';

  @override
  State<ProductInformtion> createState() => _ProductInformtionState();
}

class _ProductInformtionState extends State<ProductInformtion> {
  @override
  Widget build(BuildContext context) {
    ProductModel model =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return BlocBuilder<GetstoreCubit, Allstatus>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            model.title.substring(0, 6),
            style: const TextStyle(
              color: Color.fromARGB(255, 139, 6, 234),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 165,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Image.network(model.image),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Description',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //   if (model.icon == Icons.favorite_border) {
                        //     model.icon = Icons.favorite;
                        //   } else {
                        //     model.icon = Icons.favorite_border;
                        //   }

                        var store = BlocProvider.of<GetstoreCubit>(context);

                        model.icon = store.getshapeicon(model.icon);
                        //    setState(() {});
                      },
                      icon: Icon(
                        model.icon,
                        size: 25,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  model.description,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 99, 97, 97),
                      fontSize: 19.4,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Price',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      r'$' '${model.price.toString()}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 8, 1),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ButtomWidget(
                buttomtext: 'Add to cart',
                onTap: () {
                  var store = BlocProvider.of<GetstoreCubit>(context);

                  store.addproductincart(model: model);
                  scaffoldmessenger(
                      color: Colors.green,
                      context: context,
                      text: 'Successful Add to your  Cart');
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
