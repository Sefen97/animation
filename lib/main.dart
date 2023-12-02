import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.linearToEaseOut);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Animation"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Center(
              //   child: RotationTransition(
              //     turns: _animation,
              //     child: const FlutterLogo(size: 150),
              //   ),
              // ),
              Builder(
                  builder: (context) => InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TestNavigateHero()));
                      },
                      child: const Hero(
                          tag: 'To_Flutter', child: FlutterLogo(size: 50)))),
            ],
          ),
        ),
      ),
    );
  }
}

class TestNavigateHero extends StatefulWidget {
  const TestNavigateHero({super.key});

  @override
  State<TestNavigateHero> createState() => _TestNavigateHeroState();
}

class _TestNavigateHeroState extends State<TestNavigateHero> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: "To_Flutter", child: FlutterLogo(size: 150)),
            FadeInImage(placeholder: AssetImage(''), image: NetworkImage(''))
          ],
        ),
      ),
    );
  }
}
