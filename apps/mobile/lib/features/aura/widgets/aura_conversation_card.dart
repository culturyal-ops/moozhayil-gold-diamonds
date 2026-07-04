import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/aura_session.dart';
import 'aura_option_button.dart';

class AuraConversationCard extends StatelessWidget {
  const AuraConversationCard({
    super.key,
    required this.message,
    this.onActionTap,
  });

  final AuraConversationMessage message;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.82,
        ),
        child: Column(
          crossAxisAlignment:
              isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isUser) ...[
              Text(
                'ADVISOR',
                style: AppTypography.uiMicro.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 1.6,
                ),
              ),
              const SizedBox(height: 4),
            ],
            DecoratedBox(
              decoration: BoxDecoration(
                color: isUser ? AppColors.ink : AppColors.pearl,
                border: Border(
                  left: isUser
                      ? BorderSide.none
                      : BorderSide(
                          color: AppColors.gold.withValues(alpha: 0.75),
                          width: 2,
                        ),
                  top: BorderSide(
                    color: isUser
                        ? AppColors.ink
                        : AppColors.border.withValues(alpha: 0.65),
                    width: 0.5,
                  ),
                  right: BorderSide(
                    color: isUser
                        ? AppColors.ink
                        : AppColors.border.withValues(alpha: 0.65),
                    width: 0.5,
                  ),
                  bottom: BorderSide(
                    color: isUser
                        ? AppColors.ink
                        : AppColors.border.withValues(alpha: 0.65),
                    width: 0.5,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                child: Text(
                  message.content,
                  style: AppTypography.uiBodyMD.copyWith(
                    color: isUser ? AppColors.cream : AppColors.textPrimary,
                    height: 1.55,
                  ),
                ),
              ),
            ),
            if (message.action != null) ...[
              const SizedBox(height: AppSpacing.sm),
              AuraOptionButton(
                label: message.action!.ctaLabel,
                onPressed: onActionTap ??
                    () => context.push(message.action!.route),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
