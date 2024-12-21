
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prefetch_technique_example/model/products_in_group_model.dart';
import 'dart:ui' as ui;

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 350,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.1),
                  offset: const Offset(0, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child:  (product.syncColorImages?.isEmpty ?? true) ||
                    (product.syncColorImages![0].images?.isEmpty ?? true)
                          ? Image.asset(
                          'assets/blur_image.png',
                          fit: BoxFit.cover)
                          : CachedNetworkImage(
                          imageUrl: product
                              .syncColorImages![0].images![0].filePath!,
                        height: 350,
                        width: 200,
                        fit: BoxFit.cover,
                  progressIndicatorBuilder: (ctx , url ,_){
                    return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                  },
                      )
                    ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                blendMode: BlendMode.overlay,
                filter: ui.ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xfffafafa)),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffffffff).withOpacity(0.8)),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                         SizedBox(
                           child: Stack(
                             alignment: Alignment.center,
                             children: [
                               Stack(
                                 alignment: Alignment.centerLeft,
                                 children: [
                                   SizedBox(
                                     height: 290,
                                     width: 200,
                                     child: CachedNetworkImage(
                                       imageUrl : (product.syncColorImages?.isEmpty ?? true)
                                                 ? product
                                                 .images![0]
                                                 .filePath!
                                                 : product.syncColorImages![
                                             0]
                                                 .images![0]
                                                 .filePath!,
                                             height: 290,
    width: 200,
                                       progressIndicatorBuilder: (ctx , url ,_){
                                         return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                                       },
                                           )
                                         ,
                                   ),
                                   Container(
                                       height: 290,
                                       width: 30,
                                       color: Colors.transparent)
                                 ],
                               ),
                             ],
                           ),
                         ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                            product.name.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            ),
                                      ),
                                    ],
                                  ),
                                ])),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 225,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 22),
                          child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          product.price!
                                              .toStringAsFixed(2)
                                              .toString(),
                                          style:
                                          const TextStyle(
                                            color: Color(0xff3c3c3c),
                                            decoration:
                                            TextDecoration.lineThrough,
                                            height: 0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          product.offerPrice!
                                              .toStringAsFixed(
                                              2)
                                              .toString(),
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        const Text("\$")
                                      ],
                                    ),
                                    const Row(
                                      children: [
                                        Text(
                                          'Buy',
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Icon(Icons.shopping_bag_rounded , size: 15,)
                                      ],
                                    )
                                  ],
                          )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]);
  }
}
