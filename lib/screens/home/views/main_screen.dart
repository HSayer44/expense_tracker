import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:  BoxDecoration(shape: BoxShape.circle, color: Colors.yellow[700]),
                    ),
                    Icon(CupertinoIcons.person_fill, color: Colors.yellow[900],)
                  ],
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: colorTheme.outline),
                    ),
                    Text(
                      'John Doe',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorTheme.onBackground),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                IconButton(onPressed: () {
                  
                }, icon: const Icon(CupertinoIcons.settings))
              ],
            )
          ],
        ),
      ),
    );
  }
}
