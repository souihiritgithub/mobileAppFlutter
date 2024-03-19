import 'package:coursefirebase_app/screens/schedule.dart';
import 'package:coursefirebase_app/screens/signInScreen.dart';
import 'package:coursefirebase_app/screens/signUpScreen.dart';
import 'package:flutter/material.dart';

import 'DoctorsDescription.dart';
import 'home_screen.dart';

class HomeScreen extends StatelessWidget {
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

  late String selectedDoctorName; // Nouvelle variable pour stocker le nom du docteur recherché

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(

        backgroundColor: Colors.blue,


        title: Text('Health Care'),
        actions: [



          SizedBox(height: 10),



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
                                              builder: (context) => DoctorsDescription(
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
            icon: Icon(Icons.person_pin),
            iconSize: 42, // Modifier la valeur de la taille de l'icône selon vos besoins
            onPressed: () {
              // Effectuer l'action de notification
            },
          ),
        ],
      ),






      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



              /* SizedBox(height: 10),

              Padding(

                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/person.png"),
                    ),



          ],

                ),
              ),
*/






              // SizedBox(height: 10),
              Positioned(
                //top: 1,
                left: 10,
                right: 20,
                child: Container(
                  //width: double.infinity,
                  child: Image.asset(
                    "assets/images/welcomee.png",

                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              ),



              SizedBox(height: 5.0),
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  "ℋow 𝒸𝒶𝓃 ℐ 𝒽ℯ𝓁𝓅 𝓎ℴ𝓊 𝓉ℴ𝒹𝒶𝓎 ?",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),


              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Common Symptoms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: symptoms.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 200,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.healing,
                                size: 40,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(height: 10),
                              Text(
                                symptoms[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 5),


              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Appointment'),
                    Icon(Icons.calendar_month_outlined), // Icône Login en tant que trailing
                  ],
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePage(),
                    ),
                  );
                },
              ),
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
                          builder: (context) => DoctorsDescription(
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
                          Column(
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






