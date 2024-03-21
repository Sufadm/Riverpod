import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/home/api_list_page.dart';
import 'package:riverpodproject/model/model.dart';
import 'package:riverpodproject/services/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ApiList();
              }));
            }),
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: userData.when(
            data: (userData) {
              List<UserModel> userList = userData.map((e) => e).toList();
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  final data = userList[index];
                  return ListTile(
                    title:
                        Text("${data.firstName.toString()}  ${data.lastName}"),
                    subtitle: Text(data.email.toString()),
                    leading: Image.network(data.avatar.toString()),
                  );
                },
              );
            },
            error: (error, s) => Text(error.toString()),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}
