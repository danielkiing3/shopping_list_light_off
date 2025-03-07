import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/card_view_model.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(child: Text('Pinned')),
              ),
              //TODO: Extract the CardViewModel to a more center location
              ContentCard(
                data: CardViewModel(
                  daysAgo: 2,
                  bookmark: 14,
                  contentTitle: ContentTitle(
                    title: 'Sunday Brunch Prep',
                    subtitle: 'Ready for fresh crossiants and OJ!',
                  ),
                  displayImages: [
                    'assets/images/1.png',
                    'assets/images/2.png',
                    'assets/images/3.png',
                  ],
                  allImages: [],
                ),
              ),
              ContentCard(
                data: CardViewModel(
                  daysAgo: 1,
                  bookmark: 8,
                  contentTitle: ContentTitle(
                    title: 'Healthy Eats',
                    subtitle: 'Vibes and inshallah',
                  ),
                  displayImages: [
                    'assets/images/4.png',
                    'assets/images/5.png',
                    'assets/images/6.png',
                  ],
                  allImages: [],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(child: Text('Recent')),
              ),
              ContentCard(
                data: CardViewModel(
                  daysAgo: 2,
                  bookmark: 14,
                  contentTitle: ContentTitle(
                    title: 'Sunday Brunch Prep',
                    subtitle: 'Ready for fresh crossiants and OJ!',
                  ),
                  displayImages: [
                    'assets/images/1.png',
                    'assets/images/2.png',
                    'assets/images/3.png',
                  ],
                  allImages: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
