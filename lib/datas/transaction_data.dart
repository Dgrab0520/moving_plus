import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moving_plus/models/transaction_model.dart';

import '../pages/chat_estimate.dart';

class TransActionData extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_transaction.php";

  final _transAction = <TransAction>[].obs;
  List<TransAction> get transAction => _transAction;
  set transAction(val) => _transAction.value = val;

  final _isTransActionLoading = false.obs;
  bool get isTransActionLoading => _isTransActionLoading.value;
  set isTransActionLoading(val) => _isTransActionLoading.value = val;

  //거래 내역 불러오기
  getTransaction() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "SELECT";
      map['cusId'] = controller.pro.value.pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("TransAction BreakDown Response : ${response.body}");
      if (response.statusCode == 200) {
        transAction = parseResponse(response.body);
        isTransActionLoading = true;
      }
    } catch (e) {
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
