import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/community/bloc/community_bloc.dart';
import 'package:frontend/widgets/create_initiative_card_widget.dart';
import 'package:frontend/widgets/initiative_card_widget.dart';
import 'package:go_router/go_router.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    final blocRuntimeType = context.select((CommunityBloc bloc) => bloc.state);
    if (blocRuntimeType is CommunityLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    final initiativeModels = context.select(
      (CommunityBloc bloc) =>
          (bloc.state as CommunityLoadedState).initiativeModels,
    );
    return Scaffold(
      body: ListView(
        children: [
          CreateInitiativeCardWidget(
            onTap: () {
              context.go('/take-initiative');
            },
          ),
          for (final initiativeModel in initiativeModels)
            InitiativeCardWidget(
              initiativeModel: initiativeModel,
            ),
        ],
      ),
    );
  }
}
