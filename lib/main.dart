import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_coding/riverpod/provider_observer.dart';
import 'package:riverpod_coding/screen/home_screen.dart';

final logger = Logger();

void main() {
  runApp(ProviderScope(
      observers: [Logger1()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      )));
}
