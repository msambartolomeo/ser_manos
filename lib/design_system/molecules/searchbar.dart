import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/text_style.dart';

class SerManosSearchBar extends ConsumerWidget {
  const SerManosSearchBar({super.key, required this.onSearch});

  final void Function(String?) onSearch;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncer = Debouncer(milliseconds: 1000);

    return Container(
      decoration: BoxDecoration(
        color: SerManosColor.neutral0,
        boxShadow: SerManosShadows.shadow1,
        borderRadius: const BorderRadius.all(Radius.circular(2)),
      ),
      child: TextFormField(
        onChanged: (search) => debouncer.run(
          () => onSearch(search == "" ? null : search),
        ),
        decoration: const InputDecoration(
          hintText: "Buscar",
          hintStyle: SerManosTextStyle.subtitle1(),
          prefixIcon: SerManosIcon.primary(SerManosIconData.search),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          suffixIcon: SerManosIcon.primary(
            SerManosIconData.map,
            active: true,
          ),
        ),
        style: const SerManosTextStyle.subtitle1(
          color: SerManosColor.neutral75,
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
