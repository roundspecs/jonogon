import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/take_initiative/bloc/take_initiative_bloc.dart';
import 'package:frontend/features/take_initiative/presentation/pages/take_initiative_view.dart';

class TakeInitiativePage extends StatelessWidget {
  const TakeInitiativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TakeInitiativeBloc(),
      child: const TakeInitiativeView(),
    );
  }
}
