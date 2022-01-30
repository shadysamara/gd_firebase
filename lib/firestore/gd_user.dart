import 'package:flutter/material.dart';

class GdUser {
  String id;
  String name;
  String phone;
  String address;
  String email;
  String password;

  GdUser({
    this.id,
    @required this.name,
    @required this.phone,
    @required this.address,
    @required this.email,
    @required this.password,
  });

  toMap() {
    return {
      'name': this.name,
      'phone': this.phone,
      'address': this.address,
      'email': this.email
    };
  }
}
