import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/content_card.dart';
import 'package:shopping_list_light_off/home_screen/presentation/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 14,
            children: [
              Center(child: Text('Pinned')),
              ContentCard(),
              ContentCard(),
              ContentCard(),
              ContentCard(),
            ],
          ),
        ),
      ),
    );
  }
}
