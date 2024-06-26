// ignore_for_file: library_prefixes

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technews/controller/news_controller.dart';
import 'package:technews/custom_widget.dart';
import 'package:technews/model/news_model.dart';
import 'package:technews/trending.dart';
import 'package:technews/utils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class SeeNewsDetailPage extends StatefulWidget {
  final News? news;

  const SeeNewsDetailPage({Key? key, this.news}) : super(key: key);

  @override
  State<SeeNewsDetailPage> createState() => _SeeNewsDetailPageState();
}

class _SeeNewsDetailPageState extends State<SeeNewsDetailPage> {
  final NewsController _newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: CustomWidget.getAppBarWithShare(context, news: widget.news),
        body: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      children: [
                        CustomWidget.getProfileImage(widget.news!.source.name,
                            size: 85),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomWidget.getBoldText(widget.news!.source.name),
                            CustomWidget.blurredText(
                                "${timeAgo(widget.news!.publishedAt.toString())}",
                                size: 12),
                          ],
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        _newsController.savedNews.contains(widget.news)
                            ? IconButton(
                                onPressed: () {
                                  _newsController
                                      .removeNewsFromSaved(widget.news!);
                                },
                                icon: const Icon(Icons.bookmark),
                                color: Colors.red,
                              )
                            : IconButton(
                                onPressed: () {
                                  _newsController.saveNews(widget.news!);
                                },
                                icon: const Icon(Icons.bookmark_border),
                                color: Colors.red,
                                // color: Theme.of(context).primaryColor,
                              ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomWidget.getNetWorkImage(
                          context, widget.news!.urlToImage ?? ""),
                      const SizedBox(height: 10),
                      // CustomWidget.blurredText("Europe"),
                      CustomWidget.getBoldText(
                          widget.news?.title ?? "There is no news title"),
                      getNewsBody(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNewsBody() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(children: [
        CustomWidget.getNormalText(
            textTrimmer(
            widget.news?.content ??
                widget.news?.description ??
                "There is no news content",
            ((widget.news?.content ??
                        widget.news?.description ??
                        "There is no news content")
                    .contains('[')
                ? (widget.news?.content ?? widget.news?.description ?? "")
                    .indexOf('[')
                : (widget.news?.content ?? widget.news?.description ?? "")
                            .length >
                        100
                    ? 100
                    : (widget.news?.content ?? widget.news?.description ?? "")
                        .length))),
        const SizedBox(
          height: 5,
        ),
        widget.news?.url != null
            ? UrlButton(url: widget.news?.url ?? "")
            : Container()
      ]),
    );
  }
}

class UrlButton extends StatelessWidget {
  final String url;

  UrlButton({Key? key, required this.url}) : super(key: key);

  Future<void> _launchURL() async {
    // ignore: deprecated_member_use
    if (await UrlLauncher.canLaunch(url)) {
      await UrlLauncher.launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _launchURL,
      child: const Text('Browse'),
    );
  }
}
