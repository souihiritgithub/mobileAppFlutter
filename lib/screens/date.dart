import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/navbar_roots.dart';

class DateAppointment extends StatefulWidget {
  @override
  _DateAppointmentState createState() => _DateAppointmentState();
}

class _DateAppointmentState extends State<DateAppointment> {
  DateTime selectedDate = DateTime.now();
  bool appointmentValidated = false;
  TextStyle validatedTextStyle = TextStyle(
    fontSize: 20,
    color: Colors.amber,
  );

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        appointmentValidated = true; // Mise à jour de l'état de validation
      });
      _resetValidation(); // Réinitialiser l'état de validation après quelques secondes
    }
  }

  void _resetValidation() {
    Timer(Duration(seconds: 3), () {
      setState(() {
        appointmentValidated = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Appointment'),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavBarRoots()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity, // Utilise toute la largeur de l'écran
        height: double.infinity, // Utilise toute la hauteur de l'écran
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/datee.png'), // Chemin de l'image "app"
            fit: BoxFit.cover,
            // Modifier la valeur de l'échelle selon vos besoins
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                appointmentValidated ? 'Appointmnent validated!' : 'Selected Date:',
                style: appointmentValidated ? validatedTextStyle : TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  'Select Date',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
