import 'package:flutter/material.dart';
import 'package:frontend/features/community%20copy/presentation/pages/community_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) => Scaffold(
        body: Row(
          children: [
            NavigationDrawer(children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/logo.png'),
                      height: 50,
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Jonogon",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
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
            Container(
              constraints: BoxConstraints.loose(const Size.fromWidth(500)),
              child: child,
            ),
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
        GoRoute(
          path: '/',
          builder: (context, state) => const CommunityPage(),
        ),
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
