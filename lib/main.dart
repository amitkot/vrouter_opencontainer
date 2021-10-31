import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: 'Flutter Demo',
      routes: [
        VWidget(
          path: '/',
          widget: const ListScreen(),
          stackedRoutes: [
            VWidget(
              path: ':id',
              widget: const ItemScreen(),
            ),
          ],
        ),
      ],
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          OpenContainer(
            closedBuilder: (context, open) {
              return ListTile(
                title: const Text('1'),
                onTap: () {
                  print('--- clicked');
                  open();
                },
              );
            },
            openBuilder: (context, close) {
              return const ItemScreen(id: 1);
            },
          ),
        ],
      ),
    );
  }
}

class ItemScreen extends StatelessWidget {
  const ItemScreen({
    this.id,
    Key? key,
  }) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) {
    final itemId = id ?? context.vRouter.pathParameters['id'];

    return Scaffold(
      appBar: AppBar(
        title: Text('$itemId'),
      ),
      body: Center(
        child: Text('Item screen: $itemId'),
      ),
    );
  }
}
