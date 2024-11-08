import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        body: Row(
          children: [
            NavigationDrawer(children: [
              ListTile(
                title: const Text('Home'),
                onTap: () => context.go('/'),
              )
            ]),
            child,
          ],
        ),
      ),
      routes: <RouteBase>[
        GoRoute(path: '/jonogon/:id', builder: (context, state) {
          final id = state.pathParameters["id"];
          return Text("Jonogon $id");
        }),
        GoRoute(path: '/', builder: (context, state) => const Text("Home")),
      ],
    )
  ],
);
