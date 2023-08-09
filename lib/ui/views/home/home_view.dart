import 'package:fluter_template/ui/shared/custom_widget/custom_button.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomButton(
            width: 200,
            height: 300,
            backgroundColor: Colors.green,
            title: 'Hello',
          )
        ],
      ),
    );
  }
}
