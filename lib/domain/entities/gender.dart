enum Gender {
  male,
  female;

  String get displayName => switch (this) {
    male => 'Nam',
    female => 'Nữ',
  };

  String get code => switch (this) {
    male => 'MALE',
    female => 'FEMALE',
  };
}
