import 'package:flutter/material.dart';

class CreateInitiativeCardWidget extends StatelessWidget {
  const CreateInitiativeCardWidget({required this.onTap, super.key});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.add_a_photo, size: 30, color: Colors.grey[600]),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Create a new post',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
