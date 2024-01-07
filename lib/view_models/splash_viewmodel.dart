import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/countries_viewmodel.dart';
import 'package:flutter_firebase/view_models/login_viewmodel.dart';
import 'package:flutter_firebase/views/countries_page.dart';
import 'package:flutter_firebase/views/login_page.dart';
import 'package:provider/provider.dart';

class SplashViewModel with ChangeNotifier
{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  void redirect(BuildContext context)
  {
    if (_auth.currentUser != null) {
      _goToCountriesPage(context);
    }
    else
    {
      _goToLoginPage(context);
    }
  }
  void _goToCountriesPage(BuildContext context)
  {
    
      MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context){return ChangeNotifierProvider(
        create:(context){return CountriesViewModel();},
        child: const CountriesPage(),
      );},);
      Navigator.pushReplacement(context, newRoute);
    
    
  }
  void _goToLoginPage(BuildContext context) {
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) { return ChangeNotifierProvider(
        create: (context) {return LoginViewModel();},
        child: const LoginPage(),
      );},);
    Navigator.pushReplacement(context, newRoute);
  }
}