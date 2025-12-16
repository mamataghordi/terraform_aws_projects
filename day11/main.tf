locals {
  formatted_project_name=replace(lower(var.project_name)," ","-")
  merged_tags=merge(var.default_tags,var.project_tags)
  formatted_bucket_name=replace(replace(lower(var.bucket_name),"!","")," ","-")
  port_list=split(",",var.allwed_ports)
  sg_rules=[
    for port in local.port_list :
    {
      name="port-${port}"
      port=port
      desciption="allow traffic port on ${port}"
    }
  ]
  instance_size=lookup(var.instance_sizes,var.environment,"t2.micro")

  desired_locations=toset(concat(var.user_locations,var.default_location))
  positive_costs= [for cost in var.monthly_costs : abs(cost)]
  avg_cost=sum(local.positive_costs)/length(local.positive_costs)
  max_cost=max(local.positive_costs...)
  current_timestamp=timestamp()
}

resource "aws_s3_bucket" "my_bucket"{
  bucket=var.bucket_name
  tags=local.merged_tags
}