import 'package:flutter/material.dart';

class DetailSpec extends StatelessWidget {
  final String captionSpec;
  final String valuesSpec;

  const DetailSpec(
      {super.key, required this.captionSpec, required this.valuesSpec});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            captionSpec,
            style: const TextStyle(fontSize: 20),
          ),
          const Text("  :   "),
          Expanded(
            child: Text(
              valuesSpec,
              style: const TextStyle(fontSize: 18),
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
