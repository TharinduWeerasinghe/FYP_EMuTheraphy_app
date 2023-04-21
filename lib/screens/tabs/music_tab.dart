import 'package:flutter/material.dart';

import '/colors.dart';
import '/screens/pages/add_music_page.dart';

class MusicTab extends StatefulWidget {
  const MusicTab({Key? key}) : super(key: key);

  @override
  State<MusicTab> createState() => _MusicTabState();
}

class _MusicTabState extends State<MusicTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text("Music Gallery", style: TextStyle(fontSize: 22, color: mainFontColor, fontWeight: FontWeight.bold,),)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ],
          ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MusicAddPage()),
              );
            },
            label: const Text('Add Music'),
            icon: const Icon(Icons.add_circle_rounded),
            backgroundColor: darkOrangeColor,
          ),
        ),
      ]
    );
  }
}
