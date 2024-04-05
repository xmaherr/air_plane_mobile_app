import 'package:air_plane/DB/db.dart';
import 'package:air_plane/layout/login_page_layout.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../shared/components/components.dart';

class RegisterScreenLayout extends StatefulWidget {
  const RegisterScreenLayout({super.key});

  @override
  State<RegisterScreenLayout> createState() => _RegisterScreenLayoutState();
}

class _RegisterScreenLayoutState extends State<RegisterScreenLayout> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var passwordController2 = TextEditingController();

  var phoneNumberController = TextEditingController();

  var firstNameController = TextEditingController();

  var lastNameController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  //bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                        'Register',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Register now at MARO Airlines',
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
                      topRight: Radius.circular(60),
                    ),
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 60, left: 30, right: 30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              defaultFormField(
                                width: 150,
                                controller: firstNameController,
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'first name is required';
                                  }
                                  return null;
                                },
                                prefixIcon: const Icon(Icons.person),
                                label: 'first name',
                              ),
                              const SizedBox(
                                width: 30.0,
                              ),
                              defaultFormField(
                                width: 150,
                                controller: lastNameController,
                                textInputType: TextInputType.name,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'last name is required';
                                  }
                                  return null;
                                },
                                prefixIcon: const Icon(Icons.person),
                                label: 'last name',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Email Address is required";
                              }
                              return null;
                            },
                            prefixIcon: const Icon(Icons.email),
                            label: "Email Address",
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                            controller: phoneNumberController,
                            textInputType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Phone is required';
                              } else if (!isPhoneNumberValid(value)) {
                                return 'this phone number used';
                              }
                              return null;
                            },
                            prefixIcon: const Icon(Icons.phone),
                            label: 'Phone Number',
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                            controller: passwordController,
                            textInputType: TextInputType.text,
                            validator:  (value) {
                              if (value!.isEmpty) {
                                return 'password is required';
                              } else if (value != passwordController2.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            prefixIcon: const Icon(Icons.lock),
                            label: "password",
                            suffixIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: Icon(
                                isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            isPassword: isPassword,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultFormField(
                            controller: passwordController2,
                            textInputType: TextInputType.text,
                            validator:  (value) {
                              if (value!.isEmpty) {
                                return 'password is required';
                              } else if (value != passwordController.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            prefixIcon: const Icon(Icons.lock),
                            label: "confirm password",
                            suffixIconButton: IconButton(
                              onPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              icon: Icon(
                                isPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            isPassword: isPassword,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                addUser(User(
                                  firstNameController.text,
                                  lastNameController.text,
                                  emailController.text,
                                  phoneNumberController.text,
                                  passwordController.text,
                                ));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginScreenLayout(),
                                  ),
                                );
                              }
                            },
                            text: 'Register',
                            radius: 15,
                            textSize: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'have already an account?',
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigate to the register screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreenLayout(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
