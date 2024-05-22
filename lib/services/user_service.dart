import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_flutter/constants/api_end_points.dart';
// import 'package:quizz_flutter/models/LoginModel.dart';
import 'package:quizz_flutter/services/settings/headers.dart';

class UserService {
  GetStorage storageBox = GetStorage();

  login(String email, password) async {
    try {
      final response = await http.post(
        Uri.parse(loginUrl),
        headers: headers(),
        body: {'email': email, 'password': password},
      );
      return response.body;
    } catch (e) {
      print('hata login $e');
      rethrow;
    }
  }

  register(String email, username, name, lastname, password) async {
    try {
      final response = await http.post(
        Uri.parse(registerUrl),
        headers: headers(),
        body: {
          'email': email,
          'username': username,
          'name': name,
          'lastname': lastname,
          'password': password
        },
      );
      print(response.body);
      return response.body;
    } catch (e) {
      print('hata register $e');
      rethrow;
    }
  }

  forgetPassword(String email) async {
    try {
      final response = await http.post(
        Uri.parse(resetPasswordEmailUrl),
        headers: headers(),
        body: {'email': email},
      );

      return response.body;
    } catch (e) {
      print('hata frget password $e');
    }
  }

  checkCode(String code) async {
    try {
      final response = await http.post(Uri.parse(checkResetCodeUrl),
          headers: headers(), body: {'code': code});
      return response.body;
    } catch (e) {
      print('hata check code $e');
    }
  }

  resetPassword(String code, String password) async {
    try {
      final response = await http.post(
        Uri.parse(resetPasswordUrl),
        headers: headers(),
        body: {'code': code, 'password': password},
      );

      return response.body;
    } catch (e) {
      print('hataaa  reset password $e');
    }
  }

  logout() async {
    try {
      var response = await http.post(Uri.parse(logoutUrl), headers: headers());
      return response.body;
    } catch (e) {
      print('hataa logout $e');
    }
  }

  currentUser() async {
    try {
      var response =
          await http.get(Uri.parse(currentUserUrl), headers: headers());

      return response.body;
    } catch (e) {
      print('curren user hata $e');
    }
  }

  Future<String?> profileUpdate(Map<String, dynamic> updatedFields) async {
    try {
      var response = await http.post(Uri.parse(updateProfileUrl),
          headers: headers(), body: updatedFields);
      return response.body;
    } catch (e) {
      print('profile update hata $e');
    }
    return null;
  }

  sendEmailChangeCode(String email) async {
    try {
      var response = await http.post(Uri.parse(changeEmailCodeUrl),
          headers: headers(), body: {"email": email});
      return response.body;
    } catch (e) {
      print('sendEmailChangeCode hata $e');
    }
  }

  checkEmailCode(String code) async {
    try {
      final response = await http.post(Uri.parse(checkChangeEmailUrl),
          headers: headers(), body: {'code': code});
      return response.body;
    } catch (e) {
      print('hata check code $e');
    }
  }

  changeEmail(String code, String email) async {
    try {
      final response = await http.post(Uri.parse(changeEmailUrl),
          headers: headers(), body: {'code': code, 'email': email});
      return response.body;
    } catch (e) {
      print('hata changeEmail $e');
    }
  }

  answers({int categoryId = 0}) async {
    try {
      final url = categoryId > 0 ? '$answersUrl/$categoryId' : answersUrl;
      final response = await http.get(Uri.parse(url), headers: headers());

      // final response =
      //     await http.get(Uri.parse(answersUrl), headers: headers());
      return response.body;
    } catch (e) {
      print('hata answers $e');
    }
  }

  Future<String> allCategory() async {
    try {
      final response =
          await http.get(Uri.parse(allCategoryUrl), headers: headers());
      return response.body;
    } catch (e) {
      print('hata answers $e');
      return '';
    }
  }
}
