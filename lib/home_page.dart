import 'package:change_notifier_demo/controller.dart';
import 'package:change_notifier_demo/form.dart';
import 'package:change_notifier_demo/model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Controller().dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Change Notifier Demo',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const FormScreen();
              },
            ),
          );
        },
      ),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: Controller(),
          builder: (BuildContext context, Widget? child) {
            return ListView.builder(
              shrinkWrap: true,
              reverse: true,
              padding: const EdgeInsets.all(
                18.0,
              ),
              itemCount: Controller().modelList.length,
              itemBuilder: (BuildContext context, int index) {
                Model value = Controller().modelList[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (v) {
                    Controller().removeData(
                      value,
                    );
                    return;
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        value.name,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
