import 'package:expo/app/widgets/page_feed_back.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/video_player/tiny_video_player.dart';
import 'video_controller.dart';
import '../../../common/config/api_config.dart';
import '../../models/video_model.dart';
import '../../services/video_service.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  // VideoController controller = Get.find<VideoController>();

  late PageController pageController;
  List<VideoItem> videos = VideoList([]).list;
  int page = 1;
  int limit = Api.limit;
  bool hasMore = true;
  bool loading = true;
  bool isError = false;
  String errorMag = "";

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    getVideoList();
  }

  Future getVideoList({bool push = false}) async {
    try {
      //请求获取数据
      Map<String, dynamic> result = await VideoService.getVideoList(page: page, limit: limit);
      // 将数据转成实体类
      VideoList videoList = VideoList.fromJson(result['data']);
      setState(() {
        hasMore = page * limit < result['total'];
        page++;
        if (push) {
          videos.addAll(videoList.list);
        } else {
          videos = videoList.list;
        }
        isError = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        errorMag = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  // 监听页面切换
  void onPageChanged(int index) {
    // 最后一个页面
    if (videos.length - 1 == index && hasMore) {
      getVideoList(push: false);
    }
  }

  onRefresh() async {
    page = 1;
    setState(() {
      loading = true;
      isError = false;
    });
    await getVideoList();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _body;
    if (loading) {
      _body = const PageFeedBack(firstRefresh: true).build();
    } else if (isError) {
      _body = PageFeedBack(
          loading: false,
          error: true,
          errorMsg: errorMag,
          onEmptyTap: () {
            onRefresh();
          }).build();
    } else {
      _body = PageView.builder(
          controller: pageController,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.vertical,
          itemCount: videos.length,
          itemBuilder: (BuildContext context, int index) {
            return TinyVideoPlayer(videoItem: videos[index]);
          });
    }
    return Scaffold(
      body: _body,
    );
  }
}
