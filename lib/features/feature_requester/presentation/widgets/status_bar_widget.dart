import 'package:flutter/material.dart';

class StatusBarWodget extends StatelessWidget {
  const StatusBarWodget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 12);
    const textSuccess = TextStyle(color: Color(0xFF76FF03), fontSize: 12);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(
        horizontal: 7,
      ),
      decoration: BoxDecoration(
          color: Colors.grey[700], borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Status: ',
                style: textStyle,
              ),
              Text(
                '200 ',
                style: textSuccess,
              ),
              Text('created ', style: textSuccess),
            ],
          ),
          Row(
            children: [
              Text(
                'Type: ',
                style: textStyle,
              ),
              Text('json', style: textSuccess),
            ],
          ),
          Row(
            children: [
              Text(
                'Time: ',
                style: textStyle,
              ),
              Text('805 ms', style: textSuccess),
            ],
          ),
        ],
      ),
    );
  }
}
