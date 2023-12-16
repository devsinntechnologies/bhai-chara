import 'dart:developer';

import 'package:bhai_chara/controller/services/Firebase_Manager.dart';
import 'package:bhai_chara/model/product_detail_model.dart';
import 'package:bhai_chara/model/user_model.dart';
import 'package:bhai_chara/utils/preferences.dart';
import 'package:bhai_chara/utils/showSnack.dart';
import 'package:bhai_chara/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/push.dart';
import '../../../view/request_screen.dart';

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

  addRequest(context, {required productID}) async {
    try {
        
      isLoading = true;
      notifyListeners();
      var data = productDetailModel!.toJson();
      var address = await Preferences.getAddress();
      data["product_id"] = productID;
      data["requester_id"] = FirebaseAuth.instance.currentUser!.uid;
      data["request"] = "pending";
      data["requester_address"] = address ?? "";
      data["request_time"] = DateTime.now();
      print(data);
    
      await FirebaseFirestore.instance.collection(REQUEST_COLLECTION).add(data);
      isLoading = false;
      notifyListeners();

      push(context, RequestScreen());
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showSnack(context: context, text: e.toString());
    }
  }
}
