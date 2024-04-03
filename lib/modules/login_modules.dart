import 'package:flutter/material.dart';
import '../shared/components/components.dart';

// ignore: must_be_immutable
class LoginModule extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginModule({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Padding(
        padding: const EdgeInsets.all(20),
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
                outLineBorder: false,
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
                outLineBorder: false,
                isPassword: true,
                prefixIconColor: Colors.blue,
              ),
              const SizedBox(
                height: 100,
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
      ),
    );
  }
}
