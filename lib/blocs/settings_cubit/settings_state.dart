part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final double size;
  final int visualizedCount;
  final Color color;

  const SettingsState({
    this.size = .33,
    this.visualizedCount = 10,
    this.color = Colors.purpleAccent,
  });

  SettingsState copyWith({
    double? size,
    int? visualizedCount,
    Color? color,
  }) {
    return SettingsState(
      size: size ?? this.size,
      visualizedCount: visualizedCount ?? this.visualizedCount,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [size, visualizedCount, color];
}
