// The topup model
// It creates an order so we basically send a POST request to the order DB
// Once the order is created GP can decide to accept or decline the topup request
// An acceepted order creates a new shipment in van-shipments

import 'package:shelflife/models/product.dart';

class Topup {
  final String? id;
  final String? rev;
  final String type;
  final String version;
  final String status;
  final String? orderId;
  final String? groupId;
  final String? suborderId;
  final String? createdAt;
  final String? createdBy;
  final String? updatedAt;
  final String? updatedBy;
  final String? closedStatus;
  final String? closedBy;
  final String? closedAt;
  final String? transformedAt;
  final String? supplierId;
  final String? destinationId; // pharmacies ID
  final bool isComplete;
  final Map<String, Map>? products; // contains products in shipment
  final List reports;
  final String? funderId;
  final String? deliveryDate;
  final String programId = "program:shelflife";
  final String orderType = "topup";
  final bool request = true;
  // testing state stuff
  final List<Product>? cart; // =
  // we use this to manage some extra stuff seperately
  final List<Product>? subscriptions; // = sampleProducts.sublist(0, 7);

  Topup({
    this.type = "orderSnapshot",
    this.version = "1.0.0",
    this.status = "new",
    this.isComplete = false,
    this.reports = const [],
    this.cart,
    this.products,
    this.subscriptions,
    this.createdAt,
    this.createdBy,
    // required this.products,
    this.destinationId,
    this.deliveryDate, // normally the date its created 2022-03-17
    this.funderId,
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

  Map<String, dynamic> toJson() => {
        "version": version,
        "destinationId": destinationId,
        "programId": programId,
        "status": status,
        "type": type,
        "createdAt": createdAt,
        "createdBy": createdBy,
        "isComplete": isComplete,
        "products": products,
        "reports": reports,
        "supplierId": supplierId,
        "funderId": funderId,
        "deliveryDate": deliveryDate,
        "orderType": orderType,
        "request": request,
      }; // This seems to be all we will be sending to the server when posting a topup request
}
