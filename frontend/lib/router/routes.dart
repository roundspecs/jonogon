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
              // Image.asset('frontend/assets/images/jonogon_logo.png'),
              const Image(image: AssetImage('assets/jonogon_logo.png')),
              ListTile(
                title: const Text('Community'),
                onTap: () => context.go('/'),
              ),
              ListTile(
                title: const Text('profile'),
                onTap: () => context.go('/jonogon/1'),
              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () => context.go('/about'),
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () => context.go('/settings'),
              ),
            ]),
            child,
          ],
        ),
      ),
      routes: <RouteBase>[
        GoRoute(
            path: '/jonogon/:id',
            builder: (context, state) {
              final id = state.pathParameters["id"];
              return Text("Jonogon $id");
            }),
        GoRoute(path: '/', builder: (context, state) => const Text("Home")),
        GoRoute(
            path: '/initiative/:id',
            builder: (context, state) {
              final id = state.pathParameters["id"];
              return Text("Initiative $id");
            }),
        GoRoute(
            path: '/take-initiative',
            builder: (context, state) {
              return const Text("take-initiative");
            }),
        GoRoute(
            path: '/about',
            builder: (context, state) {
              return const Text("about");
            }),
        GoRoute(
            path: '/settings',
            builder: (context, state) {
              return const Text("settings");
            }),
        GoRoute(
            path: '/login',
            builder: (context, state) {
              return const Text("login");
            }),
        GoRoute(
            path: '/signup',
            builder: (context, state) {
              return const Text("signup',");
            }),
        GoRoute(
            path: '/welcome',
            builder: (context, state) {
              return const Text("welcome");
            }),
      ],
    )
  ],
);
