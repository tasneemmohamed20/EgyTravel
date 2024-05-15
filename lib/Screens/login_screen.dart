import 'package:egy_travel/Shared/shared_button.dart';
import 'package:egy_travel/constants/app_assets.dart';
import 'package:egy_travel/constants/colors_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsManager.primary.withOpacity(1),
        appBar: AppBar(
          title: Text(
            "Login",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorsManager.primary.withOpacity(1)),
          ),
          centerTitle: true,
          backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
          leading: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              Assets.backicon,
              height: 16,
              width: 16,
              fit: BoxFit.contain,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 16, 32),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login and start your journey with EgyTravel.',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color:
                                    ColorsManager.secondPrimary.withOpacity(1)),
                          ))),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
            ),
            CustomButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
              },
              padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: (MediaQuery.of(context).size.width * 0.4)),
              backgroundColor: ColorsManager.secondPrimary.withOpacity(1),
              text: 'Login',
            ),
            Center(
              child: TextButton(
                child: Text(
                  'Forget password?',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorsManager.secondPrimary,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.07),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.check_box_rounded)),
                  Text(
                    'Remember me',
                    style: TextStyle(
                        color: ColorsManager.secondPrimary,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('You don’t have an account?'),
              TextButton(
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: ColorsManager.secondPrimary,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {},
              ),
            ])
          ],
        ),
      ),
    );
  }
}
