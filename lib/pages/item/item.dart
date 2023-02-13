import 'dart:developer';

import 'package:coffee_app_amplify/models/Base.dart';
import 'package:coffee_app_amplify/models/ModelProvider.dart';
import 'package:coffee_app_amplify/models/Size.dart' as obj;
import 'package:coffee_app_amplify/pages/item/item_bloc.dart';

import 'package:coffee_app_amplify/widgets/custom_scroll_body.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../widgets/two_tone_text.dart';

class Item extends StatefulWidget {
  final Preference? preference;
  const Item({Key? key, this.preference}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  late ItemBloc _bloc;

  @override
  void initState() {
    if (widget.preference != null) {
      _bloc = ItemBloc(preference: widget.preference!);
    } else {
      _bloc = ItemBloc();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollBody(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          sliver: SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            centerTitle: false,
            title: TwoToneText(
              firstText: 'coffee ',
              secondText: 'preference',
              tag: 'two_tone_text',
              fontSize: 28,
              key: UniqueKey(),
            ),
            leadingWidth: 0,
            leading: const SizedBox.shrink(),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop(false);
                },
                child: Icon(
                  Icons.close,
                  color: Theme.of(context).iconTheme.color,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          sliver: SliverToBoxAdapter(
              child: ReactiveFormBuilder(
            form: () => _bloc.form,
            builder: (context, form, child) {
              return Column(
                children: [
                  ReactiveTextField<String>(
                    formControlName: 'title',
                    decoration: const InputDecoration(
                      labelText: 'Name of your coffee preference',
                    ),
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'The Name must not be empty',
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'subtitle',
                    decoration: const InputDecoration(
                      labelText: 'Subtitle of your coffee preference',
                    ),
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'The Subtitle must not be empty',
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReactiveCheckboxListTile(
                    formControlName: "hot",
                    title: const Text("Hot Beverage"),
                    subtitle: const Text("Is your beverage hot ?"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ReactiveTextField<String>(
                    formControlName: 'notes',
                    maxLines: 10,
                    decoration: const InputDecoration(
                      labelText: 'A Description of your coffee preference',
                      alignLabelWithHint: true,
                    ),
                    validationMessages: {
                      ValidationMessage.required: (_) =>
                          'Description must not be empty',
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReactiveDropdownField(
                          items: obj.Size.values
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.name)))
                              .toList(),
                          formControlName: "size",
                          decoration: const InputDecoration(
                            labelText: 'Size',
                          ),
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Set a size for your coffee',
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ReactiveDropdownField(
                          items: Base.values
                              .map((e) => DropdownMenuItem(
                                  value: e, child: Text(e.name)))
                              .toList(),
                          formControlName: "base",
                          decoration: const InputDecoration(
                            labelText: 'Base',
                          ),
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                                'Set a base for your coffee',
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (form.valid) {
                              if (widget.preference == null) {
                                await _bloc.createPreference();
                              } else {
                                await _bloc.updatePreference();
                              }
                              if (mounted) {
                                Navigator.pop(context, true);
                              }
                            } else {
                              form.markAllAsTouched();
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )),
        )
      ],
    ));
  }
}
