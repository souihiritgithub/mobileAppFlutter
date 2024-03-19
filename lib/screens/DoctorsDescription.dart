import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

class DoctorsDescription extends StatelessWidget {
  final String doctorName;
  final String speciality;
  final String location;
  final int index;

  DoctorsDescription({
    required this.doctorName,
    required this.speciality,
    required this.location,
    required this.index,
  });

  List imgs = [
    "doctorMryem.jpg",
    "doctorRahma.jpg",
    "doctorIssam.jpg",
    "doctorHichem.jpg",
  ];



  String getDoctorExperience(int index) {
    switch (index) {
      case 0:
        return "EXPERIENCE: Dr. Smith has over 10 years of experience as a general practitioner. He has worked in various renowned hospitals and successfully treated numerous patients.";
      case 1:
        return "EXPERIENCE: Dr. Johnson is a highly skilled gynecologist with over 15 years of experience. He specializes in women's health issues and has performed many successful surgeries.";
      case 2:
        return "Experience: Dr. Williams is a renowned ophthalmologist with over 12 years of experience. He has diagnosed and successfully treated numerous eye disorders and has performed several cataract surgeries.";
      case 3:
        return "EXPERIENCE: Dr. Brown is a dermatology specialist with over 8 years of experience. He has worked in clinics specializing in the treatment of skin conditions and has helped many patients achieve healthy skin.";
      default:
        return "";
    }
  }

  String getDoctorEducation(int index) {
    switch (index) {
      case 0:
        return "EDUCATION: Dr. Smith earned his medical degree from XYZ University. He then pursued specialization in internal medicine and underwent additional training in cardiology.";
      case 1:
        return "EDUCATION: Dr. Johnson earned his medical degree from ABC University. He then completed his residency in obstetrics and gynecology and obtained additional certification in gynecological surgery.";
      case 2:
        return "EDUCATION: Dr. Williams graduated from DEF University with a specialization in ophthalmology. He completed his training through internships at reputed hospitals and earned a master's degree in refractive surgery.";
      case 3:
        return "EDUCATION: Dr. Brown earned his medical degree from GHI University. He then completed a residency program in dermatology and participated in research programs on skin conditions.";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    IconData specialtyIcon;


// Define the icon based on specialty
    if (speciality == 'Generaliste') {
      specialtyIcon = Icons.local_hospital;
    } else if (speciality == 'gynecologue') {
      specialtyIcon = Icons.face;
    } else if (speciality == 'ophtalmologue') {
      specialtyIcon = Icons.visibility;
    } else {
      specialtyIcon = Icons.local_hospital; // Default icon for other specialties
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Doctor Description',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue[300]!, Colors.blueGrey[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/${imgs[index]}"),
              ),
              SizedBox(height: 16),
              Text(
                'Doctor Name: $doctorName',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    specialtyIcon,
                    color: Colors.white,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'SPECIALITY: $speciality',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'LOCATIOIN: $location',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                getDoctorExperience(index),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Text(
                getDoctorEducation(index),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),




              SizedBox(height: 26),

              Center(
                child: SizedBox(height: 36, width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBarRootskip(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white70,
                    ),
                    child: Text(
                      'Welcome',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}