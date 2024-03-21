import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodproject/controller/services/api_services.dart';

class ApiList extends ConsumerWidget {
  const ApiList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(taskUserData);
    final apidata = ref.watch(taskUserData);
    final datas = apidata.tasklist;

    if (apidata.tasklist.isEmpty) {
      apidata.fetchdata();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            apidata.tasklist.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: datas.length,
                      itemBuilder: (context, index) {
                        final task = apidata.tasklist[index];
                        return ListTile(
                          title: Text(task.title),
                          subtitle: Text('Completed: ${task.completed}'),
                        );
                      },
                    ),
                  ),
          ],
        ));
  }
}
