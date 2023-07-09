class Group {
  dynamic adGruppen;
  int grpId;
  String grpBez;
  String grpTypBez;
  String? adresse;
  String bemerkung;

  Group({
    this.adGruppen,
    required this.grpId,
    required this.grpBez,
    required this.grpTypBez,
    this.adresse,
    required this.bemerkung,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    adGruppen: json["ADGruppen"],
    grpId: json["GrpID"],
    grpBez: json["GrpBez"],
    grpTypBez: json["GrpTypBez"],
    adresse: json["Adresse"],
    bemerkung: json["bemerkung"],
  );

  Map<String, dynamic> toJson() => {
    "ADGruppen": adGruppen,
    "GrpID": grpId,
    "GrpBez": grpBez,
    "GrpTypBez": grpTypBez,
    "Adresse": adresse,
    "bemerkung": bemerkung,
  };
}
