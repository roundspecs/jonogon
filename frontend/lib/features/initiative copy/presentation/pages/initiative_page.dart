import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/initiative%20copy/bloc/initiative_bloc.dart';
import 'package:frontend/features/initiative%20copy/presentation/pages/initiative_view.dart';

class InitiativePage extends StatelessWidget {
  const InitiativePage({required this.idI, super.key});
  final int idI;

  @override
  Widget build(BuildContext context) {
    //TODO:find idJ from authentication bloc
    final idJ = 1; // dummy
    return BlocProvider(
      create: (context) =>
          InitiativeBloc()..add(InitiativeEventsLoad(idI: idI, idJ: idJ)),
      child: const InitiativeView(),
    );
  }
}
