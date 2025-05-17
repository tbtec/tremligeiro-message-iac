resource "aws_sns_topic_subscription" "subscription_notification_order" {
  topic_arn = aws_sns_topic.oder_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.notification_order_queue.arn

  depends_on = [
    aws_sns_topic.oder_topic,
    aws_sqs_queue.notification_order_queue,
  ]
}

resource "aws_sns_topic_subscription" "subscription_production_order" {
  topic_arn = aws_sns_topic.oder_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.production_order_queue.arn

  depends_on = [
    aws_sns_topic.oder_topic,
    aws_sqs_queue.production_order_queue,
  ]
}

resource "aws_sns_topic_subscription" "subscription_order_production" {
  topic_arn = aws_sns_topic.production_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.order_production_queue.arn

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.order_production_queue,
  ]
}

resource "aws_sns_topic_subscription" "subscription_notification_production" {
  topic_arn = aws_sns_topic.production_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.notification_production_queue.arn

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.notification_production_queue,
  ]
}