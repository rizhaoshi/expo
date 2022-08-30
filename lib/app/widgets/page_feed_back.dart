import 'package:expo/app/models/enum.dart';
import 'package:expo/app/widgets/feed_back.dart';
import 'package:flutter/widgets.dart';

class PageFeedBack {
  final bool firstRefresh; // 是否首次加载
  final bool loading; // 是否在加载
  final bool error; // 是否异常
  final bool empty; // 是否空
  final String firstRefreshMsg; // 首次加载内容
  final String errorMsg; // 异常内容
  final String errorButtonText; // 异常重试按钮文字
  final String emptyMsg; // 空数据内容
  final String emptyButtonText; // 空数据重试按钮文字
  final VoidCallback? onErrorTap; // 异常重试回调
  final VoidCallback? onEmptyTap; // 空数据重试回调

  const PageFeedBack({
    this.firstRefresh = false,
    this.loading = true,
    this.error = false,
    this.empty = true,
    this.firstRefreshMsg = '正在拼命加载中',
    this.errorMsg = '未知异常，请联系管理员',
    this.errorButtonText = '点击重试',
    this.emptyMsg = '暂无数据',
    this.emptyButtonText = '点击重试',
    this.onErrorTap,
    this.onEmptyTap,
  });

  Widget build() {
    if (firstRefresh) {
      return FeedBack(
        onTap: () {},
        imageType: ImageType.loading,
        description: firstRefreshMsg,
      );
    }
    if (loading) return const SizedBox.shrink();

    if (error) {
      return FeedBack(
        onTap: onEmptyTap ?? () {},
        imageType: ImageType.error,
        description: emptyMsg,
        showButton: true,
        buttonText: emptyButtonText,
      );
    }
    if (empty) {
      return FeedBack(
        onTap: onEmptyTap ?? () {},
        imageType: ImageType.empty,
        description: emptyMsg,
        buttonText: emptyButtonText,
        showButton: true,
      );
    }
    return const SizedBox.shrink();
  }
}
