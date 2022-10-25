import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_cards/config/custom_theme.dart';
import 'package:flutter_ui_cards/home_page/_widgets/user_card/card_header.dart';
import 'package:flutter_ui_cards/home_page/_widgets/user_card/card_icon.dart';
import 'package:flutter_ui_cards/models/user_model.dart';

class UserCard extends StatelessWidget {
  final Color color;
  final User user;

  const UserCard({
    super.key,
    required this.color,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CardHeader(color: color),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(8.0),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              decoration: const BoxDecoration(
                color: CustomTheme.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildName(),
                  _buildAddress(),
                  _buildPhone(),
                  _buildEmail(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildName() {
    return Row(
      children: [
        const CardIcon(icon: CupertinoIcons.person),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Full Name',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: CustomTheme.black,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        const CardIcon(icon: CupertinoIcons.home),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            user.address,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.purple.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhone() {
    return Row(
      children: [
        const CardIcon(icon: CupertinoIcons.phone),
        const SizedBox(width: 8.0),
        Text(
          user.phone,
          style: const TextStyle(
            fontSize: 16.0,
            color: CustomTheme.black,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }

  Widget _buildEmail() {
    return Row(
      children: [
        const CardIcon(icon: CupertinoIcons.mail),
        const SizedBox(width: 8.0),
        Flexible(
          child: Text(
            "${user.email}\n${user.website}",
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.purple.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
