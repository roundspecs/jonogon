import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                children: [
                  ProfilePicture(
                    name: 'Adid',
                    radius: 50,
                    fontsize: 24,
                    img:
                        'https://i...content-available-to-author-only...p.com/picjumbo.com/wp-content/uploads/pile-of-garbage-in-the-middle-of-the-city-free-photo.jpg?w=2210&quality=70',
                  ),
                  SizedBox(height: 10),
                  Text(
                    'userName',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'FullName',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Skills',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    10,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Chip(
                        label: Text('Item $index'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Initiatives',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Replace with the actual number of initiatives
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Initiative $index'),
                      subtitle: Text('Description of initiative $index'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
