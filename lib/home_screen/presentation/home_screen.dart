import 'package:flutter/material.dart';
import 'package:shopping_list_light_off/home_screen/model/card_view_model.dart';
import 'package:shopping_list_light_off/shared/widgets/app_chip.dart';
import 'widgets/widget.dart';

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
              Row(
                spacing: 10,
                children: [
                  AppChip(data: 'All', isSelected: true),
                  AppChip(data: 'Pinned'),
                  AppChip(data: 'Recent'),
                  AppChip(data: 'Shared'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(child: Text('Pinned')),
              ),
              ContentCard(data: CardDetailsSource.firstExample),
              ContentCard(data: CardDetailsSource.secondExample),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(child: Text('Recent')),
              ),
              ContentCard(data: CardDetailsSource.firstExample),
            ],
          ),
        ),
      ),
    );
  }
}
