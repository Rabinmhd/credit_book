import 'package:credit_book/pages/addTransactionPage/add_item_page.dart';
import 'package:credit_book/pages/homePage/home_page_provider.dart';
import 'package:credit_book/pages/homePage/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Consumer<HomePageProvider>(builder: (context, data, _) {
        return Scaffold(
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
          body: Padding(
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
          ),
          bottomNavigationBar: data.isAdLoaded
              ? Container(
                  height: data.bannerAd.size.height.toDouble(),
                  width: data.bannerAd.size.width.toDouble(),
                  color: Colors.black,
                  child: AdWidget(ad: data.bannerAd),
                )
              : const SizedBox(),
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
        );
      }),
    );
  }
}
