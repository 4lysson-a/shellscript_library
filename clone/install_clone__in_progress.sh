#!/bin/bash
# In progress
OUTPUT_FILE_NAME="clone.sh"
OUTPUT_FILE_PATH="/home/${USER}/.clone"

mkdir ${OUTPUT_FILE_PATH}/${OUTPUT_FILE_NAME}

curl -o ${OUTPUT_FILE_NAME} https://raw.githubusercontent.com/4lysson-a/clone/main/clone.sh 

mv ${OUTPUT_FILE_NAME} ${OUTPUT_FILE_PATH}/${OUTPUT_FILE_NAME}

# Define o nome do alias
alias_name="clone"

# Define o diretório onde será procurado o arquivo clone.sh
search_dir=/home/${USER}/

# Encontra o arquivo clone.sh
echo "Buscando o caminho para o script ..."
script_path=$(find $search_dir -name clone.sh -type f -print -quit)

if [ -z "$script_path" ]; then
    echo "Não foi possível encontrar o arquivo clone.sh no diretório $search_dir"
    exit 1
fi

# Obtém o arquivo de configuração correto (bashrc ou zshrc)
config_file=~/.bashrc
if [ -n "$ZSH_VERSION" ]; then
    config_file=~/.zshrc
fi

# Verifica se o alias já existe no arquivo de configuração
grep -q "alias $alias_name=" $config_file

if [ $? -eq 0 ]; then
    echo "O alias $alias_name já existe no arquivo $config_file"
    exit 0
else
    # Adiciona o alias ao arquivo de configuração
    echo "alias $alias_name='$script_path'" >> $config_file
    # Informa ao usuário que o alias foi adicionado
    echo "O alias $alias_name foi adicionado ao arquivo $config_file"
fi
