class CustomerModel {
  List<Customers> customers;

  CustomerModel({this.customers});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['customers'] != null) {
      customers = [];
      json['customers'].forEach((v) {
        customers.add(new Customers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customers != null) {
      data['customers'] = this.customers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Customers {
  String customerName;
  int totalorder;
  int totalpayment;
  int pendingpayment;

  Customers(
      {this.customerName,
        this.totalorder,
        this.totalpayment,
        this.pendingpayment});

  Customers.fromJson(Map<String, dynamic> json) {
    customerName = json['customer_name'];
    totalorder = json['totalorder'];
    totalpayment = json['totalpayment'];
    pendingpayment = json['pendingpayment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customerName;
    data['totalorder'] = this.totalorder;
    data['totalpayment'] = this.totalpayment;
    data['pendingpayment'] = this.pendingpayment;
    return data;
  }
}