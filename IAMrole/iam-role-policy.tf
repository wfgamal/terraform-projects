resource "aws_iam_role" "ec2-role" {
    name = "ec2-role"
    assume_role_policy = <<EOF
    {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
 }
    EOF

  tags = {
      name = "ec2-role"
  }
}


resource "aws_iam_policy" "s3-policy" {
    name = "s3-policy"
    path = "/"
    policy = <<EOF
    {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:Get*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
    EOF
}


resource "aws_iam_role_policy_attachment" "name" {
    role = aws_iam_role.ec2-role.name
    policy_arn = aws_iam_policy.s3-policy.arn
  
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2-role.name
}

