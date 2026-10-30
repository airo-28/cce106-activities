import 'package:flutter/material.dart';

class MainCrossAlignments extends StatelessWidget {
  const MainCrossAlignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK 5 - PARONDO'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),

      // ONLY ONE body: SHOULD BE ACTIVE AT A TIME
      // Comment out the active one, uncomment the next, then hot restart.

      // ===== 1. MainAxisAlignment.center =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.center'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 2. MainAxisAlignment.spaceAround =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.spaceAround'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 3. MainAxisAlignment.spaceBetween =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.spaceBetween'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 4. MainAxisAlignment.spaceEvenly =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.spaceEvenly'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 5. MainAxisAlignment.start =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.start'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 6. MainAxisAlignment.end =====
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('MainAxisAlignment.end'),
      //     const SizedBox(height: 20),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.yellow),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //   ],
      // ),

      // ===== 7. CrossAxisAlignment.start =====
      // body: SizedBox(
      //   width: double.infinity,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       const Text('CrossAxisAlignment.start'),
      //       const SizedBox(height: 20),
      //       Container(
      //         margin: const EdgeInsets.only(left: 50),
      //         width: 50,
      //         height: 50,
      //         color: Colors.red,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.only(left: 50),
      //         width: 50,
      //         height: 50,
      //         color: Colors.yellow,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.only(left: 50),
      //         width: 50,
      //         height: 50,
      //         color: Colors.blue,
      //       ),
      //     ],
      //   ),
      // ),

      // ===== 8. CrossAxisAlignment.center =====
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('CrossAxisAlignment.center'),
            const SizedBox(height: 20),
            Container(width: 50, height: 50, color: Colors.red),
            Container(width: 50, height: 50, color: Colors.yellow),
            Container(width: 50, height: 50, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
