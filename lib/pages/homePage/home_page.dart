import 'package:credit_book/pages/addTransactionPage/add_item_page.dart';
import 'package:credit_book/pages/homePage/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("credit book"),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("To get"),
            ),
            Tab(
              child: Text("To give"),
            )
          ]),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
            children: [
              TabViewWidget(),
              TabViewWidget(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddItemPage(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
