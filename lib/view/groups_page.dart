import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prefetch_technique_example/main.dart';
import 'package:prefetch_technique_example/view/widgets/group_item.dart';

import '../controller/prefetch_technique_bloc.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
      ),
      body: BlocBuilder<PrefetchTechniqueBloc, PrefetchTechniqueState>(
        builder: (context, state) {
          if(state.getGroupsStatus == GetGroupsStatus.loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state.getGroupsStatus == GetGroupsStatus.failed){
            return  Center(
              child: ElevatedButton(onPressed: (){
                BlocProvider.of<PrefetchTechniqueBloc>(context).add(GetGroupsEvent());
              }, child: const Text('Refresh')),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) => GroupItem(groupModel: state.groups[index],),
              separatorBuilder: (context, index) => const SizedBox(height: 15,),
              itemCount: 10);
        },
      ),
    );
  }
}
