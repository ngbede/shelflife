// The topup model
// It creates an order so we basically send a POST request to the order DB
// Once the order is created GP can decide to accept or decline the topup request
// An acceepted order creates a new shipment in van-shipments

class Topup {
  final String? id;
  final String? rev;
  final String type;
  final String version;
  final String status;
  final String? orderId;
  final String? groupId;
  final String? suborderId;
  final String createdAt;
  final String createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? closedStatus;
  final String? closedBy;
  final String? closedAt;
  final String? transformedAt;
  final String? supplierId;
  final String destinationId;
  final bool isComplete;
  final Map<String, Map> products; // contains products in shipment
  final List reports;
  final String funderId;
  final String deliveryDate;
  final String programId = "program:shelflife";
  final String orderType = "topup";
  final bool request = true;

  Topup({
    this.type = "orderSnapshot",
    this.version = "1.0.0",
    this.status = "new",
    this.isComplete = false,
    this.reports = const [],
    required this.createdAt,
    required this.createdBy,
    required this.products,
    required this.destinationId,
    required this.deliveryDate, // normally the date its created 2022-03-17
    required this.funderId,
    this.supplierId,
    this.updatedAt,
    this.updatedBy,
    this.closedStatus,
    this.closedBy,
    this.closedAt,
    // properties that are generated on the server so should be null when posting
    this.id,
    this.rev,
    this.orderId,
    this.groupId,
    this.suborderId,
    this.transformedAt,
  });
}
