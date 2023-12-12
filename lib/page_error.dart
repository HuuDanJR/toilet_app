import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  const PageError({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(child:Text('something went wrong')),
      ),
    );
  }
}