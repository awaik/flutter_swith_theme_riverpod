import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_swith_theme_riverpod/core/shared_prefs/app_shared_prefs.dart';
import 'package:flutter_swith_theme_riverpod/core/theme_state/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPrefs.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeStateProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: themeMode,
      home: Scaffold(
        appBar: AppBar(
          title: Text(themeMode.name),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'The current theme is:',
              ),
              Text(
                themeMode.name,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(themeStateProvider.notifier).setTheme(),
          tooltip: 'Change theme',
          child: const Icon(Icons.color_lens_outlined),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
