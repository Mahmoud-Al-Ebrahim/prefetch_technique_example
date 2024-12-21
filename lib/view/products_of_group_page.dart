import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prefetch_technique_example/controller/prefetch_technique_bloc.dart';
import 'package:prefetch_technique_example/view/widgets/product_item.dart';

import '../model/products_in_group_model.dart';

class ProductsOfGroupPage extends StatefulWidget {
  const ProductsOfGroupPage({super.key, required this.groupId, required this.groupSlug});

  final String groupId;
  final String groupSlug;

  @override
  State<ProductsOfGroupPage> createState() => _ProductsOfGroupPageState();
}

class _ProductsOfGroupPageState extends State<ProductsOfGroupPage> {


  // ** uncomment this method if you want to run without prefetching **

  // @override
  // void initState() {
  //   BlocProvider.of<PrefetchTechniqueBloc>(context).add(PrefetchProductsOfGroupsEvent(groupId: widget.groupId , groupSlug: widget.groupSlug));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products Page' , style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<PrefetchTechniqueBloc, PrefetchTechniqueState>(
            builder: (context, state) {
          if (state.getProductsOfGroupStatus[widget.groupId] ==
              GetProductsOfGroupStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent,),
            );
          }
          if (state.getProductsOfGroupStatus[widget.groupId] ==
              GetProductsOfGroupStatus.failed) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PrefetchTechniqueBloc>(context)
                        .add(GetGroupsEvent());
                  },
                  child: const Text('Refresh')),
            );
          }
          List<Product> products =
              state.productsInEachGroup[widget.groupId] ?? [];
          return GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 200 / 350,
            crossAxisSpacing: 10,
            mainAxisSpacing: 15,
            padding: const EdgeInsets.only(top: 10),
            children: List.generate(products.length,
                (index) => ProductItem(product: products[index])),
          );
        }));
  }
}
