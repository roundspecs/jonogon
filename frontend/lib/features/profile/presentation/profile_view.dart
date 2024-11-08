import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const ProfilePicture(
          name: 'Adid',
          radius: 31,
          fontsize: 20,
          img:
              'https://i0.wp.com/picjumbo.com/wp-content/uploads/pile-of-garbage-in-the-middle-of-the-city-free-photo.jpg?w=2210&quality=70',
        ),
        const Text('userName'),
        const Text('FullName'),
        Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      10,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Item $index'),
                          )),
                ),
              ),
            ),
          ],
        ),
        const Column(
          children: [
            //list of inititiveModels.
          ],
        )
      ]),
    );
  }
}
