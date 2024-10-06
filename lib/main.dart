import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/cubit_status.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/pages/cart_page.dart';
import 'package:store_app_project/pages/home_page.dart';
import 'package:store_app_project/pages/product_informtion.dart';
import 'package:store_app_project/pages/product_page.dart';
import 'package:store_app_project/pages/start_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetstoreCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id: (context) => HomePage(),
          ProductPage.product_id: (context) => ProductPage(),
          ProductInformtion.id: (context) => ProductInformtion(),
          StartPage.id: (context) => StartPage(),
          CartPage.id: (context) => CartPage(),
        },
        home: StartPage(),
      ),
    );
  }
}
