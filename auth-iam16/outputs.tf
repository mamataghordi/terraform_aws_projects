output "user-names" {
  value = [for user in local.users : "${user.first_name}-${user.last_name}"]

}
output "user_password" {
  value = {
    for user, profile in aws_iam_user_login_profile.users :
    user => "user must create password on first login"
  }
  sensitive = true
}
