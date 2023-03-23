import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_demo/API_RiverPod/Model_data.dart';
import 'package:test_demo/API_RiverPod/State_UserData.dart';

class Response extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
  AsyncValue<List<UserData>> users=ref.watch(userStateFuture);
  return Scaffold(
    body: users.when(
        error: (err,stack)=>Center(child: Text('${err.toString()}'),),
        loading: ()=> Center(child: CircularProgressIndicator(),),
        data: (users) {
          return ListView.builder(
            itemCount:users.length,
            itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${users[index].title}'),
              trailing: Text("${users[index].id}"),
            );
            },);
        }),
  );
  }

}