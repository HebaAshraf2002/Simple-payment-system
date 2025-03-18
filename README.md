# Simple Payment System

## Overview
This is a simple payment system built using **Flutter** while following **SOLID principles**. The app allows users to select a payment method (cash or credit card) and process a payment. It demonstrates **good software design** by adhering to the five SOLID principles, making it flexible and scalable.

## What the Code Does
- Implements a **PaymentMethod interface** that defines a common structure for all payment types.
- Creates **CashPayment** and **CreditCardPayment** classes that implement the interface.
- Uses a **PaymentProcessor** class to handle payment processing.
- Provides a **Flutter UI** where users can choose a payment method and initiate payment.
- Displays **snack bar notifications** based on the payment status.

## How the Code Works
1. **Selecting a Payment Method:**
   - The user chooses between **cash payment** or **credit card payment**.
   - The selected method is stored in the `PaymentProcessor`.

2. **Processing the Payment:**
   - When the "Process Payment" button is clicked, the `PaymentProcessor` calls the `pay()` method of the selected payment method.
   - A **SnackBar notification** appears, indicating whether the payment was successful or if no method was selected.

3. **Code Structure:**
   - `PaymentMethod.dart` → Defines the interface for all payment methods.
   - `CashPayment.dart` → Implements cash payment logic.
   - `CreditCardPayment.dart` → Implements credit card payment logic.
   - `PaymentProcessor.dart` → Handles payment processing based on the selected method.
   - `PaymentScreen.dart` → Provides the **Flutter UI** to interact with the system.
