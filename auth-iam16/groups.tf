resource "aws_iam_group" "education" {
  name = "Education"
  path = "/groups/"
}
resource "aws_iam_group" "engineers" {
  name = "engineers"
  path = "/groups/"
}
resource "aws_iam_group" "managers" {
  name = "managers"
  path = "/groups/"
}
resource "aws_iam_group_membership" "eduction_members" {
  name  = "education_member_group"
  group = aws_iam_group.education.name
  users = [
    for user in aws_iam_user.users : user.name if user.tags.department == "Education"
  ]
}
resource "aws_iam_group_membership" "engineers_members" {
  name  = "engineer_member_group"
  group = aws_iam_group.engineers.name
  users = [
    for user in aws_iam_user.users : user.name if user.tags.department == "Engineering"
  ]

}
resource "aws_iam_group_membership" "manager_members" {
  name  = "manager_member_group"
  group = aws_iam_group.managers.name
  users = [
    for user in aws_iam_user.users : user.name if contains(keys(user.tags), "Job_title") && can(regex("Manager | CEO", user.tags.Job_title))
  ]

}
