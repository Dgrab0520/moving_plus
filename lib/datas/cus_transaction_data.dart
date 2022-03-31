import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/cus_transaction_model.dart';
import '../pages/chat_estimate.dart';

class CusTransActionData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_review.php";

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

  final _transAction = <CusTransAction>[].obs;
  List<CusTransAction> get transAction => _transAction;
  set transAction(val) => _transAction.value = val;

  final _isTransActionLoading = false.obs;
  bool get isTransActionLoading => _isTransActionLoading.value;
  set isTransActionLoading(val) => _isTransActionLoading.value = val;

  final _isAll = true.obs;
  bool get isAll => _isAll.value;
  set isAll(val) => _isAll.value = val;

  //거래 내역 불러오기
  getTransaction() async {
    print(controller.pro.value.pro_id);
    isAll = true;
    try {
      var map = <String, dynamic>{};
      map['action'] = "SELECT_CUS_REVIEW";
      map['cus_id'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Customer TransAction BreakDown Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction = parseResponse(response.body);
        isTransActionLoading = true;
      }
    } catch (e) {
      transAction = <CusTransAction>[];
      isTransActionLoading = true;
      print("exception : $e");
    }
  }

  //기간별 거래 내역 불러오기
  getTransactionRange(DateTime from, DateTime to) async {
    to = to.add(Duration(days: 1));
    print(DateFormat("yyyy-MM-dd").format(from));
    print(DateFormat("yyyy-MM-dd").format(to));
    print(controller.pro.value.pro_id);

    isAll = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "getTransRange";
      map['cus_id'] = controller.pro.value.pro_id;
      map['from'] = DateFormat("yyyy-MM-dd").format(from);
      map['to'] = DateFormat("yyyy-MM-dd").format(to);
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("TransAction BreakDown Range Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction = parseResponse(response.body);
        isTransActionLoading = true;
      }
    } catch (e) {
      transAction = <CusTransAction>[];
      isTransActionLoading = true;
      print("exception : $e");
    }
  }

  //후기 수정
  editReview(int index, String review, double ratings) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "editReview";
      map['review'] = review;
      map['ratings'] = ratings.toString();
      map['reviewId'] = transAction[index].id.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Review Edit Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction[index].reviewContent = review;
        transAction[index].reviewPoint = ratings;
        _transAction.refresh();
        Get.back();
        if (!Get.isSnackbarOpen) {
          Get.snackbar("성공", "성공적으로 후기를 수정했습니다");
        }
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //후기 삭제
  deleteReview(int index) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "deleteReview";
      map['reviewId'] = transAction[index].id.toString();
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Review Delete Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction.removeAt(index);
        _transAction.refresh();
        Get.back();
        if (!Get.isSnackbarOpen) {
          Get.snackbar("성공", "성공적으로 후기를 삭제했습니다");
        }
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  static List<CusTransAction> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<CusTransAction>((json) => CusTransAction.fromJson(json))
        .toList();
  }
}
