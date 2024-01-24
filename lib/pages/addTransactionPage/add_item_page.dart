import 'package:credit_book/pages/homePage/home_page_provider.dart';
import 'package:credit_book/utils/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddItemPage extends StatefulWidget {
  AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController amountController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController purposeController = TextEditingController();

  ValueNotifier<bool> isToGetRadioButtonSelected = ValueNotifier(false);
  ValueNotifier<bool> isAdLoaded = ValueNotifier(false);
  late BannerAd bannerAd;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-7535469304880829/1882312284",
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isAdLoaded.value = true;
        },
      ),
      request: const AdRequest(),
    );
    bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credit Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name*'),
            ),
            TextField(
              controller: purposeController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(labelText: 'Type*'),
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Amount*'),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: isToGetRadioButtonSelected,
              builder: (context, value, _) {
                return Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isToGetRadioButtonSelected.value,
                      onChanged: (bool? value) {
                        isToGetRadioButtonSelected.value = value!;
                      },
                    ),
                    const Text('To get'),
                    Radio(
                      value: false,
                      groupValue: isToGetRadioButtonSelected.value,
                      onChanged: (bool? value) {
                        isToGetRadioButtonSelected.value = value!;
                      },
                    ),
                    const Text('To give'),
                  ],
                );
              },
            ),
            Expanded(
              child: ValueListenableBuilder(
                  valueListenable: isAdLoaded,
                  builder: (context, data, _) {
                    return Container(
                      child: data ? AdWidget(ad: bannerAd) : const SizedBox(),
                    );
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                addTransactionData(context);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12),
                child: const Center(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Save",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  addTransactionData(BuildContext context) async {
    try {
      if (nameController.text.isNotEmpty &&
          purposeController.text.isNotEmpty &&
          amountController.text.isNotEmpty) {
        final dataToAdded = TransactionModel(
            name: nameController.text,
            purpose: purposeController.text,
            amount: double.parse(amountController.text),
            dateTime: DateFormat('h:mm a dd-MM-yy')
                .format(DateTime.now())
                .toString());
        if (isToGetRadioButtonSelected.value) {
          Provider.of<HomePageProvider>(context, listen: false)
              .addDataToGetList(dataToAdded);
          Navigator.pop(context);
        } else {
          Provider.of<HomePageProvider>(context, listen: false)
              .addDataToGiveList(dataToAdded);
          Navigator.pop(context);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Fill the fields'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
