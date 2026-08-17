import 'package:get/get.dart';

class PlanFeature {
  final String text;
  PlanFeature(this.text);
}

class MembershipPlan {
  final String title;
  final String? price;
  final String? period;
  final String? iconEmoji;
  final List<PlanFeature> features;
  final bool isHighlighted; 
  final bool hasBuyButton;

  MembershipPlan({
    required this.title,
    this.price,
    this.period,
    this.iconEmoji,
    required this.features,
    this.isHighlighted = false,
    this.hasBuyButton = false,
  });
}

class MembershipController extends GetxController {
  final List<MembershipPlan> plans = [
    MembershipPlan(
      title: 'Free',
      features: [
        PlanFeature('Basic Experience'),
        PlanFeature('No Booking Limits'),
      ],
    ),
    MembershipPlan(
      title: 'Plus',
      price: '\$9.99',
      period: '/month',
      iconEmoji: '⭐',
      isHighlighted: true,
      hasBuyButton: true,
      features: [
        PlanFeature('Priority Matching, boosted Profile Placement'),
        PlanFeature("Messages appear at the Top of the\nRecipient's Inbox"),
        PlanFeature('Feed Posts / Requests appear at the Top'),
        PlanFeature('50 Seirus/month, monthly free Frame or Badge'),
      ],
    ),
    MembershipPlan(
      title: 'Premium',
      price: '\$19.99',
      period: '/month',
      iconEmoji: '💎',
      hasBuyButton: true,
      features: [
        PlanFeature('Top Priority Matching + boosted\nProfile Placement'),
        PlanFeature("Messages appear at the Top of the Recipient's\nInbox with Effects"),
        PlanFeature('Feed Posts / Requests appear at the Top\nwith Effects'),
        PlanFeature('150 Seirus/month, monthly free Frame + exclusive\nDesigns, "Premium" Badge'),
        PlanFeature('Priority Support'),
      ],
    ),
  ];

  void onBuyPlan(MembershipPlan plan) {

  }
}