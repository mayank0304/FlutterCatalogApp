import 'package:catalog_app/widgets/mydrawer.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/utils/logincred.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      drawer: const Mydrawer(),
      body: Center(
        child: Text("Welcome to the catalog app, $name"),
      ),
    );
  }
}
