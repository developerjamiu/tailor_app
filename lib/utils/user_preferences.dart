// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tailor_app/sign_in_screen/model.dart';
// import 'package:tailor_app/sign_up_screen/model.dart';
//
// class UserPreferences{
//   Future<bool> saveSignUpUser(SignUpModel user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     print('printing my prefenrences');
//
//     await prefs.setString("first_name", user.firstName);
//     await prefs.setString("last_name", user.lastName);
//     await prefs.setString("email", user.email);
//     await prefs.setString("phone", user.phone);
//     await prefs.setString("country", user.country);
//     await prefs.setString("type", user.accountType);
//     await prefs.setString("password", user.password);
//     await prefs.setString("c_pass", user.cPassword);
//     await prefs.setString("token", user.user.accessToken);
//
//     return prefs.commit();
//   }
//
//   Future<bool> saveLoginUser(LoginModel user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString("first_name", user.user.users.firstname);
//     await prefs.setString("last_name", user.user.users.lastname);
//     await prefs.setString("email", user.user.users.email);
//     await prefs.setString("phone", user.user.users.phone);
//     await prefs.setString("country", user.user.users.country);
//     await prefs.setString("type", user.user.users.type);
//     // prefs.setString("password", user.user.users.p);
//     // prefs.setString("c_pass", user.cPassword);
//     await prefs.setString("token", user.user.accessToken);
//
//     return prefs.commit();
//   }
//
//   Future<SignUpModel> getSignUpUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String firstName = prefs.getString("first_name");
//     String lastName = prefs.getString("last_name");
//     String email = prefs.getString("email");
//     String phone = prefs.getString("phone");
//     String type = prefs.getString("type");
//     String country= prefs.getString("country");
//     String password = prefs.getString("password");
//     String confirmPassword = prefs.getString("c_pass");
//     String token = prefs.getString("token");
//
//     return SignUpModel(
//         user:User(accessToken:token),
//         firstName: firstName,
//         lastName: lastName,
//         email: email,
//         phone: phone,
//         accountType: type,
//         password: password,
//         country: country,
//         cPassword: confirmPassword,
//         );
//   }
//
//   Future<LoginModel> getLoginUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String firstName = prefs.getString("first_name");
//     String lastName = prefs.getString("last_name");
//     String email = prefs.getString("email");
//     String phone = prefs.getString("phone");
//     String type = prefs.getString("type");
//     String country= prefs.getString("country");
//     String token = prefs.getString("token");
//     // String confirmPassword = prefs.getString("c_pass");
//
//     return LoginModel(
//       user: Userr(
//         accessToken: token,
//         users: Users(
//           firstname: firstName,
//           lastname: lastName,
//           email: email,
//           phone: phone,
//           type: type,
//           country: country,
//         )
//       ),
//     );
//   }
//
//   void removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     await prefs.remove("first_name");
//     await prefs.remove("last_name");
//     await prefs.remove("email");
//     await prefs.remove("phone");
//     await prefs.remove("type");
//     await prefs.remove("password");
//     await prefs.remove("country");
//     await prefs.remove("c_pass");
//   }
//
//   Future<String> getToken(args) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String token = prefs.getString('token');
//     return token;
//   }
// }