import 'package:news/src/resources/news_api_provider.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  test('fetchTopIds return a list of ids', () async {
    final apiProvider = NewsApiProvider();

    // faz o mock do client para que não seja utilizado
    // o request direto pra api, e sim apenas uma simulação
    apiProvider.client = MockClient((request) async {
      return Response(jsonEncode([1, 2, 3, 4, 5]), 200);
    });

    final ids = await apiProvider.fetchTopIds();
    expect(ids, [1, 2, 3, 4, 5]);
  });

  test('fetchItem return a item model', () async {
    final apiProvider = NewsApiProvider();

    apiProvider.client = MockClient((request) async {
      return Response(jsonEncode({'id': 123}), 200);
    });
    final item = await apiProvider.fetchItem(999);

    expect(item.id, 123);
  });
}
