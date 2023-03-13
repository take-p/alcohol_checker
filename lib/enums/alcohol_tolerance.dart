enum AlcoholTolerance {
  nn("NN型", 1),
  dn("DN型", 5),
  dd("DD型", 30);

  const AlcoholTolerance(this.name, this.coefficient);

  final String name;
  final int coefficient;
}
