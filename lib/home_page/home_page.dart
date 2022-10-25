import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_cards/blocs/settings_cubit/settings_cubit.dart';
import 'package:flutter_ui_cards/data/local_data.dart';
import 'package:flutter_ui_cards/home_page/_widgets/appbar.dart';
import 'package:flutter_ui_cards/home_page/_widgets/user_card/user_card.dart';
import 'package:flutter_ui_cards/home_page/_widgets/perspective_list_view.dart';
import 'package:flutter_ui_cards/home_page/drawer/settings_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CustomAppBar(
        onLeadingPressed: () => _key.currentState!.openDrawer(),
      ),
      extendBodyBehindAppBar: true,
      drawer: const SettingsDrawer(),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return PerspectiveListView(
            itemExtent: MediaQuery.of(context).size.height * state.size,
            visualizedCount: state.visualizedCount,
            initialIndex: 7,
            padding: EdgeInsets.fromLTRB(
              16.0,
              AppBar().preferredSize.height * 2,
              16.0,
              16.0,
            ),
            color: state.color,
            children: List.generate(
              Users().data.length,
              (index) => UserCard(
                color: Colors.accents[index % Colors.accents.length],
                user: Users().data[index],
              ),
            ),
            onChangeItem: (int index) {
              log("onChangeItem: $index");
            },
            onTapFrontItem: (int index) {
              log("onTapFrontItem: $index");
            },
          );
        },
      ),
    );
  }
}
