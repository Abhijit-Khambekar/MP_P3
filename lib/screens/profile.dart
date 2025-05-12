import 'package:flutter/material.dart';
import '../widgets/common_header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEditing = false;
  TextEditingController _nameController = TextEditingController(text: "Abhijit Khambekar");
  TextEditingController _addressController = TextEditingController(text: "100th Charming Avenue");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHeader(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Profile Image
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'assets/images/test.jpg', // Replace with your image URL or Asset
                 ),
                ),
              ),
              SizedBox(height: 20),
              // Name Label and Field
              Text(
                'Name',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _nameController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border effect
                  ),
                  filled: true,
                  
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),

              // Address Label and Field
              Text(
                'Address',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _addressController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none, // No border effect
                  ),
                  filled: true,
                  
                ),
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),

              // Edit and Save Buttons
              Center(
                child: _isEditing
                    ? ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = false;
                          });
                          // Save the updated profile data
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Profile Saved!')),
                          );
                        },
                        child: Text('Save Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 147, 198, 255), 
                        ),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isEditing = true;
                          });
                        },
                        child: Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 147, 198, 255), // Dark Blue
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
