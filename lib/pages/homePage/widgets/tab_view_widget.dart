import 'package:credit_book/pages/creditDetailPage/detail_page.dart';
import 'package:flutter/material.dart';

class TabViewWidget extends StatelessWidget {
  const TabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text("Total amount: 2000")],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text("Name"), Text("Type"), Text("Amount")],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditDetailsPage(),
                          ),
                        ),
                    child: Container(
                      color: Colors.amber,
                      height: 50,
                      width: 100,
                    )),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 10),
          ),
        ],
      ),
    );
  }
}
