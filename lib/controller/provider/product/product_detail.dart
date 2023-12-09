import 'dart:developer';
import 'package:bhai_chara/utils/push.dart';

import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/model/product_detail_model.dart';
import 'package:bhai_chara/model/user_model.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductDetailProvider extends ChangeNotifier {
  bool isLoading = false;
  UserModel? donnerDetail;
  ProductDetailModel? productDetailModel;

  getDonerDetail(uid) async {
    // debugger();
    var data = await firebaseGetUserDetail(uid);
    // debugger();
    if (data != null) {
      donnerDetail = data;
      return donnerDetail;
    }
  }

  getProductDetail(context, id) async {
    try {
      isLoading = true;
      notifyListeners();
      var data = await FirebaseFirestore.instance
          .collection(PRODUCT_COLLECTION)
          .doc(id)
          .get();

      // debugger();
      if (data != null) {
        productDetailModel = ProductDetailModel.fromJson(data.data()!);
        donnerDetail = await getDonerDetail(productDetailModel!.uid);

        notifyListeners();
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      pop(context);
      showSnack(context: context, text: e.toString());
    }
  }
}
