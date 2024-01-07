import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/country.dart';

class CountriesViewModel with ChangeNotifier
{
  List<Country> countries=[];

  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;


  void addCountry(BuildContext context, name,String? capital)async
  {
    Country country = Country( name , capital ?? "no capital");
    await _store.collection("countries").doc().set(country.toMap());
    //Navigator.pop(context);
    getCountries();
  }

  void getCountries()async
  {
    countries.clear();
    QuerySnapshot<Map<String,dynamic>> snapshot=await _store.collection("countries").get();
    for (QueryDocumentSnapshot<Map<String, dynamic>> querySnapshot  in snapshot.docs) {
      Country country = Country.fromMap(
        querySnapshot.id, 
        querySnapshot.data());
      countries.add(country);
    }
    notifyListeners();
  }


  void signoff() async
  {
    await _auth.signOut();
  }
}