import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:prefetch_technique_example/model/groups_response_model.dart';
import 'package:prefetch_technique_example/model/products_in_group_model.dart';

part 'prefetch_technique_event.dart';

part 'prefetch_technique_state.dart';

class PrefetchTechniqueBloc
    extends Bloc<PrefetchTechniqueEvent, PrefetchTechniqueState> {
  PrefetchTechniqueBloc() : super(PrefetchTechniqueState()) {
    on<PrefetchTechniqueEvent>((event, emit) {});
    on<GetGroupsEvent>(_onGetGroupsEvent);
    on<GetProductsInGroupEvent>(_onGetProductsInGroupEvent);
  }

  final Dio dio = Dio();

  FutureOr<void> _onGetGroupsEvent(
      GetGroupsEvent event, Emitter<PrefetchTechniqueState> emit) async {
    emit(state.copyWith(getGroupsStatus: GetGroupsStatus.loading));
    await dio
        .getUri(Uri.parse(
            'https://market_under_dev_backend.trydos.dev/api/home/boutiques'))
        .then((response) {
      emit(state.copyWith(
          getGroupsStatus: GetGroupsStatus.success,
          groups: GroupsResponseModel.fromJson(response.data).data!.groups));
    }).catchError((error) {
      emit(state.copyWith(
        getGroupsStatus: GetGroupsStatus.failed,
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        getGroupsStatus: GetGroupsStatus.failed,
      ));
    });
  }

  FutureOr<void> _onGetProductsInGroupEvent(GetProductsInGroupEvent event,
      Emitter<PrefetchTechniqueState> emit) async {
    Map<String, GetProductsOfGroupStatus> getProductsOfGroupStatus =
        Map.of(state.getProductsOfGroupStatus);
    getProductsOfGroupStatus[event.groupId] = GetProductsOfGroupStatus.loading;
    emit(state.copyWith(getProductsOfGroupStatus: getProductsOfGroupStatus));
    await dio.getUri(
        Uri.parse(
            'https://market_under_dev_backend.trydos.dev/api/products/search'),
        data: {
          "boutique_slugs": ['"${event.groupId}"'].toString()
        }).then((response) {
      Map<String, List<Product>> productsInEachGroup =
          Map.of(state.productsInEachGroup);
      getProductsOfGroupStatus = Map.of(state.getProductsOfGroupStatus);
      getProductsOfGroupStatus[event.groupId] =
          GetProductsOfGroupStatus.success;
      productsInEachGroup[event.groupId] =
          ProductsInGroupModel.fromJson(response.data).data!.products ?? [];
      emit(state.copyWith(
          getProductsOfGroupStatus: getProductsOfGroupStatus,
          productsInEachGroup: productsInEachGroup));
    }).catchError((error) {
      getProductsOfGroupStatus = Map.of(state.getProductsOfGroupStatus);
      getProductsOfGroupStatus[event.groupId] = GetProductsOfGroupStatus.failed;
      emit(state.copyWith(getProductsOfGroupStatus: getProductsOfGroupStatus));
    }).onError((error, stackTrace) {
      getProductsOfGroupStatus = Map.of(state.getProductsOfGroupStatus);
      getProductsOfGroupStatus[event.groupId] = GetProductsOfGroupStatus.failed;
      emit(state.copyWith(getProductsOfGroupStatus: getProductsOfGroupStatus));
    });
  }
}
