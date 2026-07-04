import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/destructive_button.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/feedback/empty_state.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/feedback/premium_snackbar.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/radii.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/address.dart';
import '../../../core/routing/app_routes.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/addresses_provider.dart';

class AddressesScreen extends ConsumerStatefulWidget {
  const AddressesScreen({super.key});

  @override
  ConsumerState<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends ConsumerState<AddressesScreen> {
  var _label = '';
  var _fullName = '';
  var _phone = '';
  var _line1 = '';
  var _line2 = '';
  var _city = '';
  var _state = '';
  var _pincode = '';
  String? _pincodeError;
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authControllerProvider);
    final addresses = ref.watch(userAddressesProvider);

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Saved Addresses'),
      body: auth.when(
        data: (state) {
          if (state.step != AuthFlowStep.signedIn) {
            return EmptyState(
              icon: Icons.location_on_outlined,
              headline: 'Save delivery addresses',
              body: 'Sign in to manage addresses for checkout.',
              ctaLabel: 'Sign in',
              onCtaTap: () => context.push(
                Uri(
                  path: AppRoutes.auth,
                  queryParameters: {'from': AppRoutes.profileAddresses},
                ).toString(),
              ),
            );
          }

          return addresses.when(
            data: (items) => ListView(
              padding: const EdgeInsets.all(AppSpacing.screenPadding),
              children: [
                Text('Your addresses', style: AppTypography.headingMD),
                const SizedBox(height: AppSpacing.sm),
                if (items.isEmpty)
                  const EmptyState(
                    headline: 'No saved addresses.',
                    body: 'Add a delivery address using the form below.',
                  )
                else
                  ...items.map(
                    (address) => Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _AddressCard(
                        address: address,
                        onDelete: () => ref
                            .read(addressActionsProvider.notifier)
                            .deleteAddress(address.id),
                      ),
                    ),
                  ),
                const SizedBox(height: AppSpacing.lg),
                Text('Add address', style: AppTypography.headingMD),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Label (optional)',
                  placeholder: 'Home',
                  value: _label,
                  onChanged: (value) => setState(() => _label = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Full name',
                  placeholder: 'Nikita Liby',
                  value: _fullName,
                  onChanged: (value) => setState(() => _fullName = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Phone',
                  placeholder: '+919876543210',
                  value: _phone,
                  keyboardType: TextInputType.phone,
                  onChanged: (value) => setState(() => _phone = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Address line 1',
                  placeholder: '123 MG Road',
                  value: _line1,
                  onChanged: (value) => setState(() => _line1 = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Address line 2 (optional)',
                  placeholder: 'Apartment 4B',
                  value: _line2,
                  onChanged: (value) => setState(() => _line2 = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'Pincode',
                  placeholder: '680001',
                  value: _pincode,
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  errorText: _pincodeError,
                  onChanged: (value) => setState(() {
                    _pincode = value;
                    _pincodeError = null;
                  }),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'City',
                  placeholder: 'Thrissur',
                  value: _city,
                  onChanged: (value) => setState(() => _city = value),
                ),
                const SizedBox(height: AppSpacing.sm),
                AppTextInput(
                  label: 'State',
                  placeholder: 'Kerala',
                  value: _state,
                  onChanged: (value) => setState(() => _state = value),
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: 'Save address',
                  isFullWidth: true,
                  isLoading: _isSubmitting,
                  onTap: _submitAddress,
                ),
              ],
            ),
            loading: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.screenPadding),
              child: LoadingShimmer(
                width: double.infinity,
                height: AppSpacing.x3l,
              ),
            ),
            error: (error, _) => ErrorState(
              body: CustomerErrorCopy.message(error),
              onRetry: () => ref.invalidate(userAddressesProvider),
            ),
          );
        },
        loading: () => const Center(
          child: LoadingShimmer(
            width: double.infinity,
            height: AppSpacing.x3l,
          ),
        ),
        error: (error, _) => ErrorState(body: CustomerErrorCopy.message(error)),
      ),
    );
  }

  Future<void> _submitAddress() async {
    final pincode = _pincode.trim();
    if (pincode.length != 6) {
      setState(() => _pincodeError = 'Enter a valid 6-digit pincode');
      return;
    }

    setState(() => _isSubmitting = true);
    try {
      final validation = await ref
          .read(addressActionsProvider.notifier)
          .validatePincode(pincode);
      if (!validation.serviceable) {
        setState(() {
          _pincodeError = 'This pincode is not serviceable yet';
          _isSubmitting = false;
        });
        return;
      }

      await ref.read(addressActionsProvider.notifier).createAddress(
            label: _label.trim().isEmpty ? null : _label.trim(),
            fullName: _fullName.trim(),
            phone: _phone.trim(),
            line1: _line1.trim(),
            line2: _line2.trim().isEmpty ? null : _line2.trim(),
            city: _city.trim().isEmpty ? validation.city ?? '' : _city.trim(),
            state:
                _state.trim().isEmpty ? validation.state ?? '' : _state.trim(),
            pincode: pincode,
          );

      setState(() {
        _label = '';
        _fullName = '';
        _phone = '';
        _line1 = '';
        _line2 = '';
        _city = '';
        _state = '';
        _pincode = '';
      });
    } catch (error) {
      if (mounted) {
        showPremiumSnackBar(
          context,
          CustomerErrorCopy.message(error),
          haptic: false,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }
}

class _AddressCard extends StatelessWidget {
  const _AddressCard({required this.address, required this.onDelete});

  final UserAddress address;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.smokeLine),
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  address.label ?? address.fullName,
                  style: AppTypography.uiBodyMD.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (address.isDefault)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xs,
                    vertical: AppSpacing.xxs,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.champagneVeil,
                    borderRadius: BorderRadius.circular(AppRadius.chip),
                  ),
                  child: Text('Default', style: AppTypography.uiMicro),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${address.line1}${address.line2 == null ? '' : ', ${address.line2}'}\n'
            '${address.city}, ${address.state} ${address.pincode}',
            style: AppTypography.uiBodySM.copyWith(color: AppColors.slateMist),
          ),
          const SizedBox(height: AppSpacing.sm),
          DestructiveButton(label: 'Delete', onTap: onDelete),
        ],
      ),
    );
  }
}
