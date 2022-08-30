import 'package:flutter/material.dart';
import '../../../models/video_model.dart';
import '../../../services/video_service.dart';
import '../../../widgets/page_feed_back.dart';
import '../../../widgets/video_player/tiny_video_player.dart';

/// 小视频详情
class TinyVideoInfoPage extends StatefulWidget {
  final int infoId;

  const TinyVideoInfoPage({Key? key, required this.infoId}) : super(key: key);

  @override
  State<TinyVideoInfoPage> createState() => _TinyVideoInfoPageState();
}

class _TinyVideoInfoPageState extends State<TinyVideoInfoPage> {
  late VideoItem videoInfo;
  bool loading = true;
  bool error = false;
  String errorMsg = "";

  @override
  void initState() {
    super.initState();
    _getTinyVideoInfo();
  }

  Future _getTinyVideoInfo() async {
    try {
      Map<String, dynamic> info = await VideoService.getVideoInfo(widget.infoId);

      setState(() {
        videoInfo = VideoItem.fromJson(info);
      });
    } catch (e) {
      setState(() {
        error = true;
        errorMsg = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _body;
    if (loading) {
      _body = const PageFeedBack(firstRefresh: true).build();
    } else if (error) {
      _body = PageFeedBack(
        loading: false,
        error: true,
        errorMsg: errorMsg,
        onErrorTap: () {
          setState(() {
            loading = true;
            error = false;
          });
          _getTinyVideoInfo();
        },
      ).build();
    } else {
      _body = TinyVideoPlayer(videoItem: videoInfo);
    }

    return Scaffold(
      body: Stack(
        children: [
          _body,
          SafeArea(
            child: SizedBox(
              height: kToolbarHeight,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
