class ListInfoModel {
  String? passengerName;
  String? numberOfTrips;

  String? airlineLogo;
  String? airlineCountry;
  String? airlineEstablishedDate;
  String? airlineWebsite;
  String? airlineSlogan;
  String? airlineName;

  ListInfoModel(
      {this.passengerName,
      this.numberOfTrips,
      this.airlineLogo,
      this.airlineCountry,
      this.airlineEstablishedDate,
      this.airlineSlogan,
      this.airlineName,
      this.airlineWebsite});

  factory ListInfoModel.fromMap(Map<String, dynamic> map) {
    return ListInfoModel(
        passengerName: map["name"],
        airlineLogo: map["airline"][0]["logo"],
        numberOfTrips: map["trips"] == null ? "0" : map["trips"].toString(),
        airlineCountry: map["airline"][0]["country"],
        airlineEstablishedDate: map["airline"][0]["established"],
        airlineSlogan: map["airline"][0]["slogan"],
        airlineWebsite: map["airline"][0]["website"],
        airlineName: map["airline"][0]["name"]);
  }
}
