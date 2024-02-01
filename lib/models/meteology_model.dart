class MeteologyModel {
  final double tempureture;
  final String lacation;
  final String code;
  final String icon;
  final String date;

  MeteologyModel(
      {required this.icon,
      required this.code,
      required this.lacation,
      required this.tempureture,
      required this.date});
}
