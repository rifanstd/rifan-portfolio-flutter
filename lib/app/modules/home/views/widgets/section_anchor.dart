import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionAnchor extends GetView<HoldScrollActivity> {
  final GlobalKey sectionKey;

  const SectionAnchor({super.key, required this.sectionKey});

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink(
      key: sectionKey,
    );
  }
}
