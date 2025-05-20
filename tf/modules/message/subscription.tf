resource "aws_sns_topic_subscription" "subscription_order_queue_app_production" {
  topic_arn = aws_sns_topic.order_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.order_queue_app_production.arn

  depends_on = [
    aws_sns_topic.order_topic,
    aws_sqs_queue.order_queue_app_production,
  ]
}

resource "aws_sns_topic_subscription" "subscription_order_queue_app_notification" {
  topic_arn = aws_sns_topic.order_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.order_queue_app_notification.arn

  depends_on = [
    aws_sns_topic.order_topic,
    aws_sqs_queue.order_queue_app_notification,
  ]
}

resource "aws_sns_topic_subscription" "subscription_production_queue_app_order" {
  topic_arn = aws_sns_topic.production_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.production_queue_app_order.arn

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.production_queue_app_order,
  ]
}

resource "aws_sns_topic_subscription" "subscription_production_queue_app_notification" {
  topic_arn = aws_sns_topic.production_topic.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.production_queue_app_notification.arn

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.production_queue_app_notification,
  ]
}