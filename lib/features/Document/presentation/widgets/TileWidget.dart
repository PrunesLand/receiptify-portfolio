import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/Enums/Enums.dart';

class TileWidget extends StatelessWidget {
  final String? cost;
  final DateTime? dateOfReceipt;
  final ExpenseEnum? category;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final bool isLoading;

  const TileWidget({
    super.key,
    this.cost,
    this.dateOfReceipt,
    this.category,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.isLoading = false,
  });

  String _formatDate(DateTime date) {
    final effectiveDate = dateOfReceipt ?? DateTime.now();
    return "${effectiveDate.day.toString().padLeft(2, '0')}.${effectiveDate.month.toString().padLeft(2, '0')}.${effectiveDate.year}";
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: ListTile(
            leading: const SizedBox(
              width: 24,
              height: 24,
            ), // Placeholder for icon
            title: Container(
              width: double.infinity,
              height: 20.0,
              color: Colors.white,
            ), // Placeholder for title
            subtitle: Container(
              width: double.infinity,
              height: 16.0,
              color: Colors.white,
            ), // Placeholder for subtitle
            trailing: const SizedBox(
              width: 24,
              height: 24,
            ), // Placeholder for trailing icon
          ),
        ),
      );
    } else {
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: ListTile(
          leading: leadingIcon != null ? Icon(leadingIcon) : null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$$cost'),
              Text(
                _formatDate(dateOfReceipt ?? DateTime.now()),
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ],
          ),
          subtitle: Text(category?.toString() ?? 'N/A'),
          trailing:
              isLoading
                  ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(),
                  )
                  : (trailingIcon != null
                      ? Icon(
                        trailingIcon,
                        color: Theme.of(context).iconTheme.color,
                      )
                      : null),
          onTap: isLoading ? null : onTap,
        ),
      );
    }
  }
}
