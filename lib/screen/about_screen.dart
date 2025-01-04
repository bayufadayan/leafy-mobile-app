import 'package:flutter/material.dart';
import 'package:iot_app/components/build_components_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tim Pengembang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006769),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
          ),
          children: [
            buildComponent(
              title: 'M. Bayu Fadayan',
              desc: '065121100',
              image: 'images/profiles/bay.jpg',
              showDesc: true,
            ),
            buildComponent(
              title: 'Fathur P. Shodikin',
              desc: '065121103',
              image: 'images/profiles/tur.jpeg',
              showDesc: true,
            ),
            buildComponent(
              title: 'Rafly R. Amtiar',
              desc: '065121107',
              image: 'images/profiles/pli.jpeg',
              showDesc: true,
            ),
            buildComponent(
              title: 'Apriyan Fillah G',
              desc: '065121109',
              image: 'images/profiles/yan.jpeg',
              showDesc: true,
            ),
            buildComponent(
              title: 'Zidan Al Rasyid',
              desc: '065121112',
              image: 'images/person.png',
              showDesc: true,
            ),
          ],
        ),
      ),
    );
  }
}
