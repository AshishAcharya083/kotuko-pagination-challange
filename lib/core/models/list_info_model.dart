class ListInfoModel {
  String? passengerName;
  String? numberOfTrips;

  String? airlineLogo;
  String? airlineCountry;
  String? airlineEstablishedDate;
  String? airlineWebsite;
  String? airlineSlogan;

  ListInfoModel(
      {this.passengerName,
      this.numberOfTrips,
      this.airlineLogo,
      this.airlineCountry,
      this.airlineEstablishedDate,
      this.airlineSlogan,
      this.airlineWebsite});

  factory ListInfoModel.fromMap(Map<String, dynamic> map) {
    return ListInfoModel(
      passengerName: map["id"],
      airlineLogo: map["airline"][0]["logo"],
      numberOfTrips: map["trips"],
      airlineCountry: map["airline"][0]["country"],
      airlineEstablishedDate: map["airline"][0]["established"],
      airlineSlogan: map["airline"][0]["slogan"],
      airlineWebsite: map["airline"][0]["website"],
    );
  }
}
