import pulumi
import pulumi_aws as aws

config = pulumi.Config()
region = config.get("region") or "us-east-1"

bucket = aws.s3.Bucket("minicurso-s3")

ec2 = aws.ec2.Instance("minicurso-ec2",
    ami=config.require("ami_id"),
    instance_type="t2.micro",
    tags={
        "Name": "MinicursoEC2"
    }
)

pulumi.export("ec2_id", ec2.id)
pulumi.export("s3_bucket", bucket.id)
