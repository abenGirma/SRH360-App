import 'package:flutter/material.dart';
import 'package:srh360app/gen/assets.gen.dart';
import 'package:srh360app/gen/colors.gen.dart';
import 'package:srh360app/presentation/pages/sign_up_page.dart';
import 'package:srh360app/presentation/widgets/common_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Center(
            child: Column(
              children: [
                const LinearProgressIndicator(
                  value: 0.33,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      Text(
                        'SRH360',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(
                        height: 160,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Assets.images.placeHolder.image(
                          width: 150,
                          height: 150,
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'Welcome to SRH360',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      CommonButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'GET STARTED',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
