enum AlcoholTolerance {
  nn("NN型(酒に強い)", 1),
  dn("DN型(酒に弱い)", 5),
  dd("DD型(飲めない)", 30);

  const AlcoholTolerance(this.name, this.coefficient);

  final String name;
  final int coefficient;
}
