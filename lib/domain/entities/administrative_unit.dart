class AdministrativeUnit {
  AdministrativeUnit({
    required this.id,
    required this.name,
  });
  final String id;
  final String name;
}

final listProvinces = [
  AdministrativeUnit(id: '01', name: 'Hà Nội'),
  AdministrativeUnit(id: '02', name: 'Hồ Chí Minh'),
  AdministrativeUnit(id: '03', name: 'Đà Nẵng'),
  AdministrativeUnit(id: '04', name: 'Hải Phòng'),
  AdministrativeUnit(id: '05', name: 'Cần Thơ'),
];

final listWards = [
  AdministrativeUnit(id: '001', name: 'Phường 1'),
  AdministrativeUnit(id: '002', name: 'Phường 2'),
  AdministrativeUnit(id: '003', name: 'Phường 3'),
  AdministrativeUnit(id: '004', name: 'Phường 4'),
  AdministrativeUnit(id: '005', name: 'Phường 5'),
];
