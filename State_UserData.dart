import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_demo/API_RiverPod/Model_data.dart';
import 'package:test_demo/API_RiverPod/Request_Data.dart';

final userStateFuture = FutureProvider<List<UserData>>((ref)async{
return fetchUserDatas();
});