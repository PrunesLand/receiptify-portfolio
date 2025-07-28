import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DocumentCard extends StatelessWidget {
  final bool isLoading;
  final String? text;
  const DocumentCard({super.key, this.isLoading = false, this.text});

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(child: Container(height: 100, width: double.infinity)),
          ),
        )
        : GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("\$${text}")],
              ),
            ),
          ),
        );
  }
}
