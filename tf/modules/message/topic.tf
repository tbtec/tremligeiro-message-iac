resource "aws_sns_topic" "order_topic" {
  name = "OrderTopic"
}

resource "aws_sns_topic" "production_topic" {
  name = "ProductionTopic"
}