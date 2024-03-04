import 'package:flutter/material.dart';

class AdditionalInfoItem extends StatelessWidget {
  final IconData icon;
  final String lable;
  final String value;
  const AdditionalInfoItem(
      {super.key,
      required this.icon,
      required this.lable,
      required this.value});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 0,
        child: SizedBox(
          width: 100,
          child: Column(
            children: [
              const SizedBox(
                height: 9,
              ),
              Icon(
                icon,
                size: 31,
              ),
              const SizedBox(
                height: 9,
              ),
              Text(lable),
              const SizedBox(
                height: 9,
              ),
              Text(
                value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
