import 'package:credit_book/utils/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePageProvider extends ChangeNotifier {
  List<TransactionModel> toGetList = [];
  List<TransactionModel> toGiveList = [];

  bool isAdLoaded = false;
  double totalOfToGet = 0;
  double totalOfToGive = 0;
  changeIsAdLoaded() {
    isAdLoaded = true;
    notifyListeners();
  }

  addDataToGetList(TransactionModel dataToAdd) async {
    final toGetListDb =
        await Hive.openBox<TransactionModel>("transaction_db_to_get");
    toGetListDb.add(dataToAdd);
    toGetList.clear();
    totalOfToGet = 0;
    toGetList.addAll(toGetListDb.values);

    for (var element in toGetList) {
      totalOfToGet = totalOfToGet + element.amount;
    }
    print(toGetList);
    notifyListeners();
  }

  addDataToGiveList(TransactionModel dataToAdd) async {
    final toGiveListDb =
        await Hive.openBox<TransactionModel>("transaction_db_to_give");
    toGiveListDb.add(dataToAdd);
    toGiveList.clear();
    totalOfToGive = 0;
    toGiveList.addAll(toGiveListDb.values);

    for (var element in toGiveList) {
      totalOfToGive = totalOfToGive + element.amount;
    }
    notifyListeners();
  }

  HomePageProvider() {
    getAllData();
  }
  deleteData(int index, bool isPageToGet) async {
    if (isPageToGet) {
      final toGetListDb =
          await Hive.openBox<TransactionModel>("transaction_db_to_get");
      toGetList.removeAt(index);
      toGetListDb.deleteAt(index);
      getAllData();
      notifyListeners();
    } else {
      final toGiveListDb =
          await Hive.openBox<TransactionModel>("transaction_db_to_give");
      toGiveList.removeAt(index);
      toGiveListDb.deleteAt(index);
      getAllData();
      notifyListeners();
    }
  }

  getAllData() async {
    final toGetListDb =
        await Hive.openBox<TransactionModel>("transaction_db_to_get");

    final toGiveListDb =
        await Hive.openBox<TransactionModel>("transaction_db_to_give");
    toGetList.clear();
    toGiveList.clear();
    totalOfToGet = 0;
    totalOfToGive = 0;
    toGetList.addAll(toGetListDb.values);
    toGiveList.addAll(toGiveListDb.values);
    for (var element in toGetList) {
      totalOfToGet = totalOfToGet + element.amount;
    }
    for (var element in toGiveList) {
      totalOfToGive = totalOfToGive + element.amount;
    }
    notifyListeners();
  }
}
