import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  final IconData? icon;

  const CustomCard(
      {super.key, required this.name, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: Colors.black,
                        size: 30.0,
                      )
                    : const SizedBox(),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
