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

      // ONLY ONE body: SHOULD BE UNCOMMENTED AT A TIME

      // ===== 1. ROW - MainAxisAlignment =====
      // Change both the title and the mainAxisAlignment line:
      // center, spaceAround, spaceBetween, spaceEvenly, start, end
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Row - MainAxisAlignment.center'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // <-- change this
            children: [
              Container(width: 50, height: 50, color: Colors.red),
              Container(width: 50, height: 50, color: Colors.yellow),
              Container(width: 50, height: 50, color: Colors.blue),
            ],
          ),
        ],
      ),

      // ===== 2. ROW - CrossAxisAlignment =====
      // Change both the title and the crossAxisAlignment line:
      // start, end, baseline, center, stretch
      // (for baseline, also uncomment the textBaseline line)
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     const Text('Row - CrossAxisAlignment.start'),
      //     SizedBox(
      //       height: 200,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start, // <-- change this
      //         // textBaseline: TextBaseline.alphabetic,     // <-- only for baseline
      //         children: [
      //           Container(color: Colors.red, child: const Text('A', style: TextStyle(fontSize: 20))),
      //           Container(color: Colors.yellow, child: const Text('B', style: TextStyle(fontSize: 40))),
      //           Container(color: Colors.blue, child: const Text('C', style: TextStyle(fontSize: 60))),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      // ===== 3. COLUMN - MainAxisAlignment =====
      // Change both the title and the mainAxisAlignment line:
      // center, spaceAround, spaceBetween, spaceEvenly, start, end
      // body: Column(
      //   children: [
      //     const Text('Column - MainAxisAlignment.center'),
      //     Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center, // <-- change this
      //         children: [
      //           Container(width: 50, height: 50, color: Colors.red),
      //           Container(width: 50, height: 50, color: Colors.yellow),
      //           Container(width: 50, height: 50, color: Colors.blue),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      // ===== 4. COLUMN - CrossAxisAlignment =====
      // Change both the title and the crossAxisAlignment line:
      // start, end, baseline, center, stretch
      // (for baseline, also uncomment the textBaseline line)
      // body: Column(
      //   children: [
      //     const Text('Column - CrossAxisAlignment.start'),
      //     Expanded(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.start, // <-- change this
      //         // textBaseline: TextBaseline.alphabetic,     // <-- only for baseline
      //         children: [
      //           Container(color: Colors.red, child: const Text('A', style: TextStyle(fontSize: 20))),
      //           Container(color: Colors.yellow, child: const Text('B', style: TextStyle(fontSize: 40))),
      //           Container(color: Colors.blue, child: const Text('C', style: TextStyle(fontSize: 60))),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
