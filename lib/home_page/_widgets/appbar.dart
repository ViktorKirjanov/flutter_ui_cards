import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_cards/blocs/settings_cubit/settings_cubit.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onLeadingPressed;

  const CustomAppBar({Key? key, required this.onLeadingPressed})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return AppBar(
          title: const Text('Template Gallery'),
          backgroundColor: state.color,
          leading: CupertinoButton(
            child: const Icon(
              Icons.menu,
              color: CustomTheme.white,
            ),
            onPressed: () => onLeadingPressed(),
          ),
          actions: [
            CupertinoButton(
              child: const Icon(
                Icons.search,
                color: CustomTheme.white,
              ),
              onPressed: () {},
            )
          ],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0),
            ),
          ),
        );
      },
    );
  }
}
