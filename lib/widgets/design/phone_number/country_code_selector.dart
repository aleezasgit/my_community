import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_community_at_app/configs/configs.dart';
import 'package:my_community_at_app/widgets/core/headers/bottomsheet_header.dart';
import 'package:my_community_at_app/widgets/design/textfields/search_textfield/search_field.dart';
// TODO: fix to your SearchField path

import 'country_code.dart';
import 'country_flag.dart';

class SelectPhoneCodeSheet extends StatefulWidget {
  final List<CountryCode> countries;
  final CountryCode? selected;

  const SelectPhoneCodeSheet({
    super.key,
    required this.countries,
    this.selected,
  });

  static Future<CountryCode?> show(
    BuildContext context, {
    required List<CountryCode> countries,
    CountryCode? selected,
  }) {
    return showModalBottomSheet<CountryCode>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) =>
          SelectPhoneCodeSheet(countries: countries, selected: selected),
    );
  }

  @override
  State<SelectPhoneCodeSheet> createState() => _SelectPhoneCodeSheetState();
}

class _SelectPhoneCodeSheetState extends State<SelectPhoneCodeSheet> {
  String _query = '';

  List<CountryCode> get _filtered {
    if (_query.trim().isEmpty) return widget.countries;
    final q = _query.toLowerCase();
    return widget.countries
        .where(
          (c) => c.name.toLowerCase().contains(q) || c.dialCode.contains(q),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final list = _filtered;

    return DraggableScrollableSheet(
      initialChildSize: 0.70,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      snap: true,
      builder: (_, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppTheme.of(context).background.main,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          ),
          padding: EdgeInsets.fromLTRB(24.w, 12.h, 24.w, 0),
          child: Column(
            children: [
              const BottomsheetHeader(
                title: 'Select Phone Number', // TODO: localize
                isTextCentered: true,
                showNotch: true,
              ),
              Space.yf(24),

              // ── SearchField (own local FormBuilder so it registers) ──
              FormBuilder(
                child: SearchField(
                  name: 'country_search',
                  hint: 'Search here', // TODO: localize
                  onChanged: (val) => setState(() => _query = val ?? ''),
                ),
              ),
              Space.yf(20),

              // ── Country list ─────────────────────────────────────────
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).padding.bottom + 16.h,
                  ),
                  itemCount: list.length,
                  separatorBuilder: (_, __) => Space.yf(8),
                  itemBuilder: (_, index) {
                    final country = list[index];
                    final isSelected =
                        country.isoCode == widget.selected?.isoCode;
                    return _CountryTile(
                      country: country,
                      selected: isSelected,
                      onTap: () => Navigator.pop(context, country),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CountryTile extends StatelessWidget {
  final CountryCode country;
  final bool selected;
  final VoidCallback onTap;

  const _CountryTile({
    required this.country,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final accent = AppTheme.of(context).accent.main!;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: Space.all(12),
        decoration: BoxDecoration(
          color: AppTheme.of(context).background.shade200,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? accent : Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Row(
          children: [
            CountryFlag(country: country, size: 32),
            Space.xf(16),
            Text('( ${country.dialCode} )', style: AppText.b2),
            Space.xf(8),
            Expanded(
              child: Text(
                country.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.b2,
              ),
            ),
            if (selected)
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: accent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  size: 14.w,
                  color: AppTheme.of(context).background.shade100,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
