/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

enum AppRole { admin, user }

enum ChatType { ride, support }

enum MessageType { text, audio, image }

enum ChatMessageStatus { sending, sent, delivered, read, failed }

enum ImageType { asset, network, memory, file }

enum Role { admin, manager, operator, fleetOwner, fleetManager, fleetOperator, driver, user, unknown }

enum VerificationStatus { pending, submitted, underReview, approved, rejected }

enum PaymentMethods { paypal, googlePay, applePay, visa, masterCard, creditCard, paystack, razorPay, paytm }
