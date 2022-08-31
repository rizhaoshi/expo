import 'package:expo/app/models/article_model.dart';
import 'package:expo/app/widgets/avatar_role_name.dart';
import 'package:expo/app/widgets/comment_like_read.dart';
import 'package:expo/common/config/app_colors.dart';
import 'package:expo/utils/common_util.dart';
import 'package:flutter/material.dart';

class ArticleItemView extends StatefulWidget {
  final ArticleItem articleItem;
  final ValueChanged<ArticleItem> onTap;

  const ArticleItemView({Key? key, required this.articleItem, required this.onTap}) : super(key: key);

  @override
  State<ArticleItemView> createState() => _ArticleItemViewState();
}

const double paddingSize = 20;
const double spaceSize = 10;

class _ArticleItemViewState extends State<ArticleItemView> {
  late double boxSize;

  @override
  Widget build(BuildContext context) {
    boxSize = MediaQuery.of(context).size.width - paddingSize * 2;
    return InkWell(
      onTap: () {
        widget.onTap(widget.articleItem);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        width: double.infinity,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            const SizedBox(height: spaceSize),
            _getCoverByType(),
            const SizedBox(height: spaceSize),
            _bottom(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(widget.articleItem.title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 16, color: AppColors.active));
  }

  Widget _cover({int index = 0}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.assetNetwork(
        placeholder: CommonUtils.getCommonImageByName("lazy_1"),
        image: widget.articleItem.coverUrlList[index],
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _bottom() {
    return Row(
      children: [
        Expanded(
            child: AvatarRoleName(
          avatar: widget.articleItem.user.coverPictureUrl,
          nickname: widget.articleItem.user.nickname,
          type: widget.articleItem.user.type,
          showType: false,
        )),
        Expanded(
            child: CommentLikeRead(
          commentCount: widget.articleItem.commentCount,
          thumbUpCount: widget.articleItem.thumbUpCount,
          readCount: widget.articleItem.readCount,
        ))
      ],
    );
  }

  //根據圖片數量,随机获取显示类型
  //1张 1种 两张 2,3 3张 2,3,4,5,6,7//4张 2.3.4.5.6.7.8
  int getTypeByLength() {
    int length = widget.articleItem.coverUrlList.length;
    int coverType;
    switch (length) {
      case 1:
        coverType = 1;
        break;
      case 2:
        coverType = CommonUtils.getRandomRangeInt(2, 3);
        break;
      case 3:
        coverType = CommonUtils.getRandomRangeInt(2, 7);
        break;
      case 4:
        coverType = CommonUtils.getRandomRangeInt(2, 8);
        break;
      default:
        coverType = 1;
        break;
    }
    return coverType;
  }

  Widget _getCoverByType() {
    int coverType = getTypeByLength();
    Widget _coverWidget;

    switch (coverType) {
      case 1:
        _coverWidget = _cover1();
        break;
      case 2:
        _coverWidget = _cover2();
        break;
      case 3:
        _coverWidget = _cover3();
        break;
      case 4:
        _coverWidget = _cover4();
        break;
      case 5:
        _coverWidget = _cover5();
        break;
      case 6:
        _coverWidget = _cover6();
        break;
      case 7:
        _coverWidget = _cover7();
        break;
      case 8:
        _coverWidget = _cover8();
        break;
      default:
        _coverWidget = _cover1();
        break;
    }
    return _coverWidget;
  }

  Widget _cover1() {
    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: _cover(),
    );
  }

  Widget _cover2() {
    return Row(
      children: [
        SizedBox(
          width: (boxSize - spaceSize) / 2,
          height: boxSize,
          child: _cover(index: 0),
        ),
        const SizedBox(width: spaceSize),
        SizedBox(
          width: (boxSize - spaceSize) / 2,
          height: boxSize,
          child: _cover(index: 1),
        ),
      ],
    );
  }

  Widget _cover3() {
    return Column(
      children: [
        SizedBox(
          width: boxSize,
          height: boxSize / 2,
          child: _cover(index: 0),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: boxSize,
          height: boxSize / 2,
          child: _cover(index: 1),
        ),
      ],
    );
  }

  Widget _cover4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: boxSize / 2,
          height: boxSize,
          child: _cover(index: 0),
        ),
        Column(
          children: [
            SizedBox(
              width: (boxSize - spaceSize) / 2,
              height: (boxSize - spaceSize) / 2,
              child: _cover(index: 1),
            ),
            const SizedBox(height: spaceSize),
            SizedBox(
              width: (boxSize - spaceSize) / 2,
              height: (boxSize - spaceSize) / 2,
              child: _cover(index: 2),
            ),
          ],
        )
      ],
    );
  }

  Widget _cover5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: (boxSize - spaceSize) / 2,
              height: (boxSize - spaceSize) / 2,
              child: _cover(index: 0),
            ),
            const SizedBox(height: spaceSize),
            SizedBox(
              width: (boxSize - spaceSize) / 2,
              height: (boxSize - spaceSize) / 2,
              child: _cover(index: 1),
            ),
          ],
        ),
        SizedBox(
          width: boxSize / 2,
          height: boxSize,
          child: _cover(index: 2),
        ),
      ],
    );
  }

  Widget _cover6() {
    return Column(
      children: [
        SizedBox(
          width: boxSize,
          height: (boxSize - spaceSize) / 2,
          child: _cover(index: 0),
        ),
        const SizedBox(height: spaceSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 1),
            ),
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 2),
            ),
          ],
        )
      ],
    );
  }

  Widget _cover7() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: boxSize / 2,
              height: (boxSize) / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              width: (boxSize) / 2,
              height: (boxSize) / 2,
              child: _cover(index: 1),
            ),
          ],
        ),
        const SizedBox(height: spaceSize),
        SizedBox(
          width: boxSize,
          height: (boxSize - spaceSize) / 2,
          child: _cover(index: 2),
        ),
      ],
    );
  }

  Widget _cover8() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 0),
            ),
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 1),
            ),
          ],
        ),
        const SizedBox(height: spaceSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 2),
            ),
            SizedBox(
              width: boxSize / 2,
              height: boxSize / 2,
              child: _cover(index: 3),
            ),
          ],
        )
      ],
    );
  }
}
