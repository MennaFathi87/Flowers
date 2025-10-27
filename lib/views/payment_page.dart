import 'package:flowerss/views/home_view.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flowerss/model/cart.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});
  static String id = "payment_page";

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    // جمع المجموع من CartManager
    final total = CartManager.getTotalPrice();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 10),

              // زر الرجوع + العنوان
              Row(
                children: [
                  CustomBackButton(),
                  const SizedBox(width: 10),
                  const Text(
                    "Checkout",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffCF636C)),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // صورة تأكيد الدفع
              Image.asset("assets/photo/Frame 73.png", height: 210),

              const SizedBox(height: 15),

              const Text(
                "Payment Successful",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffCF636C),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Thank you! Your payment has been successfully confirmed.\nYou’ll receive your order details shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, height: 1.4, color: Color(0xffEEA3B1)),
              ),

              const SizedBox(height: 25),

              // صندوق الفاتورة
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xffFCBDC9),
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      children: [
                        _row("Subtotal", "\$${total.toStringAsFixed(2)}"),
                        const SizedBox(height: 8),
                        _row("Delivery", "Free"),
                        const Divider(color: Color(0xffCF636C), height: 28),
                        _row("Total", "\$${total.toStringAsFixed(2)}",
                            bold: true),

                        const SizedBox(height: 20),

                        // زر الرجوع للصفحة الرئيسية
                        SizedBox(
                          width: 180,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffCF636C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, HomePage.id);
                            },
                            child: const Text(
                              "Done",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // دالة Row
  Widget _row(String label, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 16,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: const Color(0xffCF636C))),
        Text(value,
            style: TextStyle(
                fontSize: 16,
                fontWeight: bold ? FontWeight.bold : FontWeight.w500,
                color: const Color(0xffCF636C))),
      ],
    );
  }
}
