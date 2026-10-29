import 'package:flutter/material.dart';

class EdgeInsetsDemo extends StatelessWidget {
  const EdgeInsetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Parondo_edge_insets')),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // EdgeInsets.all
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(30),
              child: const Text('EdgeInsets.all(30)'),
            ),

            const SizedBox(height: 20),

            // EdgeInsets.symmetric
            Container(
              color: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: const Text(
                'EdgeInsets.symmetric(horizontal: 40, vertical: 10)',
              ),
            ),

            const SizedBox(height: 20),

            // EdgeInsets.only
            Container(
              color: Colors.blue,
              padding: const EdgeInsets.only(
                left: 30,
                top: 10,
                right: 5,
                bottom: 20,
              ),
              child: const Text(
                'EdgeInsets.only(left: 30, top: 10, right: 5, bottom: 20)',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            // EdgeInsets.fromLTRB
            Container(
              color: Colors.green,
              padding: const EdgeInsets.fromLTRB(10, 20, 30, 40),
              child: const Text(
                'EdgeInsets.fromLTRB(10, 20, 30, 40)',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
