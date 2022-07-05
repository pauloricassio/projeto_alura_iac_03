module "homologacao" {
    source = "../../infra"
    nome = "homologacao"
    regiao_aws = "us-east-2"
    descricao = "aplicacao-de-homologacao"
    max = 3
    server = "t2.micro"
    ambiente = "ambiente-de-homologacao"
    role = "role-beanstalk-homologacao"
    policy = "policy-beanstalk-homolpgacao"
    profile = "profile-beanstalk-homologacao"

}