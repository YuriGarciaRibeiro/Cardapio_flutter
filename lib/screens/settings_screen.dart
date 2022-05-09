import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:menu/models/settings.dart';
import '../components/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings settings) onSettingsChanged;
  final Settings settings;

  SettingsScreen({this.onSettingsChanged, this.settings});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Gluten-free',
                  'Only show gluten-free meals',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose-free',
                  'Only show lactose-free meals',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegetarian',
                  'Only show vegetarian meals',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
                _createSwitch(
                  'Vegan',
                  'Only show vegan meals',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
