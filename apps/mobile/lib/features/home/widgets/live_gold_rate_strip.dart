import 'package:flutter/material.dart';

import '../../../components/feedback/loading_shimmer.dart';
import '../../../core/animations/gold_pulse.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/motion.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';

/// Official live gold rate strip — slim premium information band.
class LiveGoldRateStrip extends StatefulWidget {
  const LiveGoldRateStrip({
    super.key,
    this.rateDisplay,
    this.purityLabel = '22KT',
    this.isLoading = false,
  });

  final String? rateDisplay;
  final String purityLabel;
  final bool isLoading;

  @override
  State<LiveGoldRateStrip> createState() => _LiveGoldRateStripState();
}

class _LiveGoldRateStripState extends State<LiveGoldRateStrip>
    with SingleTickerProviderStateMixin {
  String? _cachedRate;
  late final AnimationController _pulseController;
  late final Animation<double> _pulse;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _pulse = Tween<double>(begin: 1, end: 1.12).animate(
      CurvedAnimation(parent: _pulseController, curve: AppMotion.standard),
    );
  }

  @override
  void didUpdateWidget(LiveGoldRateStrip oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newRate = _resolvedRate;
    if (newRate != null) {
      _cachedRate = newRate;
    }
    if ((!widget.isLoading && oldWidget.isLoading && newRate != null) ||
        (!widget.isLoading &&
            _cachedRate != null &&
            newRate != null &&
            _cachedRate != newRate)) {
      _pulseController.forward(from: 0).then((_) {
        if (mounted) _pulseController.reverse();
      });
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  String? get _resolvedRate {
    if (widget.isLoading && _cachedRate != null) {
      return _cachedRate;
    }
    if (widget.isLoading) return null;
    final rate = widget.rateDisplay;
    if (rate == null || rate.isEmpty || rate == '—') {
      return null;
    }
    return rate;
  }

  bool get _showRateShimmer => widget.isLoading && _cachedRate == null;

  String get _displayLine {
    final rate = _resolvedRate ?? _cachedRate;
    if (rate != null) {
      return 'Live Gold Rate · $rate · ${widget.purityLabel}';
    }
    if (widget.isLoading) {
      return 'Fetching today\u2019s gold rate\u2026';
    }
    return 'Gold rate unavailable · ${widget.purityLabel}';
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.pearl,
        border: Border(
          bottom: BorderSide(
            color: AppColors.border.withValues(alpha: 0.55),
            width: 0.35,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.homeScreenPadding,
          vertical: 10,
        ),
        child: Row(
          children: [
            Container(
              width: 2,
              height: 16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.brandBurgundy,
                    AppColors.gold.withValues(alpha: 0.85),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            if (_showRateShimmer)
              Expanded(
                child: LoadingShimmer(
                  width: double.infinity,
                  height: 14,
                  borderRadius: 2,
                ),
              )
            else
              Expanded(
                child: AnimatedSwitcher(
                  duration: AppMotion.normal,
                  switchInCurve: AppMotion.entrance,
                  switchOutCurve: AppMotion.exit,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.06),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Text(
                    key: ValueKey(_displayLine),
                    _displayLine,
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      letterSpacing: 0.2,
                      height: 1.2,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            const SizedBox(width: AppSpacing.sm),
            if (widget.isLoading)
              const GoldPulse(size: 7)
            else
              ScaleTransition(
                scale: _pulse,
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withValues(alpha: 0.35),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
