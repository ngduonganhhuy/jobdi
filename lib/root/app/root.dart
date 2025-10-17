import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobdi/core/utils/utils.dart';
import 'package:jobdi/core_bloc/app/app_bloc.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/injection_container.dart';
import 'package:jobdi/root/app/my_app.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<ThemeBloc>()..add(SetInitialTheme()),
        ),
        BlocProvider(
          create: (context) => locator<AppBloc>(),
        ),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Utils.closeKeyboard(context);
        },
        child: const RestartWidget(child: MyApp()),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({required this.child, super.key});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  State<RestartWidget> createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
