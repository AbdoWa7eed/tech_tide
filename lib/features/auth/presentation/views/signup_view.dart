import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/assets_manager.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';
import 'package:form_validator/form_validator.dart';
import 'package:tech_tide/features/auth/presentation/widgets/custom_wide_button.dart';
import 'package:tech_tide/features/auth/presentation/widgets/labeled_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image(
                image: AssetImage(
                  AssetsManager.signupImagePath,
                ),
                fit: BoxFit.cover, // Ensures the image fits well.
              ),
            ),
            const Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Text(
                        "Tech Tide",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.bold,
                        ),
                      ),
                      Text(
                        "Connect. Collaborate. Code.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230, // Adjust this value to move the Container up or down
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height -
                    200, // Adjust height as needed
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 44),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create a new account on ",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.semiBold,
                              ),
                            ),
                            Text(
                              "TechTide",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.semiBold,
                                color: ColorManager.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),

                        //name text field
                        LabeledTextField(
                          label: "Name",
                          hintText: "Please, enter your name",
                          isObscure: false,
                          validatorFun:
                              ValidationBuilder().minLength(3).build(),
                          controller: _nameController,
                        ),
                        const SizedBox(height: 16),
                        //email text field
                        LabeledTextField(
                          label: "Email",
                          hintText: "Please, enter your email",
                          isObscure: false,
                          validatorFun:
                              ValidationBuilder().email().maxLength(50).build(),
                          controller: _emailController,
                        ),
                        const SizedBox(height: 16),
                        //password text field
                        LabeledTextField(
                          label: "Password",
                          hintText: "Please, enter your password",
                          validatorFun:
                              ValidationBuilder().minLength(6).build(),
                          controller: _passwordController,
                          isObscure: true,
                        ),
                        const SizedBox(height: 16),
                        //confirm password text field
                        LabeledTextField(
                          label: "Confirm password",
                          hintText: "Please, enter your password again",
                          isObscure: true,
                          validatorFun: (value) {
                            if (value != _passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          controller: _confirmPasswordController,
                        ),
                        const SizedBox(height: 30),
                        CustomWideButton(
                          buttonText: "Signup",
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              //Proceed with signup
                              //todo: route to the next view/page
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: FontConstants.fontFamily,
                                fontWeight: FontWeightManager.semiBold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                //todo: login view routing
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: ColorManager.primary,
                                  fontFamily: FontConstants.fontFamily,
                                  fontWeight: FontWeightManager.semiBold,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
