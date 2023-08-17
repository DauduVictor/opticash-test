import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:opticash_test/models/user-model.dart';
import 'package:opticash_test/utils/utils.dart';

class UserRepository {
  Future createAccount({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    Map<String, String> body = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
    };
    var response;

    try {
      response = await http.post(
        Uri.parse('$baseUrl/user/test/register'),
        headers: header,
        body: jsonEncode(body),
      );
    } on Exception catch (e) {
      ErrorHandler().handleError(e);
    }

    var responseJson = json.decode(response.body);
    log('url ::: $baseUrl/user/test/register');
    log('api response ::: ${responseJson.toString()}');

    if (response.statusCode == 200) {
      return '${responseJson['data']}';
    } else {
      throw ('${responseJson['message']}');
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    };
    Map<String, String> body = {
      'email': email,
      'password': password,
    };
    var response;

    try {
      response = await http.post(
        Uri.parse('$baseUrl/user/test/login'),
        headers: header,
        body: jsonEncode(body)
      );
    } on Exception catch (e) {
      ErrorHandler().handleError(e);
    }

    var responseJson = json.decode(response.body);
    log('url ::: $baseUrl/user/test/login');
    log('api response ::: ${responseJson.toString()}');

    if (response.statusCode == 200) {
      return UserModel.fromJson(responseJson['data']);
    } else {
      throw ('${responseJson['message']}');
    }
  }
}

class ErrorHandler {
  /// Function to handle error messages from the server
  void handleError(dynamic e) {
    if (e is HandshakeException ||
        e.toString().contains('HandshakeException')) {
      throw ('Error occurred, please try again');
    } else if (e is SocketException ||
        e.toString().contains('SocketException')) {
      throw ('No internet connection');
    }
    if (e is TimeoutException || e.toString().contains('TimeoutException')) {
      throw ('Request timeout, try again');
    }
    if (e is FormatException || e.toString().contains('FormatException')) {
      throw ('Error occurred, please try again');
    }
    throw (e);
  }
}
