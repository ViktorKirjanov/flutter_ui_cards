import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_cards/blocs/settings_cubit/settings_cubit.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';
import 'package:flutter_ui_cards/home_page/drawer/color_selector.dart';
import 'package:flutter_ui_cards/home_page/drawer/drawer_title.dart';

class SettingsDrawer extends StatefulWidget {
  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Drawer(
          width: MediaQuery.of(context).size.width * .66,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              _buildHeader(state),
              const SizedBox(height: 16.0),
              const DrawerTitle(title: 'Size'),
              _buildSizeSlider(state),
              const DrawerTitle(title: 'Quantity'),
              _buildQuantitySlider(state),
              const DrawerTitle(title: 'Color'),
              _buildColorPicker(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSizeSlider(state) {
    return Slider(
      min: .33,
      max: .5,
      thumbColor: state.color,
      activeColor: state.color,
      inactiveColor: state.color.withOpacity(.25),
      value: state.size,
      onChanged: (value) {
        context.read<SettingsCubit>().changeSize(value);
      },
    );
  }

  Widget _buildHeader(state) {
    return SizedBox(
      height: 150.0,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: state.color,
        ),
        child: Row(
          children: const [
            Icon(
              CupertinoIcons.settings,
              size: 36.0,
            ),
            SizedBox(width: 8.0),
            Text(
              'Settings',
              style: TextStyle(
                color: CustomTheme.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySlider(state) {
    return Slider(
      min: 3,
      max: 15,
      thumbColor: state.color,
      activeColor: state.color,
      inactiveColor: state.color.withOpacity(.25),
      value: state.visualizedCount.toDouble(),
      onChanged: (value) {
        context.read<SettingsCubit>().changevisualizedCount(value.toInt());
      },
    );
  }

  Widget _buildColorPicker(state) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 20.0,
      ),
      shrinkWrap: true,
      crossAxisCount: 4,
      children: CustomTheme.colors
          .map(
            (color) => Padding(
              padding: const EdgeInsets.all(.0),
              child: ColorSelector(
                color: color!,
                isActive: state.color == color,
              ),
            ),
          )
          .toList(),
    );
  }
}
