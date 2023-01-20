import 'dart:convert';

import 'package:project_zyzz/models/api_response.dart';
import 'package:project_zyzz/models/user.dart';
import 'package:project_zyzz/models/user_for_listing.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:project_zyzz/models/user_insert.dart';
import 'package:project_zyzz/models/user_update.dart';

class UserService {
  static const api = 'https://2cae-148-204-56-40.ngrok.io';
  static const headers = {'Content-Type': 'application/json'};

  Future<APIResponse<List<UserForListing>>> getUserList() {
    return http.get(Uri.parse('$api/user'), headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final users = <UserForListing>[];
        for (var item in jsonData) {
          users.add(UserForListing.fromJson(item));
        }
        return APIResponse<List<UserForListing>>(data: users);
      }
      return APIResponse<List<UserForListing>>(
          error: true, errorMessage: 'An error occured');
    }).catchError((_) => APIResponse<List<UserForListing>>(
        error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<User>> getUserById(int userId) {
    return http
        .get(Uri.parse('$api/user/$userId'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<User>(data: User.fromJson(jsonData));
      }
      return APIResponse<User>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<User>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<User>> getUserByEmail(String userEmail) {
    //print('$API/user/userEmail/query?userEmail=$userEmail');
    return http
        .get(Uri.parse('$api/user/email/$userEmail'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<User>(data: User.fromJson(jsonData));
      }
      return APIResponse<User>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            APIResponse<User>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> createUser(UserInsert item) {
    return http
        .post(Uri.parse('$api/user'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            // ignore: invalid_return_type_for_catch_error
            APIResponse<User>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> updateUser(UserUpdate item) {
    return http
        .post(Uri.parse('$api/user'),
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
            // ignore: invalid_return_type_for_catch_error
            APIResponse<User>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> deleteUser(int userId) {
    return http.delete('$api/user/$userId', headers: headers).then((data) {
      if (data.statusCode == 204) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    }).catchError((_) =>
        APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}
