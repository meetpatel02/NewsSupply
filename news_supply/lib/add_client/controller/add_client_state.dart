import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddClientState {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController gstController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController searchController = TextEditingController();
  TextEditingController stateSearchController = TextEditingController();
  String clientType = '';
  String country = '';
  String states = '';
  String countryState = '';
  List searchCountryList = [];
  List searchStateList = [];
  List resultCountryList = [];
  List resultStateList = [];
  List countryList = [];

  bool isTap = true;

  // DocumentReference newDocRef = db.client.doc();
  // final docId = db.client.doc();
  // List stateList = [];
  // Profile profile = Profile();
  var userDocId = '';
  AddClientState() {
    ///Initialize variables
  }
}
