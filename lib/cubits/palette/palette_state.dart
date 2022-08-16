part of 'palette_cubit.dart';

enum PaletteStatus { generate }

class PaletteState extends Equatable {
  const PaletteState(this.paletteStatus, this.colors);

  final PaletteStatus? paletteStatus;
  final List<Color>? colors;

  PaletteState.generate()
      : this(
          PaletteStatus.generate,
          List.generate(
            8,
            (index) => Misc().randomColor(),
          ),
        );

  @override
  List<Object?> get props => [paletteStatus, colors];
}
