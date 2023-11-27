import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reservation/main.dart';
import 'package:reservation/service.dart';

class Reservationpage extends StatefulWidget {
  const Reservationpage({super.key});

  @override
  State<Reservationpage> createState() => _ReservationpageState();
}

class _ReservationpageState extends State<Reservationpage> {
  final TextEditingController _typeController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  void _selectDate(BuildContext context) async {
    final DateTime ? picked = await showDatePicker(context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _selectTime(BuildContext context) async {
    final TimeOfDay ? picked = await showTimePicker(context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submit() {
    print('$_selectedDate,$_selectedTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reservation'),
      ),
      body: Padding(padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
          TextField(
            controller: _typeController,
            decoration: InputDecoration(
              hintText: "type the reservation",
                border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: (){
_typeController.clear();
                },
                icon: const Icon(Icons.clear),
              ),

            ),
          ),



          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text('Select Date'),
          ),
          SizedBox(height: 8.0),
          Text(
              'selectdate:${_selectedDate}'
          ),
          ElevatedButton(
            onPressed: () => _selectTime(context),
            child: Text('Select Time'),
          ),
          SizedBox(height: 8),
          Text(
            'Selected Time: ${_selectedTime.format(context)}',
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: ()
            {
              Navigator.of(context).push(MaterialPageRoute(settings: RouteSettings(arguments: _selectedDate),
              builder: (context)=>const Homepage()));
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
        ],
        ),
      ),
    );
  }
}
