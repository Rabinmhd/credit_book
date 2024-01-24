import 'package:credit_book/pages/addTransactionPage/add_item_page.dart';
import 'package:credit_book/pages/homePage/home_page_provider.dart';
import 'package:credit_book/pages/homePage/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Credit book"),
          bottom: const TabBar(tabs: [
            Tab(
              child: Text("To get"),
            ),
            Tab(
              child: Text("To give"),
            )
          ]),
        ),
        body: Consumer<HomePageProvider>(
          builder: (context, data, _) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  TabViewWidget(
                      listOfData: data.toGetList,
                      totalAmount: data.totalOfToGet,
                      isPagetoGet: true),
                  TabViewWidget(
                      listOfData: data.toGiveList,
                      totalAmount: data.totalOfToGive,
                      isPagetoGet: false),
                ],
              ),
            );
          },
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
