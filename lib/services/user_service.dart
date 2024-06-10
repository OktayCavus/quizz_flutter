import 'dart:convert';

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

      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        String token = responseBody['data']['token'];
        storageBox.write('accessToken', token);
      }
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

      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('hata register $e');
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
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
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

      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
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

      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('curren user hata $e');
    }
  }

  Future<String?> profileUpdate(Map<String, dynamic> updatedFields) async {
    try {
      var response = await http.post(Uri.parse(updateProfileUrl),
          headers: headers(), body: updatedFields);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('profile update hata $e');
    }
    return null;
  }

  sendEmailChangeCode(String email) async {
    try {
      var response = await http.post(Uri.parse(changeEmailCodeUrl),
          headers: headers(), body: {"email": email});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('sendEmailChangeCode hata $e');
    }
  }

  checkEmailCode(String code) async {
    try {
      final response = await http.post(Uri.parse(checkChangeEmailUrl),
          headers: headers(), body: {'code': code});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('hata check code $e');
    }
  }

  changeEmail(String code, String email) async {
    try {
      final response = await http.post(Uri.parse(changeEmailUrl),
          headers: headers(), body: {'code': code, 'email': email});
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('hata changeEmail $e');
    }
  }

  answers({int categoryId = 0}) async {
    try {
      final url = categoryId > 0 ? '$answersUrl/$categoryId' : answersUrl;
      final response = await http.get(Uri.parse(url), headers: headers());

      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('hata answers $e');
    }
  }

  testCategories() async {
    try {
      final response =
          await http.get(Uri.parse(testCategoriesUrl), headers: headers());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        await login(storageBox.read('email'), storageBox.read('password'));
      }
    } catch (e) {
      print('hata answers $e');

      return '';
    }
  }

  selectedQuestion(int selectedQuestionId) async {
    try {
      String url = '$selectedQuestionUrl/$selectedQuestionId';
      final response = await http.get(Uri.parse(url), headers: headers());
      return response.body;
    } catch (e) {
      print('hata selectedQuestion $e');

      return '';
    }
  }

  getCategoryTest(int categoryId) async {
    try {
      String url = '$getCategoryTestUrl/$categoryId';
      var response = await http.get(Uri.parse(url), headers: headers());
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      print('getCategoryTest $e');
    }
  }

  Future<String> allCategory() async {
    try {
      final response =
          await http.get(Uri.parse(allCategoryUrl), headers: headers());
      return response.body;
    } catch (e) {
      print('hata allCategory $e');

      return '';
    }
  }

  getListQuestionTest(int testId, {int limit = 1, int page = 1}) async {
    try {
      String url = '$listTestUrl?test_id=$testId&limit=$limit&page=$page';
      var response = await http.get(Uri.parse(url), headers: headers());
      return response.body;
    } catch (e) {
      print('hata getListQuestionTest $e');
    }
  }

  submitAnswers(
      int testId, int categoryId, List<Map<String, int>> answers) async {
    try {
      var headers = {
        'Authorization': 'bearer ${storageBox.read('accessToken')}',
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(submitAnswersUrl));
      request.body = json.encode(
          {"test_id": testId, "category_id": categoryId, "answers": answers});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(await response.stream.bytesToString());
        return jsonData;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print('hata submit answer $e');
    }
  }

  getUsersTests(int categoryId) async {
    try {
      String url = getUserTestsUrl + categoryId.toString();
      var response = await http.get(Uri.parse(url), headers: headers());
      return response.body;
    } catch (e) {
      print('hataaa getUsersTests $e');
    }
  }

  getUsersAnswersTests(int categoryId, int testId) async {
    try {
      String url = '$getTestCategoryAnswerUrl$categoryId/$testId';
      var response = await http.get(Uri.parse(url), headers: headers());
      return response.body;
    } catch (e) {
      print('hataaa getUsersAnswersTests $e');
    }
  }
}
