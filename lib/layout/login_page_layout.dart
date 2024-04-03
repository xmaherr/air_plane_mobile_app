import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class LoginPageLayout extends StatefulWidget {
  const LoginPageLayout({super.key});

  @override
  State<LoginPageLayout> createState() => _LoginPageLayoutState();
}

class _LoginPageLayoutState extends State<LoginPageLayout> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[400] ?? Colors.white,
              Colors.blue[200] ?? Colors.white,
              Colors.blue[100] ?? Colors.white,
              Colors.blue[100] ?? Colors.white,
              Colors.blue[50] ?? Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Welcome to Omar Airlines',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 40, right: 40),
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
                              return null;
                            },
                            prefix: Icons.email,
                            label: "Email Address",
                            outLineBorder: true,
                            prefixIconColor: Colors.blue,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defultFormField(
                            controller: passwordController,
                            type: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                            prefix: Icons.lock,
                            label: "Password",
                            outLineBorder: true,
                            isPassword: isPassword,
                            prefixIconColor: Colors.blue,
                            suffex: IconButton(
                              onPressed: () {
                                isPassword = !isPassword;
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_red_eye,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          defultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                // Perform action upon successful validation
                                // For example, navigate to another screen
                                Navigator.pushNamed(context, '/home');
                              }
                            },
                            text: 'LOGIN',
                            radius: 15,
                            textSize: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Don\'t have an account?'),
                              TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Register Now',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
