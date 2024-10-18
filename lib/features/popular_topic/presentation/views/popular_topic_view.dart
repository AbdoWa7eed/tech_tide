import 'package:flutter/material.dart';
import 'package:tech_tide/core/widgets/gradiant_app_bar.dart';
import 'package:tech_tide/features/popular_topic/presentation/widgets/popular_topic_view_body.dart';

class PopularTopicView extends StatelessWidget {
  const PopularTopicView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GradientAppBar(title: "C++"),
      body: PopularTopicViewBody(),
    );
  }
}
