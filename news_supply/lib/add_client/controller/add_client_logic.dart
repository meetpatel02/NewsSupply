import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:news_supply/utils/custom_snackbar.dart';
import '../../utils/error.dart';
import 'add_client_state.dart';

class AddClientLogic extends GetxController {
  final AddClientState state = AddClientState();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    readCountryJson();
    getProfileData();
  }

  getProfileData() async {
    // state.profile = await ProfileService().getCurrentProfileData();
    // if(Constant.changeUserAuthId.isEmpty) {
    //   state.userDocId = state.profile.docId.toString();
    // }else{
    //   state.userDocId = Constant.changeUserAuthId;
    // }
    // update();
  }

  void handleButtonTap() {
    if (state.isTap) {
      addClient();
      state.isTap = false;
      update();
      Timer(const Duration(milliseconds: 500), () {
        state.isTap = true;
        update();
      });
    }
  }

  ///Add Client
  addClient() async {
    Map<String, dynamic> data = {
      'businessName': state.nameController.text.trim().toString(),
      'email': state.emailController.text.trim().toString(),
      'number': state.phoneController.text.trim().toString(),
      'clientType': state.clientType,
      'address': state.addressController.text.trim().toString(),
      'country': state.country,
      'state': state.states,
      'city': state.cityController.text.toString(),
      'zipCode': state.zipController.text.toString(),
      'gstNumber': state.gstController.text.trim().toString(),
      'panNumber': state.panController.text.trim().toString(),
      // 'authId': Constant.userAuthId,
      // 'docId': state.newDocRef.id,
      'profileDocId': state.userDocId,
    };
    if (state.nameController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyUsernameValidation,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.emailController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyEmailValidation,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(state.emailController.text)) {
      snackBarView(
          'Error',
          ErrorMessages.inValidEmailValidation,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.phoneController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyNumber,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (!RegExp(r'^\d{10}$|^\d{12}$')
        .hasMatch(state.phoneController.text)) {
      return snackBarView(
          'Error',
          ErrorMessages.emptyNumberValidation,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.clientType.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyClientType,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.addressController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyAddress,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.country.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyCountry,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.states.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyState,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.cityController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyCity,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.zipController.text.isEmpty) {
      snackBarView(
          'Error',
          ErrorMessages.emptyZip,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else if (state.zipController.text.length > 6 &&
        state.zipController.text.length < 6) {
      snackBarView(
          'Error',
          ErrorMessages.emptyZipValid,
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          Colors.red,
          Colors.white);
    } else {
      // db.client.doc(state.newDocRef.id).set(data).then((value) {
      //   Get.back();
      //   update();
      //   snackBarView(
      //       'Successfully',
      //       'Client created',
      //       const Icon(
      //         Icons.task_alt,
      //         color: Colors.white,
      //       ),
      //       ColorConst.green,
      //       Colors.white);
      // });
    }
  }

  ///Country & states method
  Future<void> readCountryJson() async {
    final String response =
        await rootBundle.loadString('assets/file/country.json');
    final data = await json.decode(response);
    state.countryList = data['countries'];
    update();
  }

  // void searchCountry() async {
  //   state.searchCountryList = state.countryList;
  //   // searchResult();
  //   update();
  // }

  // void searchState() async {
  //   state.searchStateList = state.stateList;
  //   searchStateResult();
  //   update();
  // }

  // searchResult() {
  //   var showResult = [];
  //   if (state.searchController.text != '') {
  //     for (var name in state.searchCountryList) {
  //       var names = name['country'].toString().toLowerCase();
  //       if (names.contains(state.searchController.text.toLowerCase())) {
  //         showResult.add(name);
  //       }
  //     }
  //   } else {
  //     showResult = List.from(state.searchCountryList);
  //   }
  //   state.resultCountryList = showResult;
  //   update();
  // }

  // searchStateResult() {
  //   var showResult = [];
  //   if (state.stateSearchController.text != '') {
  //     for (var name in state.searchStateList) {
  //       var names = name.toString().toLowerCase();
  //       if (names.contains(state.stateSearchController.text.toLowerCase())) {
  //         showResult.add(name);
  //       }
  //     }
  //   } else {
  //     showResult = List.from(state.searchStateList);
  //   }
  //   state.resultStateList = showResult;
  //   update();
  // }
}
