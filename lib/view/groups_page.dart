import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prefetch_technique_example/view/widgets/group_item.dart';

import '../controller/prefetch_technique_bloc.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  late final ScrollController scrollController;
  late final PrefetchTechniqueBloc prefetchTechniqueBloc;
  int previousLastIndexSeenByUser = -1, previousFirstIndexSeenByUser = -1;

  int computeTheMaxNumberOfGroupDisplayedToUser() {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double appBarHeight = kToolbarHeight;
    double statusBarHeight = MediaQuery.viewPaddingOf(context).top;
    double groupItemHeight = 235; // set here your widget height
    double groupItemPadding = 15; // set here your widget padding in the list
    int numberOfGroupsDisplayedInitially =
        (screenHeight - appBarHeight - statusBarHeight) ~/
                (groupItemHeight + groupItemPadding) +
            1;
    return numberOfGroupsDisplayedInitially;
  }

  prefetchProductsOfGroupsWhenGroupsFetchedSuccessfully() {
    int maxNumberOfGroupsDisplayedInitially =
        computeTheMaxNumberOfGroupDisplayedToUser();
    int totalNumberOfGroups = prefetchTechniqueBloc.state.groups.length;
    // the number of groups displayed can be bigger than the groups length
    // so i take the minimum between it and groups.length
    for (int i = 0;
        i < min(totalNumberOfGroups, maxNumberOfGroupsDisplayedInitially);
        i++) {
      prefetchTechniqueBloc.add(PrefetchProductsOfGroupsEvent(
          groupId: prefetchTechniqueBloc.state.groups[i].id.toString() , groupSlug: prefetchTechniqueBloc.state.groups[i].slug.toString()));
    }
  }

  prefetchProductsOfGroupsWhenUserScroll() {
    // 250 is represent the height of the group item and the padding value
    int lastIndexSeenByUser = (scrollController.position.pixels +
            scrollController.position.viewportDimension +
            250) ~/
        250;
    int totalNumberOfGroups = prefetchTechniqueBloc.state.groups.length;
    int maxNumberOfGroupsDisplayedInitially =
    computeTheMaxNumberOfGroupDisplayedToUser();
    // i computed the first index by subtract the maximum number of groups can be displayed
    // from last group index which computed according to scroll offset
    // the value can be negative so i take the maximum between it and zero
    int firstIndexSeenByUser = max(
        0, lastIndexSeenByUser - maxNumberOfGroupsDisplayedInitially);
    if ((previousFirstIndexSeenByUser != firstIndexSeenByUser ||
        previousLastIndexSeenByUser != lastIndexSeenByUser)) {
      for (int i = firstIndexSeenByUser;
          i < min(totalNumberOfGroups, lastIndexSeenByUser);
          i++) {
        prefetchTechniqueBloc.add(PrefetchProductsOfGroupsEvent(
            groupId: prefetchTechniqueBloc.state.groups[i].id.toString() , groupSlug: prefetchTechniqueBloc.state.groups[i].slug.toString()));
      }
      previousFirstIndexSeenByUser = firstIndexSeenByUser;
      previousLastIndexSeenByUser = lastIndexSeenByUser;
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    // ** comment the listener if you want to run it without prefetching **

    scrollController.addListener(prefetchProductsOfGroupsWhenUserScroll);
    prefetchTechniqueBloc = BlocProvider.of<PrefetchTechniqueBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Groups Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
      ),
      body: BlocConsumer<PrefetchTechniqueBloc, PrefetchTechniqueState>(
        listenWhen: (previous, current) =>
            previous.getGroupsStatus != current.getGroupsStatus &&
            current.getGroupsStatus == GetGroupsStatus.success,
        buildWhen: (previous, current) =>
            previous.getGroupsStatus != current.getGroupsStatus,
        listener: (context, state) {
          // ** comment the "if statement" if you want to run it without prefetching **

          if (state.getGroupsStatus == GetGroupsStatus.success) {
            prefetchProductsOfGroupsWhenGroupsFetchedSuccessfully();
          }
        },
        builder: (context, state) {
          if (state.getGroupsStatus == GetGroupsStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.redAccent,),
            );
          }
          if (state.getGroupsStatus == GetGroupsStatus.failed) {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PrefetchTechniqueBloc>(context)
                        .add(GetGroupsEvent());
                  },
                  child: const Text('Refresh')),
            );
          }
          return ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) => GroupItem(
                    groupModel: state.groups[index],
                  ),
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              itemCount: state.groups.length);
        },
      ),
    );
  }
}
