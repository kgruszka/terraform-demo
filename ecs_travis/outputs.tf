output "cluster_id" {
  description = "ECS cluster ID."
  value       = "${module.ecs.cluster_id}"
}

output "cluster_name" {
  description = "ECS cluster name."
  value       = "${module.ecs.cluster_name}"
}
