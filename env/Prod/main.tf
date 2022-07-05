module "producao" {
    source = "../../infra"
    nome = "producao"
    regiao_aws = "us-east-1"
    descricao = "aplicacao-de-producao"
    max = 5
    server = "t2.micro"
    ambiente = "ambiente-de-producao"
    role = "role-beanstalk-producao"
    policy = "policy-beanstalk-producao"
    profile = "profile-beanstalk-producao"

}