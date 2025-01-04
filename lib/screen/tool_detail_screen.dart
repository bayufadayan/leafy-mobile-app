import 'package:flutter/material.dart';
import 'package:iot_app/components/build_components_card.dart';

class ToolDeatilScreen extends StatelessWidget {
  const ToolDeatilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alat dan Bahan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF006769),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 10.0,
          ),
          children: [
            buildComponent(
              title: 'NodeMCU ESP8266',
              desc: 'xxxx',
              image: 'images/materials/esp8266.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Relay',
              desc: 'xxxx',
              image: 'images/materials/relay.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Mini DC Water Pump',
              desc: 'xxxx',
              image: 'images/materials/pump.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Soil Moisture Sensor',
              desc: 'xxxx',
              image: 'images/materials/soil.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'LCD 16x2 I2C',
              desc: 'xxxx',
              image: 'images/materials/lcd.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'DHT11',
              desc: 'xxxx',
              image: 'images/materials/dht11.jpg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Breadboard',
              desc: 'xxxx',
              image: 'images/materials/breadboard.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Kabel Jumper',
              desc: 'xxxx',
              image: 'images/materials/jumper.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Baterai',
              desc: 'xxxx',
              image: 'images/materials/batre.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Arduino IDE',
              desc: 'xxxx',
              image: 'images/materials/arduino.jpeg',
              showDesc: false,
            ),
            buildComponent(
              title: 'Flutter',
              desc: 'xxxx',
              image: 'images/materials/flutter2.png',
              showDesc: false,
            ),
            buildComponent(
              title: 'Firebase',
              desc: 'xxxx',
              image: 'images/materials/firebase.jpeg',
              showDesc: false,
            ),
          ],
        ),
      ),
    );
  }
}
