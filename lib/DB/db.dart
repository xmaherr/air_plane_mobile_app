import '../models/user.dart';

List<User> userList=
[
  User('maher','nabil','maher@gmail.com','01023666','123'),
  User('omar','ebid','omar@gmail.com','01023666','123'),
  User('abdalla','nabil','abdalla@gmail.com','01023666','123'),
];
late User currentUser;
bool checkLogin(String emailAddress, String password){
  for(int i=0;i<userList.length;i++){
    if(userList[i].emailAddress==emailAddress){
      if(userList[i].password==password){
        currentUser=userList[i];
        return true;
      }
    }
  }
  return false;
}
bool isEmailAddressValid(String emailAddress){
  for(int i=0;i<userList.length;i++){
    if(userList[i].emailAddress==emailAddress){
      return false;
    }
  }
  return true;
}
bool isPhoneNumberValid(String phoneNumber){
  for(int i=0;i<userList.length;i++){
    if(userList[i].phoneNumber==phoneNumber){
      return false;
    }
  }
  return true;
}
void addUser(User user){
  userList.add(user);
}