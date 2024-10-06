import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_project/cubit/cubit_status.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/pages/cart_page.dart';
import 'package:store_app_project/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              size: 26,
            ),
          ),
        ],
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'New ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Trend',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      // body: FutureBuilder<List<ProductModel>>(
      //   future: GetAllProductServices().getallproducts(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       List<ProductModel> list = snapshot.data!;

      //       return Padding(
      //         padding: const EdgeInsets.only(
      //             left: 10, right: 10, top: 50, bottom: 20),
      //         child: GridView.builder(
      //             itemCount: list.length,
      //             clipBehavior: Clip.none,
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisSpacing: 20,
      //               childAspectRatio: 1,
      //             ),
      //             itemBuilder: (context, index) {
      //               return CardWidget(model: list[index]);
      //             }),
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(
      //           color: Colors.blue,
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: BlocBuilder<GetstoreCubit, Allstatus>(builder: (context, state) {
        if (state is Storestatefailure) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        } else {
          List<ProductModel> list =
              BlocProvider.of<GetstoreCubit>(context).model;
          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 50, bottom: 20),
            child: GridView.builder(
                itemCount: list.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return CardWidget(
                    model: list[index],
                  );
                }),
          );
        }
      }),
    );
  }
}
