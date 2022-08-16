import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:palettly/misc/misc.dart';
part 'palette_state.dart';

class PaletteCubit extends Cubit<PaletteState> {
  PaletteCubit() : super(PaletteState.generate());

  void generate() => emit(PaletteState.generate());
}
