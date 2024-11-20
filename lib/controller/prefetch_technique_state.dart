part of 'prefetch_technique_bloc.dart';

enum GetGroupsStatus { loading, failed, success }

enum GetProductsOfGroupStatus { loading, failed, success }

class PrefetchTechniqueState {

  // the status of getting groups process
  final GetGroupsStatus getGroupsStatus;
  // the groups will be received by the get groups API
  final List<GroupModel> groups;

  // we have multiple group, so we need to store the products for every group according to group id
  final Map<String, List<Product>> productsInEachGroup;
  // we have multiple group, so we need to store the status of getting data for every group according to group id
  final Map<String, GetProductsOfGroupStatus> getProductsOfGroupStatus;

  PrefetchTechniqueState({
    this.getGroupsStatus = GetGroupsStatus.loading,
    this.groups = const [],
    this.productsInEachGroup = const {},
    this.getProductsOfGroupStatus = const {},
  });

  PrefetchTechniqueState copyWith({
    GetGroupsStatus? getGroupsStatus,
    List<GroupModel>? groups,
    Map<String, GetProductsOfGroupStatus>? getProductsOfGroupStatus,
    Map<String, List<Product>>? productsInEachGroup,
  }) {
    return PrefetchTechniqueState(
      getGroupsStatus: getGroupsStatus ?? this.getGroupsStatus,
      groups: groups ?? this.groups,
      getProductsOfGroupStatus: getProductsOfGroupStatus ?? this.getProductsOfGroupStatus,
      productsInEachGroup: productsInEachGroup ?? this.productsInEachGroup,
    );
  }
}
