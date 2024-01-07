import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final emailController=TextEditingController();
    final passwordController=TextEditingController();
    //viewModel.goToCountriesPage(context);
    return Scaffold(
      body:SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[

            TextField(
              controller: emailController,
            ),
            TextField(
              controller: passwordController,
            ),

            ElevatedButton(onPressed: ()
              {
                LoginViewModel viewModel = Provider.of(
                  context,
                  listen: false,
                );
                viewModel.loginUser(emailController.text.trim(),passwordController.text.trim(),context);
                //print(emailController.text);
                //print(passwordController.text);
              }, 
              child: const Text("login")
            ),
            TextButton(onPressed: (){
              LoginViewModel viewmodel =Provider.of(context,listen: false);
              viewmodel.goToRegisterPage(context);
            }, child: const Text("Register"))
          ]
        ),
      )
    );
  }
}