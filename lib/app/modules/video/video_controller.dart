import 'package:get/get.dart';
import '../../../utils/object_util.dart';
import '../home/home_video/video_info_state.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  final VideoInfoState state = VideoInfoState();

  @override
  void onInit() {
    super.onInit();
    // 获取参数
    Map arg = Get.arguments;
    if (ObjectUtil.isEmptyMap(arg)) return;
    state.videoItem = arg['videoItem'];

    // 播放器控制器
    state.playerController = VideoPlayerController.network(
      state.videoItem.videoUrl,
    );
    // 播放器初始化
    state.playerFuture = state.playerController.initialize();
    // 播放器完成初始化
    state.playerFuture.then((_) {
      state.playerController.play();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    state.playerController.dispose();
    super.dispose();
  }

  // 播放或暂停
  void onPlayOrPause() {
    if (state.playerController.value.isPlaying) {
      state.playerController.pause();
    } else {
      state.playerController.play();
    }
  }
}
