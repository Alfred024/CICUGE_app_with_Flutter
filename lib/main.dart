// import 'package:cicuge_app/config/config.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:app_cafe/config/config.dart';

// void main() async {
//   await Environment.initEnvironment();

//   runApp(const ProviderScope(
//     child: MainApp(),
//   ));
// }

// class MainApp extends ConsumerWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final appRouter = ref.watch(goRouterProvider);
//     return MaterialApp.router(
//       // routerConfig: appRouter,
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme().getTheme(),
//     );
//   }
// }
import 'package:cicuge_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:cicuge_app/screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bienvenida a la App',
      theme: AppTheme().getTheme(),
      home: HomeScreen(),
    );
  }
}
