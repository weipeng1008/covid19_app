//import 'package:charts_flutter/flutter.dart' as charts;

class Summary {
  final String newconfirmed;
  final String totalconfirmed;
  final String newdeaths;
  final String totaldeaths;
  final String newrecovered;
  final String totalrecovered;

  Summary({this.newconfirmed, this.totalconfirmed, this.newdeaths, this.totaldeaths, 
  this.newrecovered, this.totalrecovered});

  factory Summary.fromJson(Map<String, dynamic>json){
    return Summary(
      newconfirmed: json["newconfirmed"],
      totalconfirmed: json["totalconfirmed"],
      newdeaths: json["newdeaths"],
      totaldeaths: json["totaldeaths"],
      newrecovered: json["newrecovered"],
      totalrecovered: json["totalrecovered"],
      
    );
  }

}
