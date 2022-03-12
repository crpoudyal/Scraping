import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

class Scraper {
  static const URL = 'https://www.tufohss.edu.np/index.php/notices/';
  static void getData() async {
    final response = await http.get(Uri.parse(URL));
    final body = response.body;
    final html = parse(body);
    final list = html.querySelectorAll('tbody tr');
    for (var ls in list) {
      print(" List : ${ls.text.trim()}");
    }
    final data = html.querySelectorAll('.entry-content')[0];
    final datas = data.querySelectorAll('tr');

    for (var row in datas) {
      final rowData = row.querySelectorAll('td');
      if (rowData.isNotEmpty) {
        print("Title : ${rowData[0].text.trim()}");
      }
    }
  }
}

void main(List<String> arguments) {
  Scraper.getData();
}
