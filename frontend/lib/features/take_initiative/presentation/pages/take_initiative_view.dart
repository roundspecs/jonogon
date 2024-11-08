import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
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
                onPressed: () async {
                  String? caption;
                  if (_image != null) {
                    var request = http.MultipartRequest(
                      'POST',
                      Uri.parse("http://localhost:8000/caption"),
                    );
                    request.files.add(
                      http.MultipartFile(
                        'file',
                        _image!.readAsBytes().asStream(),
                        await _image!.length(),
                        filename: _image!.path.split('/').last,
                        contentType: MediaType('image', 'jpeg'),
                      ),
                    );
                    var response = await request.send();
                    if (response.statusCode == 200) {
                      final body = await response.stream.bytesToString();
                      caption = jsonDecode(body)['caption'];
                    }
                  }
                  navigateToCaptionPage(caption);
                },
                child: const Text('Next'),
              ),
            ],
          ),
        )
      ],
    );
  }

  void navigateToCaptionPage(String? caption) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => CaptionPage(caption: caption),
    ));
  }
}

class CaptionPage extends StatelessWidget {
  final String? caption;
  const CaptionPage({super.key, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (caption != null) Text('AI generated caption: $caption'),
        const TextField(
          decoration: InputDecoration(hintText: "Description"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
