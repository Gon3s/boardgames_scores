import 'package:equatable/equatable.dart';

import '../../domain/entities/color.dart';

class ColorModel extends Equatable {
  const ColorModel({
    required this.text,
    required this.primary,
    required this.secondary,
    required this.error,
    required this.background,
  });

  final String text;
  final String primary;
  final String secondary;
  final String error;
  final String background;

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      text: json['text'],
      primary: json['primary'],
      secondary: json['secondary'],
      error: json['error'],
      background: json['background'],
    );
  }

  ColorEntity toEntity() {
    return ColorEntity(
      text: text,
      primary: primary,
      secondary: secondary,
      error: error,
      background: background,
    );
  }

  @override
  List<Object?> get props => [
        text,
        primary,
        secondary,
        error,
        background,
      ];
}