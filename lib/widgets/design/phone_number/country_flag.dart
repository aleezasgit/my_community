import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'country_code.dart';

class CountryFlag extends StatelessWidget {
  final CountryCode country;
  final double size;

  const CountryFlag({super.key, required this.country, this.size = 28});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6.r),
      child: SizedBox(width: size.w, height: size.w, child: _flag()),
    );
  }

  Widget _flag() {
    if (country.flagAsset.endsWith('.svg')) {
      return SvgPicture.asset(country.flagAsset, fit: BoxFit.cover);
    }
    if (country.flagAsset.isNotEmpty) {
      return Image.asset(country.flagAsset, fit: BoxFit.cover);
    }
    return Center(
      child: Text(
        _emoji(country.isoCode),
        style: TextStyle(fontSize: (size * 0.8).sp),
      ),
    );
  }

  String _emoji(String iso) {
    if (iso.length != 2) return '🏳️';
    return iso
        .toUpperCase()
        .codeUnits
        .map((c) => String.fromCharCode(0x1F1E6 + c - 65))
        .join();
  }
}
