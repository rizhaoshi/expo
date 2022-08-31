import 'package:video_player/video_player.dart';
import 'package:expo/app/models/video_model.dart';

class VideoInfoState {
  late VideoItem videoItem;

  //播放器实例
  late VideoPlayerController playerController;

  // 播放器初始化的Future
  late Future<void> playerFuture;
}
