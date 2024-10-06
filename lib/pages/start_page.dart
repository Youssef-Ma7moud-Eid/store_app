import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/pages/home_page.dart';
import 'package:store_app_project/widgets/buttom_widget.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});
  static String id = "startpage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 26,
            ),
          ),
        ],
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'App',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ' Store',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 23,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/3556963.jpg'),
          ),
          const SizedBox(
            height: 50,
          ),
          ButtomWidget(
            buttomtext: 'Start',
            onTap: () {
              var store = BlocProvider.of<GetstoreCubit>(context);

              store.getallproduct();
              Navigator.pushNamed(context, HomePage.id);
            },
          ),
        ],
      ),
    );
  }
}
