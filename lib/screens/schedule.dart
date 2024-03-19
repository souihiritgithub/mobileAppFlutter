import 'package:coursefirebase_app/screens/doctorDescriptionandAppointment.dart';
import 'package:flutter/material.dart';
import 'package:coursefirebase_app/screens/DoctorsDescription.dart';
import 'package:coursefirebase_app/screens/home_screen.dart';


import 'date.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String selectedDoctorName; // Nouvelle variable pour stocker le nom du docteur recherché

    List symptoms = [
      "Temperature",
      "Snuffle",
      "Fever",
      "Cough",
      "Cold"
    ];
    List imgs = [
      "doctorMryem.jpg",
      "doctorRahma.jpg",
      "doctorIssam.jpg",
      "doctorHichem.jpg",
    ];

    List<String> doctorNames = ['DR MARYAM ZAMANI', 'DR RAHMA BACCARI', 'DR ISSAM MALLOUKI', 'DR HICHEM KHDHIRI'];
    List<String> doctorSpecialties = ['Therapist', 'Gynecologist', 'Ophthalmologist', 'Generalist'];
    List<String> doctorLocations = [
      'Gabes',
      'Tunisie',
      'Lekef',
      'Sfax',
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Make Your Appointment'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String searchQuery = '';

                  return AlertDialog(
                    title: Text('Rechercher un Docteur'),
                    content: TextField(
                      onChanged: (value) {
                        searchQuery = value;
                      },
                      decoration: InputDecoration(
                        labelText: 'Nom du Docteur',
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        child: Text('Rechercher'),
                        onPressed: () {
                          bool doctorFound = false;
                          String foundDoctorName = '';

                          for (int i = 0; i < doctorNames.length; i++) {
                            if (doctorNames[i] == searchQuery) {
                              // The doctor is found
                              selectedDoctorName = searchQuery;
                              doctorFound = true;
                              foundDoctorName = doctorNames[i];
                              break;
                            }
                          }

                          if (doctorFound) {
                            Navigator.pop(context); // Close the dialog
                            Navigator.pop(context); // Close the bottom sheet
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Docteur trouvé'),
                                  content: Text('Le docteur $foundDoctorName existe.'),
                                  actions: [
                                    ElevatedButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        int index = doctorNames.indexOf(foundDoctorName);
                                        if (index != -1) {
                                          Navigator.pop(context); // Close the dialog
                                          Navigator.pop(context); // Close the bottom sheet
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => OtherDoctorsDescriptionAppointment(
                                                doctorName: doctorNames[index],
                                                index: index,
                                                speciality: doctorSpecialties[index],
                                                location: doctorLocations[index],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Docteur non trouvé'),
                                  content: Text('Le docteur que vous recherchez n\'a pas été trouvé.'),
                                  actions: [
                                    ElevatedButton(
                                      child: Text('OK'),
                                      onPressed: () {
                                        Navigator.pop(context); // Close the dialog
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Perform notifications action
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Doctor:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "The best doctors",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctorNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DateAppointment(),

                        ),

                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(5),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                image: AssetImage("assets/images/${imgs[index]}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  doctorNames[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  doctorSpecialties[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  doctorLocations[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Add more DoctorCard widgets for other doctors
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Other doctors",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: doctorNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtherDoctorsDescriptionAppointment(
                            doctorName: doctorNames[index],
                            index: index,
                            speciality: doctorSpecialties[index],
                            location: doctorLocations[index],
                          ),
                        ),

                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.all(5),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                image: AssetImage("assets/images/${imgs[index]}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  doctorNames[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  doctorSpecialties[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  doctorLocations[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


