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
    final credits = creditMap.entries;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marquee List'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8.0),
          Text(
            "Breaking News",
            style: theme.textTheme.displaySmall,
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 50,
            child: MarqueeList(
              onScrollEnd: () {},
              children: [
                for (int i = 0; i < breakingNews.length; i++)
                  Text(
                    breakingNews[i],
                    style: theme.textTheme.titleMedium,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 36.0),
          Text(
            "Dune (2021) Credits",
            style: theme.textTheme.displaySmall,
          ),
          Expanded(
            child: MarqueeList(
              scrollDirection: Axis.vertical,
              scrollDuration: const Duration(seconds: 3),
              children: [
                for (final item in credits) ...[
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: item.key,
                      style: theme.textTheme.titleLarge,
                      children: [
                        TextSpan(
                          text: "\n${item.value.join("\n")}",
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ]
              ],
            ),
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

const creditMap = <String, List<String>>{
  "Director": ["Denis Villeneuve"],
  "Writers": ["Jon", "Denis Villeneuve", "Eric Roth"],
  "Based on the novel by": ["Frank Herbert"],
  "Producers": [
    "Cale Boyter",
    "Joe Caracciolo Jr.",
    "Mary Parent",
    "Denis Villeneuve"
  ],
  "Music": ["Hans Zimmer"],
  "Cast": [
    "Timothée Chalamet as Paul Atreides",
    "Rebecca Ferguson as Lady Jessica",
    "Oscar Isaac as Duke Leto Atreides",
    "Josh Brolin as Gurney Halleck",
    "Stellan Skarsgård as Baron Vladimir Harkonnen",
    "Dave Bautista as Glossu 'Beast' Rabban",
    "Stephen McKinley Henderson as Thufir Hawat",
    "Zendaya as Chani",
    "Chang Chen as Dr. Wellington Yueh",
    "Sharon Duncan-Brewster as Dr. Liet-Kynes",
    "Charlotte Rampling as Reverend Mother Gaius Helen Mohiam",
    "Jason Momoa as Duncan Idaho",
    "Javier Bardem as Stilgar"
  ],
  "Screenplay": ["Jon Spaihts"],
  "Cinematography": ["Greig Fraser"],
  "Production Design": ["Patrice Vermette"],
  "Costume Design": ["Jacqueline West"],
  "Editing": ["Joe Walker"],
  "Visual Effects": ["Paul Lambert"],
  "Sound": ["Theo Green"],
  "Makeup": ["Donald Mowat"],
  "Executive Producers": [
    "Tanya Lapointe",
    "Joshua Grode",
    "Thomas Tull",
    "Brian Herbert",
    "Kim Herbert",
    "Byron Merritt",
    "Jon Spaihts"
  ]
};
