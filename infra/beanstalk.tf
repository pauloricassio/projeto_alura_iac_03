resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = var.nome
  description = var.descricao
}

resource "aws_elastic_beanstalk_environment" "ambiente_beanstalk" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.4.17 running Docker"


setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.server
  }

setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max
  }
  
setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }
}    

resource "aws_elastic_beanstalk_application_version" "default" {
    depends_on = [
        aws_elastic_beanstalk_environment.ambiente_beanstalk, 
        aws_elastic_beanstalk_application.beanstalk_app, 
        aws_s3_bucket_object.docker_images
    ]
  name        = var.ambiente
  application = var.nome
  description = var.descricao
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_bucket_object.docker_images.id
}