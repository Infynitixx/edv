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
    this.nachname  = '',
    this.vorname = '',
    this.anmeldename = '',
    this.adresse = '',
    this.verwendung = '',
    this.adGruppen = '',
    this.status = 0,
    this.groupIds = '',
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
    "Nachname": nachname,
    "Vorname": vorname,
    "Anmeldename": anmeldename,
    "Adresse": adresse,
    "verwendung": verwendung,
    "ADGruppen": adGruppen,
    "Status": status,
    "groupIds": groupIds,
  };
}
