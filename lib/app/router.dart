part of 'app.dart';

/// The router configuration.
final GoRouter _appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        final controller = MainControllerImplementation();
        return MainView(controller: controller);
      },
      // routes: <RouteBase>[
      //   GoRoute(
      //     path: '/questions',
      //     builder: (BuildContext context, GoRouterState state) {
      //       final controller =
      //           CategoryControllerImplementation(TargetType.list);
      //       return CategoryView(controller: controller);
      //     },
      //   ),
      //   GoRoute(
      //     path: '/practice',
      //     builder: (BuildContext context, GoRouterState state) {
      //       final controller =
      //           CategoryControllerImplementation(TargetType.single);
      //       return CategoryView(controller: controller);
      //     },
      //   ),
      //   GoRoute(
      //     path: '/exams',
      //     builder: (BuildContext context, GoRouterState state) {
      //       final controller = ExamsControllerImplementation();
      //       return ExamsView(controller: controller);
      //     },
      //   ),
      // ],
    ),
    GoRoute(
      path: '/questions',
      builder: (BuildContext context, GoRouterState state) {
        final controller = CounterControllerImplementation();
        return CounterView(controller: controller);
      },
    ),
    GoRoute(
      path: '/practice',
      builder: (BuildContext context, GoRouterState state) {
        final controller = CounterControllerImplementation();
        return CounterView(controller: controller);
      },
    ),
    GoRoute(
      path: '/exams',
      builder: (BuildContext context, GoRouterState state) {
        final controller = CounterControllerImplementation();
        return CounterView(controller: controller);
      },
    ),
  ],
);

extension RouterExt on BuildContext {
  void showQuestionsView([Object? extra]) => go('/questions', extra: extra);
  void showPracticeView([Object? extra]) => go('/practice', extra: extra);
  void showExamsView([Object? extra]) => go('/exams', extra: extra);
}
