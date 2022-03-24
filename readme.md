
# personcunha/totvsrmappmesh

## Instalação do TOTVS RM com Arquitetura de Operação na Nuvem

#

# AppMesh para o TOTVS

Seria interessante usar as ferramentas da Hashicorp para prover conectividade segurança e orquestração da carga de trabalho das aplicações TOTVS.

## Consul

- Usar o recurso de Key Value database para armazenar as configurações e fazer uma central de configurações. 

- Usar o consul register para fazer o registros do serviços no catalogo de serviços.

- usar o consul connect para restringir o fluxo de conectividade das aplicações, ex.: o banco apenas é acessado pelas aplicações APPSERVER e PORTALRM, bem como alguma ferramenta para rodar consultas podendo ser outro container com SQLPAD ou DREMIO para bigdata.

## Consultemplate

Usar para renderizar os arquivos a serem usados pelo orquestrador [Nomad](nomadproject.io/), como artefato no template ao rodar o container das aplicações.

## Nomad

Usar para orquestrar as cargas de trabalho das aplicações relativas a sustentação do ambiente dos ERP's TOTVS.


## Vault

Usar este para gerir os certificados usados nas aplicações e dar acesso ao banco para as aplicações que necessitarem.


## Terraform

Usado para provisionar a infra necessária para que os serviços sejam instanciados.

Fazer módulos que permitam o deploy de pelo menos: Vagrant, AWS, Azure e GCP.


# Configurar o WebAPP

[Os serviços protheus poder ser disponibilizados via web](https://tdn.totvs.com/display/tec/WebApp+-+Configurando+nativamente+o+Application+Server+como+servidor+Web)


O broker pode consultar o Catalogo de serviços do consul para renderizar as rotas:
[Brower Webapp](https://tdn.totvs.com/display/tec/Balanceamento+entre+Clientes+HTTP+e+servidor+Protheus)

# Implementação do Licence Server da TOTVS



[Documentação da TOTVS - Instalação Licence Server Virtual](https://tdn.totvs.com/display/framework/TOTVS+License+Server+Virtual)

### Tomar cuidado pois o licence server é um SPOF - PONTO UNICO DE FALHA

[Guia de Gestão de Licenças do Portal TOTVS](https://tdn.totvs.com/pages/viewpage.action?pageId=172298980)




[No RM TOTVS configura-se o Licence server aqui:](https://tdn.totvs.com/display/framework/Configurando+o+RM)

![](https://tdn.totvs.com/download/attachments/161350863/image2014-9-11%2010%3A26%3A23.png?version=1&modificationDate=1410441797000&api=v2)


## Porém: no caso do appmesh deve-se usar o nome do serviço registrado no catalogo do consul, testar nome de porta também.

#### É possível que precise ser configurado

Usando a imagem:

- Na pasta files deve ter um arquivo com as informações do contrato de Licença.


# Compose

Há outro serviço que pode ser implantado em container pois pode ser agrupado ao de licença é o SmartClient que é em Java Tomcatch

[Documentação do SmartClient](https://tdn.totvs.com/display/tec/WebApp+-+Configurando+nativamente+o+Application+Server+como+servidor+Web)

[Smart Client Configuração WEB](https://tdn.totvs.com/display/tec/SmartClient+HTML)




# Portal TOTVS RM



# MS SQL Dockerizado

A minha maior duvida fica com relação ao licenciamento, entendo que cada container é encarado como uma máquina virtual na questão de licenciamento (**DUVIDA!**).


#



OBS: [docs](https://medium.com/@adilsonbna/otimizando-espa%C3%A7os-de-docker-images-utilizando-alpine-3-5-tomcat-8-java-1-8-com-dockerfile-b8d39fe46e3d) para imagem tomcat

[Tutoria Docker TOMCAT](https://www.cprime.com/resources/blog/deploying-your-first-web-app-to-tomcat-on-docker/)
#### Para montar a imagem usa-se o comando: docker build -t=personcunha/totvsrmappmesh .


### [Disaster Recovery](https://tdn.totvs.com/display/framework/TOTVS+License+Server+Virtual#TOTVSLicenseServerVirtual-Recuperacao-de-Desastre)



# Configurações NOMAD
## Como o portal é .Net e roda no windows podería-se usar o nomad com o driver do IIS para orquestrar os apps e catalogar no consul roteando com traefik para os endpoints terem https por padrão.


Driver IIS para o portal o S.O. Precisa ser Windows Server 2016

## Agent
    plugin "win_iis" {
    client {
        enabled = true
        stats_interval = "30s"
    }
    }

## Task
    task "iis-test" {
    driver = "win_iis"

    config {
        path = "C:\\inetpub\\wwwroot"
        apppool_identity {
        identity="SpecificUser"
        username="vagrant"
        password="vagrant"
        }
    }
    }


    Artefato MSI do portal

    Powershell para instalar silenciosamente

    buscar configuração do Consul
# Implementar o serviço de Cache centralizado para o ERP usando redis

[TDN - Documentação dos detalhes de implantação](https://tdn.engpro.totvs.com.br/pages/releaseview.action?pageId=348295834)
[Outra documentacao mesmo assunto](https://tdn.totvs.com/display/public/LRM/Cache+Centralizado+-+Get+Started)

## TODO - Alterar para atender com Nomad usando driver docker.

# RM.Host.Service.exe.config

Consul/Nomad Template pra renderizar os arquivos de configuração buscando dados da configuração no Key/Value do Consul

