class CardModel {
  String? name;
  int? balance;
  String? year;
  String? month;
  String? bank;
  String? country;
  String? city;
  String? cardNumber;

  CardModel({this.name, this.balance, this.year, this.month, this.bank, this.country, this.city, this.cardNumber});

  CardModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    balance = json['balance'];
    year = json['year'];
    month = json['month'];
    bank = json['bank'];
    country = json['country'];
    city = json['city'];
    cardNumber = json['cardNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['balance'] = balance;
    data['year'] = year;
    data['month'] = month;
    data['bank'] = bank;
    data['country'] = country;
    data['city'] = city;
    data['cardNumber'] = cardNumber;
    return data;
  }

  //TODO: Dummy Data sonrasinda silincek
  static List<CardModel> dummyCard() {
    return [
      CardModel(
        name: 'Taha Turan',
        balance: 1000,
        bank: 'Yapi Kredi',
        year: '24',
        month: '07',
        city: 'Adyin',
        country: 'TR',
        cardNumber: '****  ****  ****  8819',
      ),
      CardModel(
        name: 'Selin ÖZ',
        balance: 5800,
        bank: 'AKBANK',
        year: '26',
        month: '11',
        city: 'Adyin',
        country: 'TR',
        cardNumber: '****  ****  ****  2458',
      ),
      CardModel(
        name: 'Taha Turan',
        balance: 1000,
        bank: 'Ziraat',
        year: '28',
        month: '10',
        city: 'Adyin',
        country: 'TR',
        cardNumber: '****  ****  ****  1505',
      ),
    ];
  }
}
