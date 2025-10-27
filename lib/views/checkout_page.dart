import 'package:flowerss/views/payment_page.dart';
import 'package:flowerss/views/widgets/button.dart';
import 'package:flowerss/views/widgets/custome_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});
  static String id = "checkout_page";

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int selectedPayment = 1; // 1 = Vodafone , 2 = Visa , 3 = Paypal

  @override
  Widget build(BuildContext context) {
    double subtotal = 450;
    double delivery = 0;
    double total = subtotal + delivery;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            // زر الرجوع + العنوان
            Row(
              children: [
                CustomBackButton(),
                const Text(
                  "Checkout",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffCF636C)),
                )
              ],
            ),

            const SizedBox(height: 25),

            // Container فورم
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xffFFD3DC),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _label("DELIVERY ADDRESS"),
                  _inputField("Home Address"),
                  const SizedBox(height: 10),
                  _label("DELIVERY TIME"),
                  _inputField("At 6:00PM"),
                  const SizedBox(height: 15),
                  _label("PAYMENT METHOD"),
                  _paymentOption(
                    icon: Image.asset("", height: 24),
                    text: "********254",
                    isSelected: selectedPayment == 2,
                    onTap: () => setState(() => selectedPayment = 2),
                  ),
                  _paymentOption(
                    icon: Image.asset("assets/icons/paypal.png", height: 24),
                    text: "*******888",
                    isSelected: selectedPayment == 1,
                    onTap: () => setState(() => selectedPayment = 1),
                  ),
                  _paymentOption(
                    icon: Image.asset("assets/icons/paypal.png", height: 24),
                    text: "*******888",
                    isSelected: selectedPayment == 3,
                    onTap: () => setState(() => selectedPayment = 3),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // الجزء الأخير (Subtotal / Delivery / Total)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink[100],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  _row("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
                  _row(
                      "Delivery",
                      delivery == 0
                          ? "Free"
                          : "\$${delivery.toStringAsFixed(2)}"),
                  const Divider(height: 30, thickness: 1, color: Colors.white),
                  _row("Total", "\$${total.toStringAsFixed(2)}"),
                  const SizedBox(height: 20),
                  Button(
                    title: "Payment",
                    onTap: () {
                      Navigator.pushNamed(context, PaymentPage.id);
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(text,
            style: const TextStyle(
                color: Color(0xffCF636C), fontWeight: FontWeight.bold)),
      );

  Widget _inputField(String hint) => TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Color(0xffCF636C)),
          filled: true,
          fillColor: Color(0xffFFD3DC),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffCF636C)),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffCF636C), width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  Widget _paymentOption({
    required Widget icon,
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffCF636C) : Color(0xffFFD3DC),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.pink),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 10),
            Expanded(
                child: Text(text,
                    style: const TextStyle(color: Color(0xffCF636C)))),
            if (isSelected)
              const Icon(Icons.check_box, color: Color(0xffCF636C))
            else
              const Icon(Icons.check_box_outline_blank,
                  color: Color(0xffCF636C)),
          ],
        ),
      ),
    );
  }

  Widget _row(String text, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: const TextStyle(
                  color: Color(0xffCF636C), fontWeight: FontWeight.bold)),
          Text(value,
              style: const TextStyle(
                  color: Color(0xffCF636C), fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
