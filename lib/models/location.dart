// A Location object on Shelf life could be a Pharmacy or PPMV

class Location {
  final String id;
  final String fullName;
  final String type;
  final String level;
  final String location;
  final Map additionalData; // contains location level
  final Map<String, Map<String, String>> contacts;

  Location({
    required this.id,
    required this.fullName,
    required this.type,
    required this.level,
    required this.location,
    required this.additionalData,
    required this.contacts,
  });

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "type": type,
        "level": level,
        "location": location,
        "additionalData": additionalData,
        "contacts": contacts,
      };
}
