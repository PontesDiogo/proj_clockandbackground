import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WallpaperClockScreen(),
      title: 'Relógio com Papel de Parede',
    );
  }
}

class WallpaperClockScreen extends StatefulWidget {
  const WallpaperClockScreen({super.key});

  @override
  WallpaperClockScreenState createState() => WallpaperClockScreenState();
}

class WallpaperClockScreenState extends State<WallpaperClockScreen> {
  late String _currentTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    updateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => updateTime(),
    );
  }

  void updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  String getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/wallpaper.jpg', fit: BoxFit.cover),
          Center(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _currentTime,
                style: const TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(blurRadius: 10, color: Colors.black),
                  ]
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}
