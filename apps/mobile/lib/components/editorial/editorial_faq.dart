import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';

/// Nymira §5.5 — popular questions accordion.
class EditorialFaqSection extends StatefulWidget {
  const EditorialFaqSection({super.key});

  @override
  State<EditorialFaqSection> createState() => _EditorialFaqSectionState();
}

class _EditorialFaqSectionState extends State<EditorialFaqSection> {
  int? _openIndex;

  static const _items = <({String q, String a})>[
    (
      q: 'How do I determine my ring size?',
      a:
          'Visit any Moozhayil showroom for a complimentary sizing, or use our '
          'online guide under Profile → Ring sizes.',
    ),
    (
      q: 'Can I return or exchange a jewellery item?',
      a:
          'Unworn BIS-hallmarked pieces may be exchanged within 7 days with '
          'original invoice. Custom or engraved items are final sale.',
    ),
    (
      q: 'How do I take care of my jewellery?',
      a:
          'Store pieces separately, avoid chemicals and perfumes, and wipe with '
          'a soft cloth after wear. Annual cleaning is complimentary in-store.',
    ),
    (
      q: 'Do you provide cleaning and maintenance?',
      a:
          'Yes — lifetime basic cleaning at our showrooms. Deep polishing and '
          'stone tightening are available by appointment.',
    ),
    (
      q: 'What materials are your pieces made of?',
      a:
          'All gold jewellery is 916 BIS hallmarked. Diamond and gemstone '
          'quality is certified and disclosed on every product page.',
    ),
    (
      q: 'Do you offer custom design services?',
      a:
          'Our atelier accepts bespoke commissions for weddings and milestones. '
          'Speak with our AI Advisor or visit a showroom to begin.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < _items.length; i++)
          Column(
            children: [
              InkWell(
                onTap: () =>
                    setState(() => _openIndex = _openIndex == i ? null : i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(_items[i].q, style: AppTypography.uiBodySM),
                      ),
                      AnimatedRotation(
                        turns: _openIndex == i ? 0.25 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: const Icon(
                          Icons.chevron_right,
                          size: 20,
                          color: AppColors.slateMist,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_openIndex == i)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: Text(
                      _items[i].a,
                      style: AppTypography.uiCaption.copyWith(
                        color: AppColors.slateMist,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              const Divider(height: 1, color: AppColors.smokeLine),
            ],
          ),
      ],
    );
  }
}
