import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/api/jonogon_api.dart';
import 'package:frontend/features/community%20copy/bloc/community_bloc.dart';
import 'package:frontend/frontend.dart';
import 'package:frontend/widgets/create_post_card.dart';
import 'package:frontend/widgets/post_card.dart';
import 'package:go_router/go_router.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = context.select((CommunityBloc bloc) => bloc.state.posts);
    return Scaffold(
      body: ListView(
        children: [
          CreatePostCard(
            onTap: () {
              context.go('/take-initiative');
            },
          ),
          for (final post in posts) PostCard(post: post),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print(
            await JonogonApi.findJonogonById(1),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
