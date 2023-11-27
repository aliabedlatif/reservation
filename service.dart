import 'package:flutter/material.dart';
import"Reservationpage.dart";
class Service {
  String reserve;


  Service(this.reserve);

// toString method used to display an item in a dropdown widget

  @override
  String toString() {
    return '$reserve';
  }
}
List<Service> services = [

  Service('x ray'),

  Service('laboratory'),

  Service('blood '),
  Service('Debit Cards'),
  Service('Money Orders'),
  Service('Personal Loans'),
];

class Mydropmenuwidget extends StatefulWidget {
  const Mydropmenuwidget({required this.updateService,super.key});
final Function(Service)updateService;
  @override
  State<Mydropmenuwidget> createState() => _MydropmenuwidgetState();
}

class _MydropmenuwidgetState extends State<Mydropmenuwidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(

        width: 210.0,

        initialSelection: services[0], // first car to be displayed

        onSelected: (service) {

          setState(() {

            widget.updateService(service as Service); // use widget to access widget fields from state class

          });

        }, // the list map function converts the list of cars to a list of DropdownMenuEntries

        dropdownMenuEntries: services.map<DropdownMenuEntry<Service>>((Service service) {

          return DropdownMenuEntry(value: service, label: service.toString());

        }).toList());

  }

}
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Service service=services.first;
  void updateService(Service service){
    setState(() {
      this.service=service;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Column(children: [
          const SizedBox(height: 20),
          const Text('select service',style: TextStyle(fontSize: 20)),
          const SizedBox(height: 20),
          Mydropmenuwidget(updateService: updateService),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(settings: RouteSettings(arguments:()),
                      builder: (context)=>const Reservationpage()));
                },


                child: Text('Submit'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],),
        ],),
      ),
    );
  }
}
