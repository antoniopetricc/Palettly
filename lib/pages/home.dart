import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palettly/cubits/cubits.dart';
import 'package:palettly/misc/misc.dart';
import 'package:palettly/styles.dart';
import 'package:palettly/widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaletteCubit(),
      child: BlocBuilder<PaletteCubit, PaletteState>(
        builder: (context, state) {
          return RawKeyboardListener(
            focusNode: FocusNode(),
            autofocus: true,
            onKey: (key) {
              if (key is RawKeyDownEvent) {
                if (key.logicalKey == LogicalKeyboardKey.space) {
                  context.read<PaletteCubit>().generate();
                }
              }
            },
            child: Scaffold(
              body: SingleChildScrollView(
                padding: Styles.kPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Palettly",
                      style: Styles.kTitle.copyWith(color: Styles.kPrimary),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Styles.kBody,
                        children: [
                          const TextSpan(text: "Press the"),
                          TextSpan(
                            text: " spacebar ",
                            style: Styles.kBody.copyWith(
                              color: Styles.kPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: "to generate color palettes!")
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: state.colors!
                          .map(
                            (e) => GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: Styles.kPrimary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: Styles.kBorderRadius,
                                    ),
                                    content: Text(
                                      "Color copied to clipboard",
                                      style: Styles.kBody
                                          .copyWith(color: Styles.kWhite),
                                    ),
                                  ),
                                );
                                Clipboard.setData(
                                  ClipboardData(
                                    text: e.value
                                        .toRadixString(16)
                                        .padLeft(6, '0'),
                                  ),
                                );
                              },
                              child: Container(
                                height: 200,
                                width: 42,
                                decoration: BoxDecoration(
                                  color: e,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: RotatedBox(
                                    quarterTurns: -1,
                                    child: Row(
                                      children: [
                                        Text(
                                          "#${e.value.toRadixString(16).padLeft(6, '0')}",
                                          style: Styles.kBody.copyWith(
                                            color: Styles.kWhite,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: Text(
                                            Misc().getColorName(e).getName,
                                            style: Styles.kBody.copyWith(
                                              color: Styles.kWhite,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      title: "Generate",
                      onTap: () => context.read<PaletteCubit>().generate(),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Made with <3 in Flutter.",
                            style: Styles.kBody,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () async => await launchUrl(Uri.parse(
                              "https://antoniopetricciuoli.com",
                            )),
                            child: Text(
                              "by @antoniopetricc",
                              style: Styles.kBody.copyWith(
                                color: Styles.kPrimary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
