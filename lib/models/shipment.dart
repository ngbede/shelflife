// shipment model
// We only GET shipments for a pharmacy to display on the UI
// No need for any method concerning POST

class Shipment {
  final String id;
  final String rev;
  final String type;
  final String version;
  final String createdAt;
  final String createdBy;
  final Map<String, Map> counts; // contains products in shipment
  final String shipmentTypeId;
  final String planningType;
  final String? parentDocId;
  final String? updatedAt;
  final String? updatedBy;
  final String? funderId;
  final String? orderId;
  // special props I know little about
  final bool? isAutomaticReturnShipment;
  final List<Map>? shouldReturnProducts;

  Shipment({
    required this.id,
    required this.rev,
    required this.type,
    required this.version,
    required this.createdAt,
    required this.createdBy,
    required this.counts,
    required this.shipmentTypeId,
    required this.planningType,
    this.parentDocId,
    this.updatedAt,
    this.updatedBy,
    this.funderId,
    this.orderId,
    this.isAutomaticReturnShipment,
    this.shouldReturnProducts,
  });

  // convert a JSON response from Api to a Shipment object
  factory Shipment.fromJson(Map json) {
    return Shipment(
      id: json["_id"],
      rev: json["_rev"],
      type: json["type"],
      version: json["version"],
      createdAt: json["createdAt"],
      createdBy: json["createdBy"],
      counts: json["counts"],
      shipmentTypeId: json["shipmentTypeId"],
      planningType: json["planningType"],
      parentDocId: json["parentDocId"],
      updatedAt: json["updatedAt"],
      updatedBy: json["updatedBy"],
      funderId: json["funderId"],
      orderId: json["orderId"],
      isAutomaticReturnShipment: json["isAutomaticReturnShipment"],
      shouldReturnProducts: json["shouldReturnProducts"],
    );
  }
}
