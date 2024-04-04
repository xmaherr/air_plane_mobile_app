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
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: const Offset(0, 0), // Offset
                                    ),
                                  ],
                                ),
                                width: 150,
                                child: TextFormField(
                                  controller: firstNameController,
                                  keyboardType: TextInputType.name,
                                  onFieldSubmitted: (value) {},
                                  decoration: const InputDecoration(
                                      labelText: 'first name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.person)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'first name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50.0,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius: 2, // Spread radius
                                      blurRadius: 5, // Blur radius
                                      offset: const Offset(0, 0), // Offset
                                    ),
                                  ],
                                ),
                                width: 150,
                                child: TextFormField(
                                  controller: lastNameController,
                                  keyboardType: TextInputType.name,
                                  onFieldSubmitted: (value) {},
                                  decoration: const InputDecoration(
                                      labelText: 'last name',
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      border: InputBorder.none,
                                      prefixIcon: Icon(Icons.person)),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'last name is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: const Offset(0, 0), // Offset
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {},
                              decoration: const InputDecoration(
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email_outlined)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email Address is required';
                                } else if (!isEmailAddressValid(value)) {
                                  return 'this email is used';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: const Offset(0, 0), // Offset
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: phoneNumberController,
                              keyboardType: TextInputType.phone,
                              onFieldSubmitted: (value) {},
                              decoration: const InputDecoration(
                                  labelText: 'Phone Number',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.phone)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Phone is required';
                                } else if (!isPhoneNumberValid(value)) {
                                  return 'this phone number used';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: const Offset(0, 0), // Offset
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              controller: passwordController,
                              onFieldSubmitted: (value) {},
                              decoration: const InputDecoration(
                                  labelText: 'password',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'pasword is required';
                                } else if (value != passwordController2.text) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius: 2, // Spread radius
                                  blurRadius: 5, // Blur radius
                                  offset: const Offset(0, 0), // Offset
                                ),
                              ],
                            ),
                            child: TextFormField(
                              obscureText: true,
                              controller: passwordController2,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (value) {},
                              decoration: const InputDecoration(
                                  labelText: 'password',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.lock)),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter password again';
                                } else if (value!= passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          defultButton(
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
                              const Text('have an account?'),
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
