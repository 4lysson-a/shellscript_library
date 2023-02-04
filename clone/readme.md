# Clone

Shellscript para automatizar o clone de repositórios

## Uso

Basta usar o alias `clone` ( caso esse tenha sido instalado ) e passar o nome do seu repositório

**Obs: Para que o comando abaixo funcione é necessário que você tenha setado o usuário, abaixo na doc mostro como isso pode ser feito**

```sh
  clone portfolio # clona o repositório do usuário setado
```

Mudança rápida de usuário

```sh
  clone portfolio santosfk # clona o repositório de outro usuário
```

### Argumentos uteis

- `clone -h`
  - Mostra todos os argumentos
- ``

- `close --set-name 4lysson-a
  - Seta um usuário padrão 
  - O comando vai criar um arquivo de texto salvando o nome do usuário localmente na máquina
  - Para trocar basta setar novamente


## Instalação (Em Construção)

```shellscript
sudo curl -o install_clone.sh https://raw.githubusercontent.com/4lysson-a/clone/main/install.sh && sudo bash install_clone.sh
```

```bash
alias clone='/home/aly/Documentos/sh/clone/clone.sh'
```




https://user-images.githubusercontent.com/26152669/216734199-ba031ef6-fcfe-479b-b82e-52bd902e3669.mp4

