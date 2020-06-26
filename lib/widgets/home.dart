import 'package:flutter/material.dart';
import 'package:covid19_app/models/summary.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with 
    SingleTickerProviderStateMixin {

    TabController _tabController;

    void initState() {
      _tabController = new TabController(length: 3, vsync: this);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("Covid-19 App")),
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.white,
        labelColor: Colors.amber,
        tabs: [
        new Tab (child: Text("Summary")),
        new Tab (child: Text("States")),
        new Tab (child: Text("Country")),
      ],
      controller: _tabController, 
    ),

    body: TabBarView(
          children: [
        new Text("This is Summary Tab View"),
        new Text("This is States Tab View"),
        new Text("This is Country Tab View"),
      ],
      controller: _tabController,),
    
    );
  }
  Future<Summary> fetchSummary() async {
  final response = await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200){
      print(response.body);
      //Transfor json into object
      return Summary.fromJson(json.decode(response.body));
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
    throw Exception('Failed to load page');
    }
}
  
}
