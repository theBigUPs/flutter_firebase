import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/countries_viewmodel.dart';
import 'package:flutter_firebase/view_models/register_viewmodel.dart';
import 'package:flutter_firebase/views/countries_page.dart';
import 'package:flutter_firebase/views/register_page.dart';
import 'package:provider/provider.dart';

class LoginViewModel with ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance;



  void loginUser(String email,String password,BuildContext context) async
  {
    try {

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //print(_auth.currentUser.toString());
      //_auth.signOut();
      goToCountriesPage(context);
    } on FirebaseAuthException catch(e) {

      print(e.message); 

    }
     
  }

  void goToRegisterPage(BuildContext context) 
  {
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) { return ChangeNotifierProvider(
        create: (context) {return RegisterViewModel();},
        child: const RegisterPage(),
      );},);
    Navigator.pushReplacement(context, newRoute);
  }

  void goToCountriesPage(BuildContext context)
  {
    if (_auth.currentUser!=null) {
      MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context){return ChangeNotifierProvider(
        create:(context){return CountriesViewModel();},
        child: const CountriesPage(),
      );},);
      Navigator.pushReplacement(context, newRoute);
    }
    
  }

}