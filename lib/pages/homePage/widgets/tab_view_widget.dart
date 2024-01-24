import 'package:credit_book/pages/homePage/home_page_provider.dart';
import 'package:credit_book/utils/transaction_model.dart';
import 'package:credit_book/widgets/interaction_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class TabViewWidget extends StatelessWidget {
  List<TransactionModel> listOfData;
  double totalAmount;
  bool isPagetoGet;

  TabViewWidget({
    super.key,
    required this.listOfData,
    required this.totalAmount,
    required this.isPagetoGet,
  });

  @override
  Widget build(BuildContext context) {
    //print(total);
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Total amount: $totalAmount")],
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8),
            child: Row(
              children: [
                Expanded(child: Text("Label")),
                Expanded(child: Text("Type")),
                Expanded(child: Text("Time")),
                Expanded(child: Text("Amount"))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                    onLongPress: () => showPopupWindow(context, index),
                    child: InteractionTile(
                      name: listOfData[index].name,
                      amount: listOfData[index].amount,
                      type: listOfData[index].purpose,
                      time: listOfData[index].dateTime,
                    )),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: listOfData.length),
          ),
        ],
      ),
    );
  }

  void showPopupWindow(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete now'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<HomePageProvider>(context, listen: false)
                      .deleteData(index, isPagetoGet);
                  Navigator.pop(context);
                },
                child: const Text('delete'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Close the popup window
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}
