import 'package:flutter/material.dart';
import 'column_widget.dart';
import 'row_widget.dart';
import 'stack_widget.dart';
import 'list_view_widget.dart';
import 'grid_view_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn Flutter Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.vertical_distribute),
                  text: 'Column',
                ),
                Tab(
                  icon: Icon(Icons.horizontal_distribute),
                  text: 'Row',
                ),
                Tab(
                  icon: Icon(Icons.rectangle),
                  text: 'Stack',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'List',
                ),
                Tab(
                  icon: Icon(Icons.grid_view),
                  text: 'Grid',
                ),
              ],
            ),
            title: const Text('Learn Flutter Layout'),
          ),
          body: const TabBarView(
            children: [
              ColumnWidget(),
              RowWidget(),
              StackWidget(),
              ListViewWidget(),
              GridViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
