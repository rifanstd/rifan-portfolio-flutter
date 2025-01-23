import 'package:flutter/material.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/data/models/journey_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimelineJourneyItem extends StatelessWidget {
  final List<JourneyModel> journeys;

  const TimelineJourneyItem({super.key, required this.journeys});

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      builder: TimelineTileBuilder(
        itemCount: journeys.length,
        indicatorBuilder: (context, index) => DotIndicator(
          color: AppColor.primary.withOpacity(.8),
          size: 12,
        ),
        startConnectorBuilder: (context, index) => index == 0
            ? null
            : SolidLineConnector(
                color: AppColor.primary.withOpacity(.8),
                thickness: 1,
              ),
        endConnectorBuilder: (context, index) => index == journeys.length - 1
            ? null
            : SolidLineConnector(
                color: AppColor.primary.withOpacity(.8),
                thickness: 1,
              ),
        contentsAlign: ContentsAlign.alternating,
        contentsBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                journeys.elementAt(index).major,
                style: AppText.bold14,
              ),
              UIUtils.verticalSpace(4),
              Text(
                "${journeys.elementAt(index).school}, ${journeys.elementAt(index).country}",
                style: AppText.bold12Grey,
              ),
              UIUtils.verticalSpace(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                  UIUtils.horizontalSpace(4),
                  Text(
                      "${journeys.elementAt(index).startYear} - ${journeys.elementAt(index).endYear}",
                      style: AppText.bold12Grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
