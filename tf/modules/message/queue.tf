resource "aws_sqs_queue" "order_queue_app_production" {
  name                       = "OrderQueueAppProduction"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.order_topic
  ]
}

resource "aws_sqs_queue" "order_queue_app_notification" {
  name                       = "OrderQueueAppNotification"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.order_topic
  ]
}

resource "aws_sqs_queue" "production_queue_app_order" {
  name                       = "ProductionQueueAppOrder"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.production_topic
  ]
}

resource "aws_sqs_queue" "production_queue_app_notification" {
  name                       = "ProductionQueueAppNotification"
  visibility_timeout_seconds = 30
  message_retention_seconds  = 86400
  delay_seconds              = 1
  receive_wait_time_seconds  = 0

  depends_on = [
    aws_sns_topic.production_topic
  ]
}

resource "aws_sqs_queue_policy" "order_queue_app_production_policy" {
  queue_url = aws_sqs_queue.order_queue_app_production.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "sqs:SendMessage",
      Resource  = aws_sqs_queue.order_queue_app_production.arn,
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = aws_sns_topic.order_topic.arn
        }
      }
    }]
  })

  depends_on = [
    aws_sns_topic.order_topic,
    aws_sqs_queue.order_queue_app_production
  ]
}

resource "aws_sqs_queue_policy" "order_queue_app_notification_policy" {
  queue_url = aws_sqs_queue.order_queue_app_notification.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "sqs:SendMessage",
      Resource  = aws_sqs_queue.order_queue_app_notification.arn,
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = aws_sns_topic.order_topic.arn
        }
      }
    }]
  })

  depends_on = [
    aws_sns_topic.order_topic,
    aws_sqs_queue.order_queue_app_notification
  ]
}

resource "aws_sqs_queue_policy" "production_queue_app_order_policy" {
  queue_url = aws_sqs_queue.production_queue_app_order.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "sqs:SendMessage",
      Resource  = aws_sqs_queue.production_queue_app_order.arn,
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = aws_sns_topic.production_topic.arn
        }
      }
    }]
  })

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.production_queue_app_order
  ]
}

resource "aws_sqs_queue_policy" "production_queue_app_notification_policy" {
  queue_url = aws_sqs_queue.production_queue_app_notification.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = "*",
      Action    = "sqs:SendMessage",
      Resource  = aws_sqs_queue.production_queue_app_notification.arn,
      Condition = {
        ArnEquals = {
          "aws:SourceArn" = aws_sns_topic.production_topic.arn
        }
      }
    }]
  })

  depends_on = [
    aws_sns_topic.production_topic,
    aws_sqs_queue.production_queue_app_notification
  ]
}