import 'package:flutter/material.dart';
import 'login_page_layout.dart'; // Import the login screen
import 'home_layout.dart'; // Import the login screen

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool isEditing = false;
  final TextEditingController nameController =
      TextEditingController(text: 'tooot');
  final TextEditingController ageController = TextEditingController(text: '22');
  final TextEditingController phoneController =
      TextEditingController(text: '12345675');
  final TextEditingController emailController =
      TextEditingController(text: 'maher@gmail.com');
  final TextEditingController genderController =
      TextEditingController(text: 'Male');

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    phoneController.dispose();
    emailController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color(0xFF161E36),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileInfo('Name', nameController),
            const SizedBox(height: 20),
            _buildProfileInfo('Age', ageController),
            const SizedBox(height: 20),
            _buildProfileInfo('Phone', phoneController),
            const SizedBox(height: 20),
            _buildProfileInfo('Email', emailController),
            const SizedBox(height: 20),
            _buildProfileInfo('Gender', genderController),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isEditing) {
                    // Implement save logic here
                    // Show alert message
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Saved'),
                          content: Text('Changes saved successfully.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );

                    setState(() {
                      isEditing = false;
                    });
                  } else {
                    setState(() {
                      isEditing = true;
                    });
                  }
                },
                child: Text(
                  isEditing ? 'Save' : 'Edit',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFFFF8B3D)),
                  padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF161E36),
        type: BottomNavigationBarType.fixed,
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail_outline,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()),
            );
          }
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreenLayout()),
            );
          }
        },
      ),
    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position:
          RelativeRect.fromLTRB(1000, 80, 0, 0), // position of the popup menu
      items: [
        PopupMenuItem<String>(
          value: 'logout',
          child: Text('Log out'),
        ),
      ],
    ).then((String? value) {
      if (value == 'logout') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreenLayout()),
        );
      }
    });
  }

  Widget _buildProfileInfo(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter $label',
                ),
              )
            : Text(
                controller.text,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }
}