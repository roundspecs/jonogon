import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TakeInitiativeView extends StatefulWidget {
  const TakeInitiativeView({super.key});

  @override
  State<TakeInitiativeView> createState() => _TakeInitiativeViewState();
}

class _TakeInitiativeViewState extends State<TakeInitiativeView> {
  XFile? _image;
  final picker = ImagePicker();

  void _getImage() async {
    _image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _getImage();
                },
                child: Container(
                  color: Theme.of(context).splashColor,
                  width: double.infinity,
                  height: 500,
                  child: _image == null
                      ? const Icon(Icons.camera_alt)
                      : FittedBox(child: Image.network(_image!.path)),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle next button press
                },
                child: const Text('Next'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
