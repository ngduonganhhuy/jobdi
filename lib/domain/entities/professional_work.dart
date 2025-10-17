enum WorkingGroup { family, pet }

extension WprkingGroupExt on WorkingGroup {
  String get label => switch (this) {
    WorkingGroup.family => 'Việc gia đình, sinh hoạt',
    WorkingGroup.pet => 'Thú cưng',
  };
}

enum Family { sweeping, mopping }

extension FamilyExt on Family {
  String get label => switch (this) {
    Family.sweeping => 'Quét nhà',
    Family.mopping => 'Lau nhà',
  };
}

enum Pet { bathing, takingCare }

extension PetExt on Pet {
  String get label => switch (this) {
    Pet.bathing => 'Tắm rửa',
    Pet.takingCare => 'Chăm sóc',
  };
}
