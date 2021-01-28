resource "aws_sqs_queue" "notification-queue" {
  name                        = "notification-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}
