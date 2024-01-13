### run.sh

Cria um named pipe (`minecmd`) e inicia o servidor Java passando como o stdin. Permite a execução de comandos partindo de outros processos, util especialmente para o funcionamento correto do script `shutdown_server.sh`. 

Deve ser registrado no cron para ser executado assim que a máquina ligar, utilizando o comando `crontab -e` e adicionando a seguinte linha:

```console
@reboot $PATH_TO_SCRIPT\run.sh 
```

### update_route53.sh

Atualiza o DNS record do `minezada.semroque.com` do Route 53 para apontar para o IP público da máquina que está executando o servidor.

Deve ser registrado no cron para ser executado assim que a máquina ligar, utilizando o comando `crontab -e` e adicionando a seguinte linha:

```console
@reboot $PATH_TO_SCRIPT\update_route53.sh
```

### shutdown_server.sh

Garante o desligamento gracioso do servidor Java quando a máquina desliga, evitando que os arquivos do mundo sejam corrompidos.

Deve ser registrado como um servico do systemd copiando o arquivo shutdown_server.service para `/etc/systemd/system/` e rodando os seguintes comandos:

```console
sudo systemctl daemon-reload
sudo systemctl enable shutdown_server.service
```

### check_server_empty.sh

Checa o número de jogadores presentes no servidor. Será chamado periodicamente pelo cron e, se o servidor estiver vazio por duas chamadas consecutivas, a máquina é desligada.

Deve ser registrado no cron para ser executado periodicamente após o início da máquina, utilizando o comando `sudo crontab -e` e adicionando a seguinte linha:

```console
*/5 * * * * $PATH_TO_SCRIPT/check_server_empty.sh
```
