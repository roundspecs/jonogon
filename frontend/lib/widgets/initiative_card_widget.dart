import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/community/bloc/community_bloc.dart';
// import 'package:frontend/frontend.dart';
import 'package:frontend/models/ui_models/initiative_model.dart';
import 'package:go_router/go_router.dart';

class InitiativeCardWidget extends StatelessWidget {
  const InitiativeCardWidget({required this.initiativeModel, super.key});

  final InitiativeModel initiativeModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Row
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.go('/jonogon/${initiativeModel.author.id}');
                  },
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey[300],
                    backgroundImage:
                        NetworkImage(initiativeModel.author.imageURL),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        context.go('/jonogon/${initiativeModel.author.id}');
                      },
                      child: Text(
                        initiativeModel.author.fullName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.go('/initiative/${initiativeModel.id}');
                      },
                      child: Text(
                        initiativeModel.createdAt.toLocal().toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Image Container
            Image(
              image: NetworkImage(initiativeModel.imageURL),
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 12),
            // Appreciation Button
            TextButton.icon(
              onPressed: () {
                context.read<CommunityBloc>().add(
                      CommunityInitiativeAppreciateToggled(initiativeModel.id),
                    );
              },
              icon: (false
                  ? const Icon(Icons.stars_rounded)
                  : const Icon(Icons.star_border_rounded)),
              label: const Text('1k'),
            ),
            const SizedBox(height: 8),
            // Details Text
            Text(
              initiativeModel.solution,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            // Interaction Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<CommunityBloc>().add(
                            CommunityImInToggled(initiativeModel.id),
                          );
                    },
                    label: const Text("I'm in"),
                    icon: (true
                        ? const Icon(Icons.check_circle_rounded)
                        : const Icon(Icons.check_circle_outline)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      context.read<CommunityBloc>().add(
                            CommunityInitiativeCommentToggled(
                                initiativeModel.id),
                          );
                    },
                    label: const Text('Comment'),
                    icon: const Icon(Icons.comment_outlined),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    label: const Text('Broadcast'),
                    icon: const Icon(Icons.speaker_phone_outlined),
                  ),
                ),
              ],
            ),
            if (false) ...[
              const SizedBox(height: 16),
              // show comment field
              const Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Comment',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
