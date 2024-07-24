import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:srh360app/gen/assets.gen.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/presentation/pages/course_page.dart';
import 'package:srh360app/presentation/widgets/common_button.dart';
import 'package:srh360app/presentation/widgets/common_textfield.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: ColorName.secondaryColor.withOpacity(0.3),
        surfaceTintColor: ColorName.secondaryColor.withOpacity(0.3),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorName.secondaryColor.withOpacity(0.3),
                  ColorName.secondaryColor.withOpacity(0.5),
                  ColorName.secondaryColor,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      color: Colors.black38,
                    ),
                    const SizedBox(height: 150),
                    _buildMiddle(),
                    const SizedBox(height: 150),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Your Passoword?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: Colors.black87,
                                ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildMiddle() {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Assets.images.placeHolder.image(
            width: 120,
            height: 120,
          ),
        ),
        const SizedBox(height: 20),
        CommonTextField(
          validator: (text) {
            if (text!.isEmpty) {
              return 'Email is Empty';
            } else if (text.isEmail == false) {
              return 'Email is not valid';
            }
            return '';
          },
          controller: emailController,
          hintText: 'Email Address',
        ),
        CommonTextField(
          validator: (text) {
            if (text!.isEmpty) {
              return 'Password is Empty';
            }
            return '';
          },
          isObscure: true,
          controller: passwordController,
          hintText: 'Password',
        ),
        const SizedBox(height: 30),
        CommonButton(
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            
            // }
              Get.to(CoursesScreen());
          },
          child: Text(
            'SIGN IN',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}