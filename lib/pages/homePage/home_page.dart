import 'package:credit_book/pages/addTransactionPage/add_item_page.dart';
import 'package:credit_book/pages/homePage/home_page_provider.dart';
import 'package:credit_book/pages/homePage/widgets/tab_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd bannerAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-7535469304880829/5484847072",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          Provider.of<HomePageProvider>(context, listen: false)
              .changeIsAdLoaded();
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

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
                  height: bannerAd.size.height.toDouble(),
                  width: bannerAd.size.width.toDouble(),
                  color: Colors.black,
                  child: AdWidget(ad: bannerAd),
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
