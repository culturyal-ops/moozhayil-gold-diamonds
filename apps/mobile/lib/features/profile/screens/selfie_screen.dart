import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/kyc_provider.dart';

class SelfieScreen extends ConsumerStatefulWidget {
  const SelfieScreen({super.key});

  @override
  ConsumerState<SelfieScreen> createState() => _SelfieScreenState();
}

class _SelfieScreenState extends ConsumerState<SelfieScreen> {
  String? _filePath;
  String? _error;
  var _loading = false;

  Future<void> _capture() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
      maxWidth: 1280,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _filePath = image.path;
        _error = null;
      });
    }
  }

  Future<void> _upload() async {
    final path = _filePath;
    if (path == null) {
      setState(() => _error = 'Capture a selfie to continue');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref.read(kycFlowActionsProvider.notifier).uploadSelfie(path);
      if (mounted) {
        context.push(AppRoutes.profileKycReview);
      }
    } catch (error) {
      setState(() => _error = CustomerErrorCopy.message(error));
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppTopBar.detail(title: 'Selfie Verification'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Take a clear selfie', style: AppTypography.headingMD),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Face the camera in good lighting. Your photo stays encrypted and private.',
              style: AppTypography.uiBodySM.copyWith(
                color: AppColors.slateMist,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              height: AppSpacing.x3l * 3,
              decoration: BoxDecoration(
                color: AppColors.champagneVeil,
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              alignment: Alignment.center,
              child: Text(
                _filePath == null ? 'No photo captured' : 'Selfie ready',
                style: AppTypography.uiBodyMD,
              ),
            ),
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                _error!,
                style: AppTypography.uiCaption.copyWith(
                  color: AppColors.blushClay,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: _filePath == null ? 'Open camera' : 'Retake photo',
              isFullWidth: true,
              onTap: _capture,
            ),
            const SizedBox(height: AppSpacing.sm),
            PrimaryButton(
              label: 'Upload and continue',
              isFullWidth: true,
              isLoading: _loading,
              isDisabled: _filePath == null,
              onTap: _upload,
            ),
          ],
        ),
      ),
    );
  }
}
