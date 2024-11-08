import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/initiative%20copy/bloc/initiative_bloc.dart';

class InitiativeView extends StatelessWidget {
  const InitiativeView({super.key});

  @override
  Widget build(BuildContext context) {
    final initiativeState = context.select((InitiativeBloc bloc) => bloc.state);
    if (initiativeState is InitiativeStateLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final initiative = (initiativeState as InitiativeStateLoaded).initiative;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Info
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[300],
                    child:
                        Icon(Icons.person, size: 30, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Firstname Lastname',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '01-01-2001',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Image Container
              Image.network(initiative.imageURL),
              const SizedBox(height: 16),
              // Details
              const Text(
                '''Full details of the post go here. This section can be expanded to include additional information.''',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              // Solution Section
              const Text(
                'Solution',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Details about the solution and step-by-step guide.',
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16),
              // Steps with checkboxes
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      Checkbox(value: false, onChanged: (bool? value) {}),
                      Expanded(
                        child: Text(
                          'Step ${i + 1}: Explanation for step ${i + 1}.',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 16),
              // Interaction Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("I'm in"),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Comment'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Broadcast'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
