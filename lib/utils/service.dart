import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  Future getKonseler() async {
    try {
      final response =
          await http.get(Uri.parse('https://reqres.in//api/users?page=2'));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body)['data'];
        print(jsonDecode(response.body)['data']);
        print(jsonDecode(response.body)['data']);
        List konseler = it.map((e) => KonselerModel.fromJson(e)).toList();
        return konseler;
      }
    } catch (e) {
      print(e);
    }
  }
}

class KonselerModel {
  final int id;
  final String email, nama, avatar;

  factory KonselerModel.fromJson(Map<String, dynamic> json) {
    return KonselerModel(
      id: json['id'],
      email: json['email'],
      nama: '${json['first_name']} + ${json['last_name']}',
      avatar: json['avatar'],
    );
  }

  KonselerModel(
      {required this.id,
      required this.email,
      required this.nama,
      required this.avatar});
}
