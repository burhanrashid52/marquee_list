import 'package:flutter/material.dart';
import 'package:marquee_list/marquee_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marquee List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MarqueeListPage(),
    );
  }
}

class MarqueeListPage extends StatelessWidget {
  const MarqueeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marquee List'),
      ),
      body: Column(
        children: [
          Text(
            "Breaking News",
            style: theme.textTheme.displaySmall,
          ),
          const SizedBox(height: 8.0),
          MarqueeList(
            children: [
              for (int i = 0; i < breakingNews.length; i++)
                Text(
                  breakingNews[i],
                  style: theme.textTheme.bodyLarge,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

const breakingNews = [
  "AI-driven Automation Threatens to Disrupt Traditional Software Engineering Roles.",
  "Software Engineers Face Job Displacement as AI Takes Over Routine Tasks.",
  "AI Transforming Software Development Lifecycle, Redefining Industry Norms.",
  "AI's Rise in Software Engineering Sparks Debate Over Future Job Prospects.",
  "Software Engineers Brace for Impact as AI Continues to Reshape Industry.",
];
