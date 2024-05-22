import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../layout/login_page_layout.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;
  final TextEditingController nameController =
      TextEditingController(text: UserModel.currentUser?.name);
  final TextEditingController ageController = TextEditingController(text: '22');
  final TextEditingController phoneController =
      TextEditingController(text: UserModel.currentUser?.phone);
  final TextEditingController emailController =
      TextEditingController(text: UserModel.currentUser?.email);
  final TextEditingController genderController =
      TextEditingController(text: UserModel.currentUser?.gender);
  bool isUserDataVisible = false;
  bool isSecurityVisible = false;
  List data = [];

  getData() async{
    // if (UserModel.currentUser != null) {
    //   await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
    //     'email': email,
    //     'first_name': firstName,
    //   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var db = FirebaseFirestore.instance;

  }
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
        title: const Text(
            'Profile',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        backgroundColor: const Color(0xFF161E36),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 103,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('lib/images/male.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isUserDataVisible = !isUserDataVisible;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        isUserDataVisible ? 'Hide Personal Information' : 'Show Personal Information',
                        style: TextStyle(
                          color: Color(0xFF161E36),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(flex: 1),
                      Icon(
                        isUserDataVisible ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
                        color: Color(0xFFFF8B3D),
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              if (isUserDataVisible) ...[
                GestureDetector(
                  onTap: () {
                    // Dismiss the keyboard when tapping outside of text fields
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: SingleChildScrollView(
                      child: Padding(
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
                                          title: const Text('Saved'),
                                          content: const Text('Changes saved successfully.'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('OK'),
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
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFF8B3D)),
                                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                  ),
                                ),
                                child: Text(
                                  isEditing ? 'Save' : 'Edit',
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSecurityVisible= !isSecurityVisible;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        'security',
                        style: TextStyle(
                          color: Color(0xFF161E36),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Spacer(flex: 1),
                      Icon(
                        isSecurityVisible ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,
                        color: Color(0xFFFF8B3D),
                        size: 35,
                      ),
                    ],
                  ),
                ),
              ),
              if(isSecurityVisible)...[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/reset_password');
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'reset password',
                        style: TextStyle(
                          color: Color(0xFF161E36),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),

    );
  }

  void _showPopupMenu(BuildContext context) {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(
          1000, 80, 0, 0), // position of the popup menu
      items: [
        const PopupMenuItem<String>(
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
          style: const TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter $label',
                ),
              )
            : Text(
                controller.text,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ],
    );
  }

  Widget buildUserData(){
    return Container(
      width: 100,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text("maher"),
          const SizedBox(height: 8.0),
          Text(
            'Age:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text("19"),
          const SizedBox(height: 8.0),
          // Add similar lines for phone, email, gender, and date of birth
        ],
      ),
    );
  }

}
