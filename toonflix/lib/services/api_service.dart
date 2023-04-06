import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final toon = WebtoonModel.fronJson(webtoon);
        webtoonInstances.add(toon);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getWebtoonDetail(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> webtoon = jsonDecode(response.body);
      final toon = WebtoonDetailModel.fromJson(webtoon);
      return toon;
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getWebtoonEpisode(String id) async {
    List<WebtoonEpisodeModel> webtoonEpisodeInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoonEpisodes = jsonDecode(response.body);
      for (var webtoonEpisode in webtoonEpisodes.sublist(0, 10)) {
        final toon = WebtoonEpisodeModel.fromJson(webtoonEpisode);
        webtoonEpisodeInstances.add(toon);
      }
      return webtoonEpisodeInstances;
    }
    throw Error();
  }
}
