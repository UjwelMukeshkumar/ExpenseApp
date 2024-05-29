import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Map<String, dynamic>> TransactionData = [
  {
    'icon': const FaIcon(
      FontAwesomeIcons.burger,
      color: Colors.white,
    ),
    'color': Colors.yellow[700],
    'name': ' Food',
    'totalamount': '-\₹430',
    'date': 'Today'
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.plane,
      color: Colors.white,
    ),
    'color': Colors.green,
    'name': ' Travel',
    'totalamount': '-\₹1620',
    'date': 'Today'
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.bagShopping,
      color: Colors.white,
    ),
    'color': Colors.purple,
    'name': ' Shopping',
    'totalamount': '-\₹620',
    'date': 'Today'
  },
  {
    'icon': const FaIcon(
      FontAwesomeIcons.heartCircleCheck,
      color: Colors.white,
    ),
    'color': Colors.blue,
    'name': ' Health',
    'totalamount': '-\₹220',
    'date': 'Yesterday'
  }
];
