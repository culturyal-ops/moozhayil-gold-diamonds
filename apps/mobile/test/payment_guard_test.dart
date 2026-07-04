// ignore_for_file: avoid_redundant_argument_values
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/models/goal.dart';
import 'package:moozhayil/core/models/order.dart';

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

/// Minimal Order for tests.
Order _dummyOrder(String id) => Order(
  id: id,
  orderNumber: 'ORD-001',
  status: 'pending_payment',
  statusDisplay: 'Pending Payment',
  totalPaise: 500000,
  totalDisplay: '₹5,000',
  paymentMethod: 'upi',
  goldBalanceUsedGrams: '0.0000',
  items: const [],
  orderedAt: '2026-06-27T00:00:00Z',
);

/// Minimal ContributionResult for tests.
ContributionResult _dummyContrib() => const ContributionResult(
  id: 'contrib-001',
  status: 'pending_payment',
  amountPaise: 100000,
  amountDisplay: '₹1,000',
);

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  group('C-01: Checkout payment-required guard', () {
    test(
      'CreateOrderResponse.paymentRequired true when payment fields are present',
      () {
        final response = CreateOrderResponse(
          order: _dummyOrder('order-001'),
          paymentRequired: true,
          paymentAmountPaise: 500000,
          paymentSessionId: 'txn-001',
          paymentUrl: null,
          razorpayOrderId: 'order_rzp_001',
          razorpayKeyId: 'rzp_test_key',
        );

        expect(response.paymentRequired, isTrue);
        expect(response.razorpayOrderId, 'order_rzp_001');
        expect(response.razorpayKeyId, 'rzp_test_key');
        expect(response.paymentSessionId, 'txn-001');
      },
    );

    test(
      'CreateOrderResponse.paymentRequired false for gold-balance-only order',
      () {
        final response = CreateOrderResponse(
          order: _dummyOrder('order-002'),
          paymentRequired: false,
          paymentAmountPaise: 0,
          paymentSessionId: null,
          paymentUrl: null,
          razorpayOrderId: null,
          razorpayKeyId: null,
        );

        expect(response.paymentRequired, isFalse);
        expect(response.razorpayOrderId, isNull);
      },
    );

    test(
      'CreateOrderResponse fromJson deserialises razorpay fields correctly',
      () {
        final json = <String, dynamic>{
          'order': {
            'id': 'order-003',
            'order_number': 'ORD-003',
            'status': 'pending_payment',
            'status_display': 'Pending',
            'total_paise': 200000,
            'total_display': '₹2,000',
            'payment_method': 'upi',
            'gold_balance_used_grams': '0.0000',
            'items': <dynamic>[],
            'ordered_at': '2026-06-27T00:00:00Z',
          },
          'payment_required': true,
          'payment_amount_paise': 200000,
          'payment_session_id': 'txn-003',
          'payment_url': null,
          'razorpay_order_id': 'order_rzp_003',
          'razorpay_key_id': 'rzp_test_key',
        };

        final response = CreateOrderResponse.fromJson(json);

        expect(response.paymentRequired, isTrue);
        expect(response.razorpayOrderId, 'order_rzp_003');
        expect(response.razorpayKeyId, 'rzp_test_key');
        expect(response.paymentAmountPaise, 200000);
      },
    );
  });

  group('C-02: Contribute payment-required guard', () {
    test(
      'ContributeResponse.paymentRequired true when razorpay fields present',
      () {
        final response = ContributeResponse(
          contribution: _dummyContrib(),
          paymentRequired: true,
          paymentSessionId: 'txn-contrib-001',
          razorpayOrderId: 'order_rzp_contrib_001',
          razorpayKeyId: 'rzp_test_key',
        );

        expect(response.paymentRequired, isTrue);
        expect(response.razorpayOrderId, 'order_rzp_contrib_001');
        expect(response.razorpayKeyId, 'rzp_test_key');
      },
    );

    test(
      'ContributeResponse fromJson deserialises razorpay fields correctly',
      () {
        final json = <String, dynamic>{
          'contribution': {
            'id': 'contrib-002',
            'status': 'pending_payment',
            'amount_paise': 100000,
            'amount_display': '₹1,000',
          },
          'payment_required': true,
          'payment_session_id': 'txn-contrib-002',
          'razorpay_order_id': 'order_rzp_contrib_002',
          'razorpay_key_id': 'rzp_test_key',
        };

        final response = ContributeResponse.fromJson(json);

        expect(response.paymentRequired, isTrue);
        expect(response.razorpayOrderId, 'order_rzp_contrib_002');
        expect(response.razorpayKeyId, 'rzp_test_key');
        expect(response.paymentSessionId, 'txn-contrib-002');
      },
    );

    test('ContributeResponse.paymentRequired false for direct-debit order', () {
      final response = ContributeResponse(
        contribution: _dummyContrib(),
        paymentRequired: false,
        paymentSessionId: null,
        razorpayOrderId: null,
        razorpayKeyId: null,
      );

      expect(response.paymentRequired, isFalse);
      expect(response.razorpayOrderId, isNull);
    });
  });

  group('Model: payment guard — null safety', () {
    test('razorpayOrderId and razorpayKeyId default to null when absent', () {
      final json = <String, dynamic>{
        'order': {
          'id': 'order-null',
          'order_number': 'ORD-NULL',
          'status': 'confirmed',
          'status_display': 'Confirmed',
          'total_paise': 0,
          'total_display': '₹0',
          'payment_method': 'gold_balance',
          'gold_balance_used_grams': '1.0000',
          'items': <dynamic>[],
          'ordered_at': '2026-06-27T00:00:00Z',
        },
        'payment_required': false,
        'payment_amount_paise': 0,
      };

      final response = CreateOrderResponse.fromJson(json);
      expect(response.razorpayOrderId, isNull);
      expect(response.razorpayKeyId, isNull);
      expect(response.paymentRequired, isFalse);
    });
  });
}
