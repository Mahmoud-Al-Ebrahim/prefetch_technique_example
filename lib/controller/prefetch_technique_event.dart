part of 'prefetch_technique_bloc.dart';

@immutable
class PrefetchTechniqueEvent {}

class GetGroupsEvent extends PrefetchTechniqueEvent {}

class GetProductsInGroupEvent extends PrefetchTechniqueEvent {
  final String groupId;

  GetProductsInGroupEvent({required this.groupId});
}
