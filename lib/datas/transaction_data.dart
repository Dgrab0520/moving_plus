import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:moving_plus/models/transaction_model.dart';

import '../pages/chat_estimate.dart';

class TransActionData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_transaction.php";

  final _selectedDate = DateTime.now().obs;
  final _selectedDate2 = DateTime.now().obs;

  DateTime get selectedDate => _selectedDate.value;
  set selectedDate(val) => _selectedDate.value = val;

  DateTime get selectedDate2 => _selectedDate2.value;
  set selectedDate2(val) => _selectedDate2.value = val;

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate = picked;
    }
  }

  selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate2 = picked;
    }
  }

  final _transAction = <TransAction>[].obs;
  List<TransAction> get transAction => _transAction;
  set transAction(val) => _transAction.value = val;

  final _isTransActionLoading = false.obs;
  bool get isTransActionLoading => _isTransActionLoading.value;
  set isTransActionLoading(val) => _isTransActionLoading.value = val;

  final _isAll = true.obs;
  bool get isAll => _isAll.value;
  set isAll(val) => _isAll.value = val;

  setTransaction(int index, double rating) {
    transAction[index].reviewRating = rating;
    _transAction.refresh();
  }

  //거래 내역 불러오기
  getTransaction() async {
    isAll = true;
    try {
      var map = <String, dynamic>{};
      map['action'] = "getTrans";
      map['cusId'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("TransAction BreakDown Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction = parseResponse(response.body);
        isTransActionLoading = true;
      }
    } catch (e) {
      print("exception : $e");
      transAction = <TransAction>[];
      isTransActionLoading = true;
    }
  }

  //기간별 거래 내역 불러오기
  getTransactionRange(DateTime from, DateTime to) async {
    print(DateFormat("yyyy-MM-dd HH:mm:ss").format(from));
    print(DateFormat("yyyy-MM-dd HH:mm:ss").format(to));
    print(controller.pro.value.pro_id);

    isAll = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "getTransRange";
      map['cusId'] = controller.pro.value.pro_id;
      map['from'] = DateFormat("yyyy-MM-dd hh:mm:ss").format(from);
      map['to'] = DateFormat("yyyy-MM-dd hh:mm:ss").format(to);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("TransAction BreakDown Range Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction = parseResponse(response.body);
        isTransActionLoading = true;
      }
    } catch (e) {
      transAction = <TransAction>[];
      isTransActionLoading = true;
      print("exception : $e");
    }
  }

  static List<TransAction> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<TransAction>((json) => TransAction.fromJson(json))
        .toList();
  }
}
