import 'package:flutter/material.dart';

import '../../common/widgets/logo_app_header/logo_app_header.dart';

class DynamicForYouHeader extends StatelessWidget {
  const DynamicForYouHeader({super.key});


  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: LogoAppHeader(),
    );
  }
}
