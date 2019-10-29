variable "name" {
  description = "The name of the role."
  type = string
  default = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type = string
  default = null
}

variable "service_ids" {
  description = "List of identifiers for principals. e.g. ec2.amazonaws.com."
  type = list(string)
}

variable "iam_policy_arns" {
  description = "List of IAM policy ARNs."
  type = list(string)
  default = []
}

variable "force_detach_policies" {
  description = "Specifies to force detaching any policies the role has before destroying it."
  type = bool
  default = false
}

variable "path" {
  description = "The path to the role."
  type = string
  default = null
}

variable "description" {
  description = "The description of the role."
  type = string
  default = null
}

variable "max_session_duration" {
  description = "The maximum session duration (in seconds) that you want to set for the specified role."
  type = number
  default = null
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the role."
  type = string
  default = null
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role."
  type = map(string)
  default = {}
}
