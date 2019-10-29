# terraform-aws-iam-service-role
Terraform module which creates IAM Service Role on AWS.

## Usage

```hcl-terraform
module "this" {
  source = "yukihira1992/iam-service-role/aws"

  name = "service-role-for-lambda"
  service_ids = [
    "lambda.amazonaws.com",
  ]
  iam_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess",
  ]

  tags = {
    Environment = "dev"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name | The name of the role. | string | `null` | no |
| name_prefix | Creates a unique name beginning with the specified prefix. Conflicts with name. | string | `null` | no |
| service_ids | List of identifiers for principals. e.g. ec2.amazonaws.com. | list(string) | | yes |
| iam_policy_arns | List of IAM policy ARNs. | list(string) | `[]` | no |
| force_detach_policies | Specifies to force detaching any policies the role has before destroying it. | bool | `false` | no |
| path | The path to the role. | string | `null` | no |
| description | The description of the role. | string | `null` | no |
| max_session_duration | The maximum session duration (in seconds) that you want to set for the specified role. | number | `null` | no |
| permissions_boundary | The ARN of the policy that is used to set the permissions boundary for the role. | string | `null` | no |
| tags | Key-value mapping of tags for the IAM role. | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | The Amazon Resource Name (ARN) specifying the role. |
| name | The name of the role. |
