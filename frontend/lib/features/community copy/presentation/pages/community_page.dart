import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/community%20copy/bloc/community_bloc.dart';
import 'package:frontend/features/community%20copy/presentation/pages/community_view.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc()..add(CommunitInit()),
      child: const CommunityView(),
    );
  }
}
