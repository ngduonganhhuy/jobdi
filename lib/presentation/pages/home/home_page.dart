import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobdi/core/constants/widget_constants.dart';
import 'package:jobdi/core/impl/base_page.dart';
import 'package:jobdi/core/themes/app_colors.dart';
import 'package:jobdi/core/themes/app_themes.dart';
import 'package:jobdi/core/utils/bloc_utils.dart';
import 'package:jobdi/core_bloc/theme/theme_bloc.dart';
import 'package:jobdi/widgets/app_safe_area.dart';
import 'package:jobdi/widgets/app_text.dart';

class HomePage extends StatefulWidget implements BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  String get screenName => 'HomePage';
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AppSafeArea(
          child: Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView.builder(
                    padding: REdgeInsets.all(8),
                    itemCount: AppTheme.values.length,
                    itemBuilder: (context, index) {
                      final itemAppTheme = AppTheme.values[index];
                      return Card(
                        color: appColorsData[itemAppTheme]?.primaryColor,
                        child: ListTile(
                          title: MediumText(
                            itemAppTheme.toString(),
                          color: appColorsData[itemAppTheme]?.primaryColor,
                          ),
                          onTap: () {
                            BlocUtils.add<ThemeBloc>(
                              ToggleThemeEvent(theme: itemAppTheme),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {},
                  child: MediumText(
                    'Go to weather page',
                    color: appScheme.primaryColor,
                  ),
                ),
                kGap50,
              ],
            ),
          ),
        );
      },
    );
  }
}
