import 'package:flutter/material.dart';
import '../widgets/meditation_card.dart';
import '../utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Hey Sweetie!",
                    style: kLargeTextStyle,
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "What's your mood today?",
                  style: kMeduimTextStyle,
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 30,
                  children: const [
                    MeditationCard(
                      title: 'Meditate',
                      description: 'Breath',
                      image: 'meditation.png',
                      onPressed: null,
                    ),
                    MeditationCard(
                      title: 'Relax',
                      description: 'Read book',
                      image: 'relax.png',
                      onPressed: null,
                    ),
                    MeditationCard(
                      title: 'Focus',
                      description: 'Goals',
                      image: 'focus.png',
                      onPressed: null,
                    ),
                    MeditationCard(
                      title: 'Study',
                      description: 'Learn sth',
                      image: 'study.png',
                      onPressed: null,
                    ),
                    MeditationCard(
                      title: 'Sleep',
                      description: 'Good night',
                      image: 'sleep.png',
                      onPressed: null,
                    ),
                    MeditationCard(
                      title: 'Brain',
                      description: 'Power',
                      image: 'brain.png',
                      onPressed: null,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
