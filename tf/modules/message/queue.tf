resource "aws_sqs_queue" "production_order_queue" {
  name                       = "ProductionOrderQueue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.oder_topic
  ]
}

resource "aws_sqs_queue" "notification_order_queue" {
  name                       = "NotificationOrderQueue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.oder_topic
  ]
}

resource "aws_sqs_queue" "order_production_queue" {
  name                       = "OrderProductionQueue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.production_topic
  ]
}

resource "aws_sqs_queue" "notification_production_queue" {
  name                       = "NotificationProductionQueue"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.production_topic
  ]
}

# resource "aws_sqs_queue_policy" "queue_policy" {
#   queue_url = aws_sqs_queue.queue.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [{
#       Effect    = "Allow",
#       Principal = "*",
#       Action    = "sqs:SendMessage",
#       Resource  = aws_sqs_queue.queue.arn,
#       Condition = {
#         ArnEquals = {
#           "aws:SourceArn" = aws_sns_topic.topic.arn
#         }
#       }
#     }]
#   })

#   depends_on = [
#     aws_sns_topic.topic,
#     aws_sqs_queue.queue
#   ]
# }