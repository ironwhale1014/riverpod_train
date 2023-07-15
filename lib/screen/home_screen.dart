import 'package:flutter/material.dart';
import 'package:riverpod_coding/layout/default_layout.dart';
import 'package:riverpod_coding/screen/auto_screen.dart';
import 'package:riverpod_coding/screen/family_screen.dart';
import 'package:riverpod_coding/screen/futuer_provider_screen.dart';
import 'package:riverpod_coding/screen/listen_provider_screen.dart';
import 'package:riverpod_coding/screen/notifier_provider.dart';
import 'package:riverpod_coding/screen/provider_screen.dart';
import 'package:riverpod_coding/screen/selectScreen.dart';
import 'package:riverpod_coding/screen/state_provider_screen.dart';
import 'package:riverpod_coding/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "home Screen",
        body: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const StateProviderSceen()));
                },
                child: const Text("stateProvider Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const NotifierScreen()));
                },
                child: const Text("Notifier Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const FutureProviderScreen()));
                },
                child: const Text("Future Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const StreamProviderScreen()));
                },
                child: const Text("Stream Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const FamilyModifierScreen()));
                },
                child: const Text("family Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const AutoDisposeScreen()));
                },
                child: const Text("Auto Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const ListenProviderScreen()));
                },
                child: const Text("Listen Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SelectScreen()));
                },
                child: const Text("Select Screen")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ProviderScreen()));
                },
                child: const Text("Provider Screen")),
          ],
        ));
  }
}
