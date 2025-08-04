import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback? onTap;
  final bool isLoading;

  const TileWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: leadingIcon != null ? Icon(leadingIcon) : null,
        title: Text(title),
        subtitle:
            subtitle != null
                ? Text(
                  subtitle!,
                  style: TextStyle(
                    color: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                )
                : null,
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
