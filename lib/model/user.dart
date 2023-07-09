class User {
  String nachname;
  String vorname;
  String anmeldename;
  String adresse;
  String verwendung;
  String adGruppen;
  int status;
  String groupIds;

  User({
    required this.nachname,
    required this.vorname,
    required this.anmeldename,
    required this.adresse,
    required this.verwendung,
    required this.adGruppen,
    required this.status,
    required this.groupIds,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    nachname: json["Nachname"],
    vorname: json["Vorname"],
    anmeldename: json["Anmeldename"],
    adresse: json["Adresse"],
    verwendung: json["verwendung"],
    adGruppen: json["ADGruppen"],
    status: json["Status"],
    groupIds: json["groupIds"],
  );

  Map<String, dynamic> toJson() => {
    "name": nachname,
    "surname": vorname,
    "login": anmeldename,
    "mail": adresse,
    "usage": verwendung,
    "status": status,
    "groups": groupIds,
  };
}