import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/register_viewmodel.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController=TextEditingController();
    final passwordController=TextEditingController();
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
                RegisterViewModel viewModel = Provider.of(
                  context,
                  listen: false,
                );
                viewModel.registerUser(emailController.text.trim(),passwordController.text.trim(),context);
                //print(emailController.text);
                //print(passwordController.text);
              }, 
              child: const Text("register")
            ),
            TextButton(onPressed: (){
              RegisterViewModel viewmodel =Provider.of(context,listen: false);
              viewmodel.goToLoginPage(context);
            }, child: const Text("login"))
          ]
        ),
      )
    );
  }
}