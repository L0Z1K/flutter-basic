import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/webtoon_episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoonDetail;
  late Future<List<WebtoonEpisodeModel>> webtoonEpisodes;
  late SharedPreferences prefs;

  bool? isLiked = false;

  clickFavorite() {
    setState(() {
      isLiked ??= false;
      isLiked = !isLiked!;
    });
    prefs.setBool(widget.id, isLiked!);
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    isLiked = prefs.getBool(widget.id);
    if (isLiked == null) {
      prefs.setBool(widget.id, false);
      setState(() {
        isLiked = false;
      });
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    webtoonDetail = ApiService.getWebtoonDetail(widget.id);
    webtoonEpisodes = ApiService.getWebtoonEpisode(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        foregroundColor: const Color(0xFF00DC64),
        actions: [
          IconButton(
            onPressed: clickFavorite,
            icon: Icon(
              isLiked! ? Icons.favorite : Icons.favorite_border,
            ),
          ),
        ],
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      width: 250,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(3, 3),
                            ),
                          ]),
                      child: Image.network(
                        widget.thumb,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              FutureBuilder(
                future: webtoonDetail,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.about,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '${snapshot.data!.genre} / ${snapshot.data!.age}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Text("...");
                  }
                },
              ),
              const SizedBox(height: 30),
              FutureBuilder(
                future: webtoonEpisodes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        for (var episode in snapshot.data!)
                          WebtoonEpisode(
                            episode: episode,
                            webtoonId: widget.id,
                          )
                      ],
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
