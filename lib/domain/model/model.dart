class SliderState {
  String title;
  String subTitle;
  String image;

  SliderState(this.title, this.subTitle, this.image);
}

class Customer {
  String id;
  String name;
  int numberOfNotifications;

  Customer(this.id, this.name, this.numberOfNotifications);
}

class Contacts {
  String phone;
  String link;
  String email;

  Contacts(this.phone, this.link, this.email);
}

class Login {
  Customer? customer;
  Contacts? contacts;

  Login(this.customer, this.contacts);
}

class DeviceInfo {
  String name;
  String identifier;
  String version;

  DeviceInfo(this.name, this.identifier, this.version);
}