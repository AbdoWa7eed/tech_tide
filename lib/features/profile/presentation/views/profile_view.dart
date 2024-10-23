import 'package:flutter/material.dart';
import 'package:tech_tide/core/res/color_manager.dart';
import 'package:tech_tide/core/res/font_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.primary,
        body: Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage("assets/images/user.png"),
                              height: 74,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Ahmed Yasser",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeightManager.semiBold,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 24,
                                )),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.blueGrey,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hello, I'm Ahmed",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeightManager.regular,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 11),
                    Container(
                      color: Colors.lightBlueAccent,
                      height: 80,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "100",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.semiBold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Posts",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "5",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.semiBold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Replies",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.semiBold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "Votes",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeightManager.regular,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(26),
                            topLeft: Radius.circular(26),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
