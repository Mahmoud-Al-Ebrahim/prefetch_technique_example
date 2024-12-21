import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prefetch_technique_example/controller/prefetch_technique_bloc.dart';
import 'package:prefetch_technique_example/model/groups_response_model.dart';
import 'package:flutter/cupertino.dart' as cupertino;
import 'dart:ui' as ui;
import 'package:flutter_html/flutter_html.dart';
import 'package:prefetch_technique_example/view/products_of_group_page.dart';

class GroupItem extends StatelessWidget {
  const GroupItem({super.key, required this.groupModel});

  final GroupModel groupModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => BlocProvider.value(
                value: BlocProvider.of<PrefetchTechniqueBloc>(context),
                child:
                    ProductsOfGroupPage(groupId: groupModel.id.toString() , groupSlug: groupModel.slug.toString(),))));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          Container(
              height: 235,
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
                  child: ((groupModel.banners?.length ?? 0) > 0)
                      ? CachedNetworkImage(
                          imageUrl: groupModel.banners![0].filePath!,
                          fit: cupertino.BoxFit.cover,
                          width: size.width,
                          height: 235,
                    progressIndicatorBuilder: (ctx , url ,_){
                      return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                    },
                        )
                      : const cupertino.SizedBox.shrink())),
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
          Positioned.fill(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 25, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    groupModel.icon != null
                        ? SvgPicture.network(
                            groupModel.icon!.filePath!,
                            height: 20,
                            width: 40,
                          )
                        : Text(
                            groupModel.name!,
                          ),
                    const SizedBox(
                      height: 5,
                    ),
                    Html(
                      shrinkWrap: true,
                      data: groupModel.description ?? '',
                      style: {
                        "body": Style(margin: Margins.all(0)),
                        "p": Style(
                          maxLines: 1,
                          margin: Margins.all(0),
                        ),
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 135,
                      width: size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            width: 0.5, color: const Color(0xfffafafa)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            offset: Offset(0, 3),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ((groupModel.banners?.length ?? 0) == 0)
                              ? const cupertino.SizedBox.shrink()
                              : CachedNetworkImage(
                                  imageUrl: groupModel.banners![0].filePath!,
                                  fit: BoxFit.cover,
                                  width: size.width,
                                  height: 135,
                            progressIndicatorBuilder: (ctx , url ,_){
                                    return const Center(child: CircularProgressIndicator(color: Colors.redAccent,),);
                            },
                                )),
                    ),
                  ],
                ),
              )
            ],
          )),
          PositionedDirectional(
            end: 18,
            top: 18,
            child: SizedBox(
              height: 12,
              child: cupertino.ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 13,
                ),
                shrinkWrap: true,
                scrollDirection: cupertino.Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        groupModel.mainCategoriesForProductIds![index]
                                    .flatPhotoPath !=
                                null
                            ? groupModel.mainCategoriesForProductIds![index]
                                .flatPhotoPath!.filePath!
                            : "",
                        width: 12,
                        height: 12,
                      ));
                },
                itemCount: groupModel.mainCategoriesForProductIds!.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
