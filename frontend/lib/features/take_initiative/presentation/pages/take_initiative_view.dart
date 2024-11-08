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
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      Uri.parse("http://192.168.23.28:8000/caption"),
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

class CaptionPage extends StatefulWidget {
  final String? caption;
  const CaptionPage({super.key, required this.caption});

  @override
  State<CaptionPage> createState() => _CaptionPageState();
}

class _CaptionPageState extends State<CaptionPage> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.caption != null) ...[
            const Text(
              'AI generated caption:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${widget.caption}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
          ],
          TextField(
            maxLines: 4,
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Description",
              hintText: "Describe the problem you want to solve",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final description = controller.text;
              List<String> solutions;
              if (widget.caption != null) {
                final body = (await http.get(Uri.parse(
                        "http://localhost:8000/solution?description=$description&caption=${widget.caption}")))
                    .body;
                solutions = ((jsonDecode(body)
                        as Map<String, dynamic>)["solutions"] as List)
                    .map((e) => e.toString())
                    .toList();
              } else {
                final body = (await http.get(Uri.parse(
                        "http://localhost:8000/solution?description=$description")))
                    .body;
                solutions = ((jsonDecode(body)
                        as Map<String, dynamic>)["solutions"] as List)
                    .map((e) => e.toString())
                    .toList();
              }
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return SolutionPage(
                      solutions: solutions,
                      caption: widget.caption,
                      description: description);
                },
              ));
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}

class SolutionPage extends StatefulWidget {
  const SolutionPage(
      {super.key,
      required this.description,
      this.caption,
      required this.solutions});
  final String description;
  final String? caption;
  final List<String> solutions;

  @override
  State<SolutionPage> createState() => _SolutionPageState();
}

class _SolutionPageState extends State<SolutionPage> {
  int? index;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Pick a solution, generated by AI',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          ...widget.solutions.map((solution) {
            final indexOfSolution = widget.solutions.indexOf(solution);
            return RadioListTile(
              value: indexOfSolution,
              groupValue: index,
              title: Text(solution),
              onChanged: (value) => {
                setState(() {
                  index = value;
                })
              },
            );
          }),
          const SizedBox(height: 16),
          const Text(
            'Or, suggest your own',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Solution",
              hintText: "Suggest your own solution",
            ),
            onTap: () {
              setState(() {
                index = null;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: () {}, child: const Text("Submit")),
        ],
      ),
    );
  }
}
