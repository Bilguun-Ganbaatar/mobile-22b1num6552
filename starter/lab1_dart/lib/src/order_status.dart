enum OrderStatus {
  pending('Хүлээгдэж буй'),
  paid('Төлөгдсөн'),
  shipped('Хүргэлтэд гарсан'),
  delivered('Хүргэгдсэн'),
  cancelled('Цуцлагдсан');

  const OrderStatus(this.label);

  final String label;

  OrderStatus? get next => switch (this) {
        OrderStatus.pending => OrderStatus.paid,
        OrderStatus.paid => OrderStatus.shipped,
        OrderStatus.shipped => OrderStatus.delivered,
        OrderStatus.delivered => null,
        OrderStatus.cancelled => null,
      };

  bool get canCancel => this == OrderStatus.pending || this == OrderStatus.paid;
}
