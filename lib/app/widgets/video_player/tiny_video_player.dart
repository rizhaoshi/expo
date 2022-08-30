import 'package:expo/app/widgets/video_player/video_intro.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';
import '../../models/video_model.dart';
import 'package:video_player/video_player.dart';
import 'actions_toolbar.dart';

class TinyVideoPlayer extends StatefulWidget {
  final VideoItem videoItem;

  const TinyVideoPlayer({Key? key, required this.videoItem}) : super(key: key);

  @override
  State<TinyVideoPlayer> createState() => _TinyVideoPlayerState();
}

class _TinyVideoPlayerState extends State<TinyVideoPlayer> with SingleTickerProviderStateMixin {
  //播放器控制器
  late VideoPlayerController _videoPlayerController;

  //播放器 Future
  late Future<void> _initializeVideoPlayerFuture;

  //动画控制器
  late AnimationController _animationController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoItem.videoUrl);
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    _videoPlayerController.setLooping(true);
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    _initializeVideoPlayerFuture.then((value) {
      setState(() {
        //开始播放
        _videoPlayerController.play();
        //动画执行
        _animationController.forward(from: 0.0);
      });
    });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //继续执行
        _animationController.forward(from: 0.0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  //播放或者暂停
  void _onPlayOrPause() {
    setState(() {
      if (_videoPlayerController.value.isPlaying) {
        _videoPlayerController.pause();
        _animationController.stop();
      } else {
        _videoPlayerController.play();
        _animationController.forward(from: _animationController.value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _videoPlayer(),
          _playIcon(),
          _loading(),
          Positioned(
              right: CommonUtils.toRpx(context, 10),
              bottom: CommonUtils.toRpx(context, 20),
              child: ActionsToolbar(
                commentCount: widget.videoItem.commentCount,
                thumbUpCount: widget.videoItem.thumbUpCount,
                shareCount: 0,
                thumbUp: false,
                animationController: _animationController,
                userAvatar: widget.videoItem.user.coverPictureUrl,
              )),
          Positioned(
              left: CommonUtils.toRpx(context, 20),
              right: CommonUtils.toRpx(context, 160),
              bottom: CommonUtils.toRpx(context, 20),
              child: VideoIntro(
                nickname: widget.videoItem.user.nickname,
                intro: widget.videoItem.intro,
              ))
        ],
      ),
    );
  }

  Widget _videoPlayer() {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: GestureDetector(
                onTap: _onPlayOrPause,
                child: AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                ),
              ),
            );
          } else {
            return Image.network(
              widget.videoItem.coverPictureUrl,
              fit: BoxFit.cover,
            );
          }
        });
  }

  //播放按钮
  Widget _playIcon() {
    if (_videoPlayerController.value.isInitialized && !_videoPlayerController.value.isPlaying) {
      return Center(
        child: GestureDetector(
          onTap: _onPlayOrPause,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(
              CommonUtils.getImageAssetByName("play_plus"),
              width: CommonUtils.toRpx(context, 98),
              height: CommonUtils.toRpx(context, 98),
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  //缓冲中...
  Widget _loading() {
    if (_videoPlayerController.value.isBuffering) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const SizedBox.shrink();
  }
}
