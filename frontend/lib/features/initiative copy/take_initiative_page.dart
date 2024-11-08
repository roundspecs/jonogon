import 'dart:developer';

import 'package:flutter/material.dart';

class TakeInitiative extends StatelessWidget {
  TakeInitiative({super.key});

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Upload Image Section
            Center(
              child: OutlinedButton.icon(
                onPressed: () {
                  // Handle image upload logic
                  log('Upload image button clicked');
                },
                icon: const Icon(Icons.upload),
                label: const Text('Upload Image'),
              ),
            ),
            const SizedBox(height: 20),
            // Description TextField
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle post submission logic
                  final description = _descriptionController.text;
                  if (description.isNotEmpty) {
                    log('Post submitted with description: $description');
                    // Navigate back to the newsfeed or show a success message
                    Navigator.pop(context);
                  } else {
                    // Show an error message
                    log('Description is required');
                  }
                },
                child: const Text('Submit Post'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
