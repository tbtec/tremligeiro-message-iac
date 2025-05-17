resource "aws_sns_topic" "oder_topic" {
  name = "OrderTopic"
}

resource "aws_sns_topic" "production_topic" {
  name = "ProductionTopic"
}