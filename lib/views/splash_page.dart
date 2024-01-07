import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel=Provider.of(context,);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.redirect(context);
    });
    
    return const FlutterLogo(size: 56,);
    
    //viewModel.redirect(context); 
  }
}