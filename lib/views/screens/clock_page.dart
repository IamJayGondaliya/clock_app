import 'dart:math';

import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime d = DateTime.now();

  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock Page"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //allDials
            ...List.generate(
              60,
              (index) => Transform.rotate(
                angle: index * (pi * 2) / 60,
                child: Divider(
                  endIndent:
                      index % 5 == 0 ? size.width * 0.88 : size.width * 0.9,
                  thickness: 2,
                  color: index % 5 == 0 ? Colors.red : Colors.grey,
                ),
              ),
            ),
            //hourHand
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: d.hour * (pi * 2) / 12,
                child: Divider(
                  indent: 50,
                  endIndent: size.width * 0.5 - 16,
                  color: Colors.black,
                  thickness: 4,
                ),
              ),
            ),
            //minuteHand
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: d.minute * (pi * 2) / 60,
                child: Divider(
                  indent: 30,
                  endIndent: size.width * 0.5 - 16,
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
            ),
            //secondHand
            Transform.rotate(
              angle: pi / 2,
              child: Transform.rotate(
                angle: d.second * (pi * 2) / 60,
                child: Divider(
                  indent: 20,
                  endIndent: size.width * 0.5 - 16,
                  color: Colors.red,
                  thickness: 2,
                ),
              ),
            ),
            //dot
            const CircleAvatar(
              radius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
