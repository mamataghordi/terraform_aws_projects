output "formatted_project_name" {
  value = local.formatted_project_name
}
output "formatted_bucket_name" {
  value=local.formatted_bucket_name
}
output "port_list" {
  value = local.sg_rules
}
output "instance_size" {
  value = local.instance_size
}
output "credentials"{
  value=var.credentials
  sensitive=true
}
output "desired_locations"{
  value=local.desired_locations
}
output "positive_costs"{
  value=local.positive_costs
}
output "avg_cost"{
  value=local.avg_cost
}
output "max_cost"{
  value=local.max_cost
}
output "current_timestamp" {
  value = local.current_timestamp
}