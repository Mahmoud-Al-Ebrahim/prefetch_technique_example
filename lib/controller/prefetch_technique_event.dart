part of 'prefetch_technique_bloc.dart';

@immutable
class PrefetchTechniqueEvent {}

class GetGroupsEvent extends PrefetchTechniqueEvent {}

class GetProductsInGroupEvent extends PrefetchTechniqueEvent {
  final String groupId; // through this field we save the data
  final String groupSlug; // through this field we get the data

  GetProductsInGroupEvent({required this.groupId , required this.groupSlug});
}

class PrefetchProductsOfGroupsEvent  extends PrefetchTechniqueEvent {
  final String groupId;
  final String groupSlug;
  PrefetchProductsOfGroupsEvent({required this.groupId , required this.groupSlug});
}
