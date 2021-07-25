class NoteModel {
  int id;
  String pharmacyName;
  String notes;

  NoteModel({
    this.pharmacyName,
    this.notes,
  });

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pharmacyName = json['name_pharmacy'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_pharmacy'] = this.pharmacyName;
    data['notes'] = this.notes;
    return data;
  }

  Map<String, dynamic> sendToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_pharmacy'] = this.pharmacyName;
    data['notes'] = this.notes;
    return data;
  }
}
