import 'package:flutter/material.dart';

class HourlyForecastItem extends StatelessWidget {
  final String timevalue;
  final IconData icon;
  final String value;

  const HourlyForecastItem(
      {super.key,
      required this.timevalue,
      required this.icon,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
        width: 120,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                timevalue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              
              const SizedBox(
                height: 8,
              ),
              Icon(
                icon,
                size: 38,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 19),
              )
            ],
          ),
        ),
      ),
    );
  }
}
