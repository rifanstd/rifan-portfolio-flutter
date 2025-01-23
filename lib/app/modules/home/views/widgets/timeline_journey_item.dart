import 'package:flutter/material.dart';
import 'package:portfolio/app/core/styles/app_button.dart';
import 'package:portfolio/app/core/styles/app_color.dart';
import 'package:portfolio/app/core/styles/app_text.dart';
import 'package:portfolio/app/core/utils/ui_utils.dart';
import 'package:portfolio/app/data/models/journey_model.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TimelineJourneyItem extends StatelessWidget {
  final List<JourneyModel> journeys;
  final void Function(JourneyModel journey) onClick;

  const TimelineJourneyItem({super.key, required this.journeys, required this.onClick});

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
                journeys.elementAt(index).title,
                style: AppText.bold14,
              ),
              UIUtils.verticalSpace(4),
              Text(
                "${journeys.elementAt(index).institution}, ${journeys.elementAt(index).location}",
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
                    "${journeys.elementAt(index).startDate} - ${journeys.elementAt(index).endDate}",
                    style: AppText.bold12Grey,
                  ),
                ],
              ),
              UIUtils.verticalSpace(16),
              FilledButton(
                onPressed: () => onClick(journeys.elementAt(index)),
                style: AppButton.smallFilledPrimary(context),
                child: Text(
                  "Read More",
                  style: AppText.bold12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
