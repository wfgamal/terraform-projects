provider "aws" {
    region = "eu-central-1"
    profile = "terrauser-terraform"
}

resource "aws_iam_user" "myuser" {
    name = "john-doe"
}

resource "aws_iam_policy" "s3policy" {
    name = "s3custompolicy"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObjectVersionTagging",
                "s3:GetStorageLensConfigurationTagging",
                "s3:GetObjectAcl",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetIntelligentTieringConfiguration",
                "s3:GetObjectVersionAcl",
                "s3:GetBucketPolicyStatus",
                "s3:GetObjectRetention",
                "s3:GetBucketWebsite",
                "s3:GetJobTagging",
                "s3:ListJobs",
                "s3:GetObjectLegalHold",
                "s3:GetBucketNotification",
                "s3:GetReplicationConfiguration",
                "s3:ListMultipartUploadParts",
                "s3:GetObject",
                "s3:DescribeJob",
                "s3:GetAnalyticsConfiguration",
                "s3:GetObjectVersionForReplication",
                "s3:GetStorageLensDashboard",
                "s3:GetLifecycleConfiguration",
                "s3:GetAccessPoint",
                "s3:GetInventoryConfiguration",
                "s3:GetBucketTagging",
                "s3:GetBucketLogging",
                "s3:ListBucketVersions",
                "s3:ListBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetEncryptionConfiguration",
                "s3:GetObjectVersionTorrent",
                "s3:GetBucketRequestPayment",
                "s3:GetAccessPointPolicyStatus",
                "s3:GetObjectTagging",
                "s3:GetMetricsConfiguration",
                "s3:GetBucketOwnershipControls",
                "s3:GetBucketPublicAccessBlock",
                "s3:ListBucketMultipartUploads",
                "s3:ListAccessPoints",
                "s3:GetBucketVersioning",
                "s3:GetBucketAcl",
                "s3:ListStorageLensConfigurations",
                "s3:GetObjectTorrent",
                "s3:GetStorageLensConfiguration",
                "s3:GetAccountPublicAccessBlock",
                "s3:ListAllMyBuckets",
                "s3:GetBucketCORS",
                "s3:GetBucketLocation",
                "s3:GetAccessPointPolicy",
                "s3:GetObjectVersion"
            ],
            "Resource": "*"
        }
    ]
}

    EOF
  
}

resource "aws_iam_policy_attachment" "policyBind" {
  
  name = "s3policyattach"
  users = [ aws_iam_user.myuser.name ]
  policy_arn = aws_iam_policy.s3policy.arn
}