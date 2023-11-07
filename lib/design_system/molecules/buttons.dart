import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ser_manos/controllers/favorites_controller.dart';
import 'package:ser_manos/design_system/atoms/icons.dart';
import 'package:ser_manos/design_system/tokens/colors.dart';
import 'package:ser_manos/design_system/tokens/shadows.dart';
import 'package:ser_manos/design_system/tokens/typography.dart';

const EdgeInsets paddingBig = EdgeInsets.all(12);
const EdgeInsets paddingSmall = EdgeInsets.fromLTRB(12, 8, 12, 8);

OutlinedBorder roundedBorder =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));

class SerManosButton extends Container {
  SerManosButton.cta(String text,
      {super.key, required onPressed, bool disabled = false, bool fill = false})
      : super(
          width: fill ? double.infinity : null,
          height: 44,
          child: FilledButton(
            onPressed: disabled ? null : onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: SerManosColor.primary100,
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              shape: roundedBorder,
            ),
            child: SerManosTypography.button(
              text,
              color:
                  disabled ? SerManosColor.neutral50 : SerManosColor.neutral0,
            ),
          ),
        );

  SerManosButton.ctaText(String text,
      {super.key,
      required onPressed,
      bool disabled = false,
      bool fill = false,
      Color color = SerManosColor.primary100})
      : super(
          width: fill ? double.infinity : null,
          height: 44,
          child: TextButton(
            onPressed: disabled ? null : onPressed,
            style: TextButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
              shape: roundedBorder,
            ),
            child: SerManosTypography.button(
              text,
              color: disabled ? SerManosColor.neutral50 : color,
            ),
          ),
        );

  SerManosButton.short(
    String text,
    IconData icon, {
    super.key,
    required onPressed,
    bool disabled = false,
    bool small = false,
  }) : super(
          height: small ? 40 : 48,
          child: FilledButton(
            onPressed: disabled ? null : onPressed,
            style: FilledButton.styleFrom(
              backgroundColor: SerManosColor.primary100,
              padding: small ? paddingSmall : paddingBig,
              shape: roundedBorder,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SerManosIcon.white(
                  icon,
                  disabled: disabled,
                  active: true,
                ),
                SerManosTypography.button(
                  text,
                  color: disabled
                      ? SerManosColor.neutral50
                      : SerManosColor.neutral0,
                ),
              ],
            ),
          ),
        );

  SerManosButton.floating(IconData icon,
      {super.key, required onPressed, bool disabled = false})
      : super(
          width: 48,
          height: 48,
          decoration: BoxDecoration(boxShadow: SerManosShadows.shadow3),
          child: IconButton(
            onPressed: onPressed,
            style: IconButton.styleFrom(
              backgroundColor:
                  disabled ? SerManosColor.neutral10 : SerManosColor.primary10,
              padding: paddingBig,
              shape: roundedBorder,
            ),
            icon: SerManosIcon.primary(
              icon,
              disabled: disabled,
              active: true,
            ),
          ),
        );
}

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    required this.volunteering,
    super.key,
  });

  final String volunteering;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFavorite = ref.watch(favoritesControllerProvider.select(
        (favorites) =>
            favorites.value != null &&
            favorites.value!.contains(volunteering)));

    return InkWell(
        onTap: () async {
          if (isFavorite) {
            await ref
                .read(favoritesControllerProvider.notifier)
                .removeFavorite(volunteering);
          } else {
            await ref
                .read(favoritesControllerProvider.notifier)
                .addFavorite(volunteering);
          }
        },
        child: isFavorite
            ? const SerManosIcon.primary(SerManosIconData.favorite,
                active: true)
            : const SerManosIcon.primary(SerManosIconData.favoriteOutline,
                active: true));
  }
}
