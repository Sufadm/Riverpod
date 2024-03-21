import 'package:riverpod/riverpod.dart';
import 'package:riverpodproject/model/model.dart';
import 'package:riverpodproject/controller/services/api_services.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
