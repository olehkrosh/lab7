import 'package:flutter/material.dart';

class RgbSquareWidget extends StatefulWidget {
  const RgbSquareWidget({super.key});

  @override
  State<RgbSquareWidget> createState() => _RgbSquareWidgetState();
}

class _RgbSquareWidgetState extends State<RgbSquareWidget> {
  double _red = 0;
  double _green = 0;
  double _blue = 0;

  void _updateColor(String channel, double value) {
    setState(() {
      switch (channel) {
        case 'red':
          _red = value;
          break;
        case 'green':
          _green = value;
          break;
        case 'blue':
          _blue = value;
          break;
      }
    });
  }

  Widget _buildSlider(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('$label: ', style: const TextStyle(fontSize: 16)),
            Text(value.toStringAsFixed(0), style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Slider(
          value: value,
          onChanged: onChanged,
          min: 0,
          max: 255,
          divisions: 255,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 250,
          color: Color.fromRGBO(_red.round(), _green.round(), _blue.round(), 1),
        ),
        const SizedBox(height: 20),
        _buildSlider('Red', _red, (value) => _updateColor('red', value)),
        _buildSlider('Green', _green, (value) => _updateColor('green', value)),
        _buildSlider('Blue', _blue, (value) => _updateColor('blue', value)),
      ],
    );
  }
}
