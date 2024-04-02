import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../shared/components/components.dart';

class LoginPageLayout extends StatelessWidget {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[400] ?? Colors.white,
              Colors.blue[200] ?? Colors.white,
              Colors.blue[100] ?? Colors.white,
              Colors.blue[50] ?? Colors.white,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Welcome to MARO Are Line',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              defultFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Email Address is required";
                                  }
                                },
                                prefix: Icons.email,
                                label: "Email Address",
                                outLineBorder: false,
                                prefixIconColor: Colors.blue,
                              ),
                              SizedBox(
                                height: 60.0,
                              ),
                              defultFormField(
                                controller: emailController,
                                type: TextInputType.emailAddress,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return "Password is required";
                                  }
                                },
                                prefix: Icons.lock,
                                label: "Password",
                                outLineBorder: false,
                                isPassword: true,
                                prefixIconColor: Colors.blue,
                              ),
                              SizedBox(
                                height:70 ,
                              ),
                              defultButton(
                                function: ()
                                {
                                  if(formKey.currentState!.validate())
                                  {
                                    print('object');
                                  }
                                },
                                text: 'LOGIN',
                                radius:15,
                                textSize: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      'Don\' have an account?'
                                  ),
                                  TextButton(
                                      onPressed:(){},
                                      child: Text(
                                        'Register Now',
                                        style: TextStyle(
                                            color: Colors.grey
                                        ),
                                      )
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
