import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_project/cubit/get_store_cubit.dart';
import 'package:store_app_project/models/product_model.dart';
import 'package:store_app_project/pages/product_informtion.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.model});
  final ProductModel model;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductInformtion.id,
            arguments: widget.model);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.title.substring(0, 6),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 46, 40, 40),
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.model.price.toString()}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 59, 158, 63),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            if (widget.model.icon == Icons.favorite_border) {
                              widget.model.icon = Icons.favorite;
                            } else {
                              widget.model.icon = Icons.favorite_border;
                            }
                            setState(() {});
                            // var store = BlocProvider.of<GetstoreCubit>(context);

                            //   widget.model.icon =
                            //     store.getshapeicon(widget.model.icon);
                          },
                          icon: Icon(
                            widget.model.icon,
                            size: 25,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 20,
            child: Image.network(widget.model.image),
            height: 65,
          ),
        ],
      ),
    );
  }
}
