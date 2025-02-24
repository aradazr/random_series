import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:watch_what/constans/app_colors.dart';
import 'package:watch_what/constans/responsive_text.dart';
import 'package:watch_what/data/project_manager.dart';

class WatchedSerialContainer extends StatelessWidget {
  const WatchedSerialContainer({
    super.key,
    required this.size,
    required this.series,
  });

  final Size size;
  final Series series;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 4.46,
      width: size.width / 1.09,
      decoration: BoxDecoration(
        color: DarkColors.greyButton,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width / 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 7,
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: Text(
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    series.name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: DarkColors.white,
                        fontSize: 20,
                        fontFamily: 'mont',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      series.point,
                      style: TextStyle(
                        color: DarkColors.white,
                        fontFamily: 'mont',
                        fontSize: const AdaptiveTextSize()
                            .getadaptiveTextSize(context, 16),
                      ),
                    ),
                    Image.asset('assets/images/star.png', height: 24),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    series.description,
                    style: TextStyle(
                      color: DarkColors.white,
                      fontFamily: 'vazirm',
                      fontSize: const AdaptiveTextSize()
                          .getadaptiveTextSize(context, 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width / 40,
          ),
          ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
                imageUrl: series.imagePath,
                height: size.height / 5.32,
                width: size.width / 3.165,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: SpinKitSpinningLines(
                      color: Colors.white,
                      size: 30.0,
                    ),
                ),
              )
              
              ),
        ],
      ),
    );
  }
}
