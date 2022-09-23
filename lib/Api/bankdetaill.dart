import 'dart:convert';
import 'package:http/http.dart' as http;

getbanks() async {
  try {
    final response = await http.get(Uri.parse(
        'https://demo.code7labs.com/api/moneytree-backend/bankdetails.php'));
    var jsonData = jsonDecode(response.body);
    print(" Json Data ${jsonData.length}");
    print(" vList final object${jsonData}");
    // print(jsonData[0][0]['service_name']);
    List<Bankcls> bankscreen = [];
    // print(" bankscreen : $bankscreen");
    for (var i = 0; i < jsonData.length; i++) {
      Bankcls servvices = Bankcls(
        bank_title: jsonData[i]['bank_title'],
        acc_ttitle: jsonData[i]['acc_ttitle'],
        acc_no: jsonData[i]['acc_no'],
        acc_iban: jsonData[i]['acc_iban'],
      );
      bankscreen.add(servvices);
    }

    print("List final is ${bankscreen[1].bank_title}");
    return bankscreen;
  } catch (e) {
    print(" error catch $e");
  }
}

class Bankcls {
  String? bank_title;
  String? acc_ttitle;
  String? acc_no;
  String? acc_iban;

  Bankcls(
      {required this.bank_title,
      required this.acc_ttitle,
      required this.acc_no,
      required this.acc_iban});
}
