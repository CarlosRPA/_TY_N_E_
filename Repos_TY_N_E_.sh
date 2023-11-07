#!/bin/bash

##################################################

function prompt_input {
    local prompt_message="$1"
    local var_name="$2"
    while [ -z "${!var_name}" ]; do
        read -p "$prompt_message: " $var_name
        if [ -z "${!var_name}" ]; then
            echo "Resposta inválida. Não pode ser vazio."
        fi
    done
}

##################################################

clear

echo -e "\e[32m

        ██████╗ ██╗   ██╗    ██████╗ ██████╗  █████╗ 
        ██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔══██╗██╔══██╗
        ██████╔╝ ╚████╔╝     ██████╔╝██████╔╝███████║
        ██╔══██╗  ╚██╔╝      ██╔══██╗██╔═══╝ ██╔══██║
        ██████╔╝   ██║       ██║  ██║██║     ██║  ██║
        ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝\e[0m"
echo -e "\e[32m                          BY RPA                                      \e[0m"
echo -e "\e[32m                  AUTOR ==> CARLOS FRAZÃO <==                           \e[0m"
echo -e "\e[32m\e[0m"

echo ""
echo ""
echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ║  \033[34m     Preencha as informações solicitadas abaixo       \033[31m║\033[0m"
echo -e "\033[31m              ║                                                        ║\033[0m"
echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
echo ""

##################################################

# Gerar senha para o Postgres
postgres=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | head -c10)

# Gerar senha para o Minio
senhaminio=$(openssl rand -base64 10 | tr -dc 'a-zA-Z0-9' | head -c10)

# Gera uma chave secreta de 32 caracteres (16 bytes em hexadecimal para apikey)
key=$(openssl rand -hex 16)

# Gera uma chave secreta de 16 caracteres (8 bytes em hexadecimal para n8nkey)
n8nkey=$(openssl rand -hex 8)

##################################################

while true; do
    
    prompt_input "Digite seu domínio para o Minio (ex: minio.dominio.com)" minio
    echo ""
    prompt_input "Crie o nome do usuario Minio (ex: Admin)" usuariominio
    echo ""
    prompt_input "Já foi criada uma senha para o usuario Minio automaticamente, caso não queira crie uma nova (Copia: $senhaminio)" passwordminio
    echo ""
    prompt_input "Digite seu domínio para a API Minio (ex: minioapi.dominio.com)" minioapi
    echo ""
    prompt_input "Digite seu domínio para o Typebot (ex: typebot.dominio.com)" typebot
    echo ""
    prompt_input "Digite a versão da sua escolha para o Typebot (ex: latest | v2.18.3)" versionn
    echo ""
    prompt_input "Digite seu domínio para a API Typebot (ex: typebotapi.dominio.com)" typebotapi
    echo ""
    prompt_input "Digite seu domínio para a API Evolution (ex: evolutionapi.dominio.com)" evolutionapi
    echo ""
    prompt_input "Digite a versão da sua escolha para a API Evolution  (ex: latest | v1.5.4)" evoversionn
    echo ""
    prompt_input "Sua Chave secreta API Key já foi gerada automaticamente (Copie: $key)" apiKeyy
    echo ""
    prompt_input "Digite seu domínio principal do N8N (ex: n8n.dominio.com)" dn8n
    echo ""
    prompt_input "Digite seu domínio para o WEBHOOK N8N (ex: webhookn8n.dominio.com)" dwhn8n
    echo ""
    prompt_input "Digite a versão da sua escolha para o N8N  (ex: latest | 1.12.2)" n8nversionn
    echo ""
    prompt_input "Sua Chave secreta N8N Key já foi gerada automaticamente (Copie: $n8nkey)" n8nkeyy
    echo ""   
    prompt_input "Crie o nome do usuario do Postgres (ex: postgres)" usuariopostgres
    echo ""
    prompt_input "Sua Chave secreta Postgres Key já foi gerada automaticamente (Copie: $postgres)" postgreskeyy
    echo ""
    prompt_input "Digite o seu Email (ex: meuemail@gmail.com)" emaill
    echo ""
    prompt_input "Digite a senha do aplicativo do Gmail" app
    echo ""    

    clear

 # Pergunte ao usuário se as informações estão corretas

    echo ""
    echo -e "\n\033[31m              ╔════════════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[31m              ║                                                        ║\033[0m"
    echo -e "\033[31m              ║  \033[34m   Verifique se os dados abaixos estão ccorretos      \033[31m║\033[0m"
    echo -e "\033[31m              ║                                                        ║\033[0m"
    echo -e "\033[31m              ╚════════════════════════════════════════════════════════╝\033[0m\n"
    
    echo ""
    echo "As informações fornecidas estão corretas?"
    echo ""    
    echo -e "\033[34m- Domínio do Minio:\033[33m $minio\033[0m"
    echo ""
    echo -e "\033[34m- Usuario do Minio:\033[33m $usuariominio\033[0m"
    echo ""
    echo -e "\033[34m- Senha do Minio:\033[33m $passwordminio\033[0m"
    echo ""
    echo -e "\033[34m- Domínio da API Minio:\033[33m $minioapi\033[0m"
    echo ""
    echo -e "\033[34m- Domínio do Typebot:\033[33m $typebot\033[0m"
    echo ""
    echo -e "\033[34m- Sua versão do Typebot:\033[33m $versionn\033[0m"
    echo ""
    echo -e "\033[34m- Domínio da API Typebot:\033[33m $typebotapi\033[0m" 
    echo ""
    echo -e "\033[34m- Domínio da Evolution-API:\033[33m $evolutionapi\033[0m"
    echo ""
    echo -e "\033[34m- Sua versão da Evolution-API:\033[33m $evoversionn\033[0m"
    echo ""
    echo -e "\033[34m- Sua Apikey:\033[33m $apiKeyy\033[0m"
    echo ""
    echo -e "\033[34m- Domínio da Principal N8N:\033[33m $n8n\033[0m"
    echo ""
    echo -e "\033[34m- Domínio do WEBHOOK N8N:\033[33m $dwhn8n\033[0m"
    echo ""
    echo -e "\033[34m- Sua versão do N8N:\033[33m $n8nversionn\033[0m"
    echo ""
    echo -e "\033[34m- Sua N8N Key:\033[33m $n8nkeyy\033[0m"
    echo ""    
    echo -e "\033[34m- Usuario do Postgres:\033[33m $usuariopostgres\033[0m"
    echo ""
    echo -e "\033[34m- Seu Postgres Key:\033[33m $postgreskeyy\033[0m"
    echo ""
    echo -e "\033[34m- Proxy Reverso Email:\033[33m $emaill\033[0m"
    echo ""
    echo -e "\033[34m- Senha do aplicativo Gmail:\033[33m $app\033[0m"
    echo ""    

    read -p "Digite 'Y' para continuar ou 'N' para sair do script: " resposta

    if [ "$resposta" = "Y" ] || [ "$resposta" = "y" ]; then
        break
    elif [ "$resposta" = "N" ] || [ "$resposta" = "n" ]; then
        echo "Saindo do script."
        exit 1  # Isso encerrará o script
    else
        echo "Entrada inválida. Digite 'Y' para continuar ou 'N' para sair do script."
    fi

done

##################################################

# Criar uma pasta no diretório raiz

cd 

echo "Criando a pasta 'COPIAR'...."

mkdir /home/ubuntu/COPIAR

cd /home/ubuntu/COPIAR

##################################################

# postgres.yaml

cat > postgres.yaml << EOL
version: "3.7"

services:
  postgres:
    image: postgres:14
    environment:
      - POSTGRES_PASSWORD=$postgres
    networks:
      - minha_rede
    #ports:
    #  - 5432:5432
    volumes:
      - postgres_data:/var/lib/postgresql/data
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

volumes:
  postgres_data:
    external: true
    name: postgres_data

networks:
  minha_rede:
    external: true
    name: minha_rede

EOL

##################################################

# minio.yaml

cat > minio.yaml << EOL
version: "3.7"

services:
  minio:
    image: quay.io/minio/minio
    command: server /data --console-address ":9001"
    networks:
      - minha_rede
    volumes:
      - minio_data:/data
    environment:
      - MINIO_ROOT_USER=$usuariominio
      - MINIO_ROOT_PASSWORD=$passwordminio
      - MINIO_BROWSER_REDIRECT_URL=https://$minio
      - MINIO_SERVER_URL=https://$minioapi
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      labels:
        - traefik.enable=true
        - traefik.http.routers.minio_public.rule=Host() #minioapi
        - traefik.http.routers.minio_public.entrypoints=websecure
        - traefik.http.routers.minio_public.tls.certresolver=letsencryptresolver
        - traefik.http.services.minio_public.loadbalancer.server.port=9000
        - traefik.http.services.minio_public.loadbalancer.passHostHeader=true
        - traefik.http.routers.minio_public.service=minio_public
        - traefik.http.routers.minio_console.rule=Host() #minio
        - traefik.http.routers.minio_console.entrypoints=websecure
        - traefik.http.routers.minio_console.tls.certresolver=letsencryptresolver
        - traefik.http.services.minio_console.loadbalancer.server.port=9001
        - traefik.http.services.minio_console.loadbalancer.passHostHeader=true
        - traefik.http.routers.minio_console.service=minio_console
volumes:
  minio_data:
    external: true
    name: minio_data

networks:
  minha_rede:
    external: true
    name: minha_rede
EOL

sudo sed -i "s/- traefik\.http\.routers\.minio_public\.rule=Host()/- traefik.http.routers.minio_public.rule=Host(\`$minioapi\`)/" /home/ubuntu/COPIAR/minio.yaml

sudo sed -i "s/- traefik\.http\.routers\.minio_console\.rule=Host()/- traefik.http.routers.minio_console.rule=Host(\`$minio\`)/" /home/ubuntu/COPIAR/minio.yaml

clear

echo "seu dominio do Minio: https://$minio"
echo ""
echo "Seu usuario do Minio: $usuariominio"
echo ""
echo "Sua senha do Minio: $passwordminio"
echo ""
echo "Agora dentro do seu Minio pegue a sua Access_Key e Secret_Key, e agora preencha abaixo!"
echo ""

##################################################

# Inicialize a variável de confirmação
confirmacao=""

while true; do
    prompt_input "Digite seu Access_Key" suakey
    echo ""
    prompt_input "Digite sua Secret_Key" suasecret
    echo ""    

    # Pergunte ao usuário se as informações estão corretas
    echo ""    
    echo "As informações fornecidas estão corretas?"
    echo ""
    echo "Sua Access_Key: $suakey"
    echo ""
    echo "Sua Secret_Key: $suasecret"
    echo ""

    read -p "Digite 'Y' para continuar ou 'N' para reescrever as informações: " confirmacao
    if [ "$confirmacao" = "Y" ] || [ "$confirmacao" = "y" ]; then
        break  # Se as informações estiverem corretas, saia do loop
    elif [ "$confirmacao" = "N" ] || [ "$confirmacao" = "n" ]; then
        continue  # Se o usuário disser "N", continue repetindo as perguntas
    fi
done

##################################################

# typebot_builder.yaml

cat > typebot_builder.yaml << EOL
version: "3.7"

services:
  typebot_builder:
    image: baptistearno/typebot-builder:$versionn
    networks:
      - minha_rede
    environment:
      - DATABASE_URL=postgresql://postgres:$postgres@postgres:5432/typebot
      - ENCRYPTION_SECRET=7/l2NKGhkMUHRV0dt/g8hD2YNopCrAeH
      - DEFAULT_WORKSPACE_PLAN=UNLIMITED
      - NEXTAUTH_URL=https://$typebot
      - NEXT_PUBLIC_VIEWER_URL=https://$typebotapi
      - NEXTAUTH_URL_INTERNAL=http://localhost:3000
      - DISABLE_SIGNUP=false
      - ADMIN_EMAIL=$emaill
      - NEXT_PUBLIC_SMTP_FROM='Typebot' <$emaill>
      - SMTP_AUTH_DISABLED=false
      - SMTP_USERNAME=$emaill
      - SMTP_PASSWORD=$app
      - SMTP_HOST=smtp.gmail.com
      - SMTP_PORT=587
      - SMTP_SECURE=true
      # Configurações do Typebot e Google Cloud
      #- GOOGLE_CLIENT_ID=
      #- GOOGLE_CLIENT_SECRET=
      # Configurações do Typebot e Minio
      - S3_ACCESS_KEY=$suakey
      - S3_SECRET_KEY=$suasecret
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$minioapi
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.typebot_builder.rule=Host() #typebot
        - traefik.http.routers.typebot_builder.entrypoints=websecure
        - traefik.http.routers.typebot_builder.tls.certresolver=letsencryptresolver
        - traefik.http.services.typebot_builder.loadbalancer.server.port=3000
        - traefik.http.services.typebot_builder.loadbalancer.passHostHeader=true
        - traefik.http.routers.typebot_builder.service=typebot_builder
networks:
  minha_rede:
    external: true
    name: minha_rede

EOL

sudo sed -i "s/- traefik\.http\.routers\.typebot_builder\.rule=Host()/- traefik.http.routers.typebot_builder.rule=Host(\`$typebot\`)/" /home/ubuntu/COPIAR/typebot_builder.yaml

##################################################

# typebot_viewer.yaml

cat > typebot_viewer.yaml << EOL
version: "3.7"

services:
  typebot_viewer:
    image: baptistearno/typebot-viewer:$versionn
    networks:
      - minha_rede
    environment:
      - DATABASE_URL=postgresql://postgres:$postgres@postgres:5432/typebot
      - ENCRYPTION_SECRET=7/l2NKGhkMUHRV0dt/g8hD2YNopCrAeH
      - DEFAULT_WORKSPACE_PLAN=UNLIMITED
      - NEXTAUTH_URL=https://$typebot
      - NEXT_PUBLIC_VIEWER_URL=https://$typebotapi
      - NEXTAUTH_URL_INTERNAL=http://localhost:3000
      - DISABLE_SIGNUP=false
      - ADMIN_EMAIL=$emaill
      - NEXT_PUBLIC_SMTP_FROM='Typebot' <$emaill>
      - SMTP_AUTH_DISABLED=false
      - SMTP_USERNAME=$emaill
      - SMTP_PASSWORD=$app
      - SMTP_HOST=smtp.gmail.com
      - SMTP_PORT=587
      - SMTP_SECURE=true
      # Configurações do Typebot e Google Cloud
      #- GOOGLE_CLIENT_ID=
      #- GOOGLE_CLIENT_SECRET=
      # Configurações do Typebot e Minio
      - S3_ACCESS_KEY=$suakey
      - S3_SECRET_KEY=$suasecret
      - S3_BUCKET=typebot
      - S3_ENDPOINT=$minioapi
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.typebot_viewer.rule=Host() #typebotapi
        - traefik.http.routers.typebot_viewer.entrypoints=websecure
        - traefik.http.routers.typebot_viewer.tls.certresolver=letsencryptresolver
        - traefik.http.services.typebot_viewer.loadbalancer.server.port=3000
        - traefik.http.services.typebot_viewer.loadbalancer.passHostHeader=true
        - traefik.http.routers.typebot_viewer.service=typebot_viewer

networks:
  minha_rede:
    external: true
    name: minha_rede
EOL

sudo sed -i "s/- traefik\.http\.routers\.typebot_viewer\.rule=Host()/- traefik.http.routers.typebot_viewer.rule=Host(\`$typebotapi\`)/" /home/ubuntu/COPIAR/typebot_viewer.yaml

##################################################

# evolution-completo.yaml

cat > evolution.yaml << EOL
version: "3.7"

services:
  evolution:
    image: davidsongomes/evolution-api:$evoversionn
    command: ["node", "./dist/src/main.js"]
    networks:
      - minha_rede
    volumes:
    - evolution_instances:/evolution/instances
    - evolution_store:/evolution/store
    environment:
      - SERVER_URL=https://$evolutionapi
      - DOCKER_ENV=true
      - LOG_LEVEL=ERROR,WARN,DEBUG,INFO,LOG,VERBOSE,DARK,WEBHOOKS
      - DEL_INSTANCE=false
      - CONFIG_SESSION_PHONE_CLIENT=Evolution
      - CONFIG_SESSION_PHONE_NAME=Chrome
      - STORE_MESSAGES=true
      - STORE_MESSAGE_UP=true
      - STORE_CONTACTS=true
      - STORE_CHATS=true
      - CLEAN_STORE_CLEANING_INTERVAL=7200 # seconds === 2h
      - CLEAN_STORE_MESSAGES=true
      - CLEAN_STORE_MESSAGE_UP=true
      - CLEAN_STORE_CONTACTS=true
      - CLEAN_STORE_CHATS=true
      - AUTHENTICATION_TYPE=apikey
      - AUTHENTICATION_API_KEY=$apiKeyy
      - AUTHENTICATION_EXPOSE_IN_FETCH_INSTANCES=true
      - QRCODE_LIMIT=30
      - WEBHOOK_GLOBAL_ENABLED=false
      - WEBHOOK_GLOBAL_URL=https://URL
      - WEBHOOK_GLOBAL_WEBHOOK_BY_EVENTS=false
      - WEBHOOK_EVENTS_APPLICATION_STARTUP=false
      - WEBHOOK_EVENTS_QRCODE_UPDATED=true
      - WEBHOOK_EVENTS_MESSAGES_SET=false
      - WEBHOOK_EVENTS_MESSAGES_UPSERT=true
      - WEBHOOK_EVENTS_MESSAGES_UPDATE=true
      - WEBHOOK_EVENTS_CONTACTS_SET=true
      - WEBHOOK_EVENTS_CONTACTS_UPSERT=true
      - WEBHOOK_EVENTS_CONTACTS_UPDATE=true
      - WEBHOOK_EVENTS_PRESENCE_UPDATE=true
      - WEBHOOK_EVENTS_CHATS_SET=true
      - WEBHOOK_EVENTS_CHATS_UPSERT=true
      - WEBHOOK_EVENTS_CHATS_UPDATE=true
      - WEBHOOK_EVENTS_CHATS_DELETE=true
      - WEBHOOK_EVENTS_GROUPS_UPSERT=true
      - WEBHOOK_EVENTS_GROUPS_UPDATE=true
      - WEBHOOK_EVENTS_GROUP_PARTICIPANTS_UPDATE=true
      - WEBHOOK_EVENTS_CONNECTION_UPDATE=true
      - REDIS_ENABLED=false
      - REDIS_URI=redis://redis:6379
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "1"
          memory: 2048M
      labels:
        - traefik.enable=true
        - traefik.http.routers.evolution.rule=Host() #evolutionapi
        - traefik.http.routers.evolution.entrypoints=websecure
        - traefik.http.routers.evolution.tls.certresolver=letsencryptresolver
        - traefik.http.routers.evolution.priority=1
        - traefik.http.routers.evolution.service=evolution
        - traefik.http.services.evolution.loadbalancer.server.port=8080
        - traefik.http.services.evolution.loadbalancer.passHostHeader=true

volumes:
  evolution_instances:
    external: true
    name: evolution_instances
  evolution_store:
    external: true
    name: evolution_store

networks:
  minha_rede:
    name: minha_rede
    external: true

EOL

sudo sed -i "s/- traefik\.http\.routers\.evolution\.rule=Host()/- traefik.http.routers.evolution.rule=Host(\`$evolutionapi\`)/" /home/ubuntu/COPIAR/evolution.yaml

##################################################

# n8n.yaml modo fila

cat > n8n.yaml << EOL
version: "3.7"

services:
  n8n_editor:
    image: n8nio/n8n:latest
    command: start
    networks:
      - minha_rede
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=$usuariopostgres
      - DB_POSTGRESDB_PASSWORD=$postgres
      - N8N_ENCRYPTION_KEY=$n8nkeyy
      - N8N_HOST=$dn8n # Seu dominio principal aqui
      - N8N_EDITOR_BASE_URL=https://$dn8n/ # Seu dominio principal aqui
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://$dwhn8n/ # Seu dominio WEBHOOK N8N
      - EXECUTIONS_MODE=queue
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n_editor.rule=Host() # dominio n8n
        - traefik.http.routers.n8n_editor.entrypoints=websecure
        - traefik.http.routers.n8n_editor.priority=1
        - traefik.http.routers.n8n_editor.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n_editor.service=n8n_editor
        - traefik.http.services.n8n_editor.loadbalancer.server.port=5678
        - traefik.http.services.n8n_editor.loadbalancer.passHostHeader=1

  n8n_webhook:
    image: n8nio/n8n:latest
    command: webhook
    networks:
      - minha_rede
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=$usuariopostgres
      - DB_POSTGRESDB_PASSWORD=$postgres
      - N8N_ENCRYPTION_KEY=$n8nkeyy
      - N8N_HOST=$dn8n # Seu dominio principal aqui
      - N8N_EDITOR_BASE_URL=https://$dn8n/ # Seu dominio principal aqui
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://$dwhn8n/ # Seu dominio WEBHOOK N8N
      - EXECUTIONS_MODE=queue
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo
    deploy:
      mode: replicated
      replicas: 2
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M
      labels:
        - traefik.enable=true
        - traefik.http.routers.n8n_webhook.rule=(Host()) # dominio WEBHOOK N8N
        - traefik.http.routers.n8n_webhook.entrypoints=websecure
        - traefik.http.routers.n8n_webhook.priority=1
        - traefik.http.routers.n8n_webhook.tls.certresolver=letsencryptresolver
        - traefik.http.routers.n8n_webhook.service=n8n_webhook
        - traefik.http.services.n8n_webhook.loadbalancer.server.port=5678
        - traefik.http.services.n8n_webhook.loadbalancer.passHostHeader=1

  n8n_worker:
    image: n8nio/n8n:latest
    command: worker --concurrency=10
    networks:
      - minha_rede
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n_queue
      - DB_POSTGRESDB_HOST=postgres
      - DB_POSTGRESDB_PORT=5432
      - DB_POSTGRESDB_USER=$usuariopostgres
      - DB_POSTGRESDB_PASSWORD=$postgres
      - N8N_ENCRYPTION_KEY=$n8nkeyy
      - N8N_HOST=$dn8n # Seu dominio principal aqui
      - N8N_EDITOR_BASE_URL=https://$dn8n/ # Seu dominio principal aqui
      - N8N_PROTOCOL=https
      - NODE_ENV=production
      - WEBHOOK_URL=https://$dwhn8n/ # Seu dominio WEBHOOK N8N
      - EXECUTIONS_MODE=queue
      - QUEUE_BULL_REDIS_HOST=redis
      - QUEUE_BULL_REDIS_PORT=6379
      - QUEUE_BULL_REDIS_DB=2
      - NODE_FUNCTION_ALLOW_EXTERNAL=moment,lodash,moment-with-locales
      - EXECUTIONS_DATA_PRUNE=true
      - EXECUTIONS_DATA_MAX_AGE=336
      - GENERIC_TIMEZONE=America/Sao_Paulo
      - TZ=America/Sao_Paulo
    deploy:
      mode: replicated
      replicas: 1
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

networks:
  minha_rede:
    name: minha_rede
    external: true

EOL

sudo sed -i "s/- traefik\.http\.routers\.n8n_editor\.rule=Host()/- traefik.http.routers.n8n_editor.rule=Host(\`$dn8n\`)/" /home/ubuntu/COPIAR/n8n.yaml
    
sudo sed -i "s/- traefik\.http\.routers\.n8n_webhook\.rule=(Host())/- traefik.http.routers.n8n_webhook.rule=(Host(\`$dwhn8n\`)/" /home/ubuntu/COPIAR/n8n.yaml

##################################################

# redis.yaml modo fila

cat > redis.yaml << EOL
version: "3.7"

services:
  redis:
    image: redis:latest
    command: [
        "redis-server",
        "--appendonly",
        "yes",
        "--port",
        "6379"
      ]
    volumes:
      - redis_data:/data
    networks:
      - minha_rede
    deploy:
      placement:
        constraints:
          - node.role == manager
      resources:
        limits:
          cpus: "0.5"
          memory: 1024M

volumes:
  redis_data:
    external: true
    name: redis_data

networks:
  minha_rede:
    external: true
    name: minha_rede

EOL

##################################################

clear

echo "Essa é a senha do Postgres, salva essa senha com cuidado: $postgres"
echo ""
echo "Aqui está o dominio da evolution: https://$evolutionapi/"
echo ""
echo "Copie a Api_Key da Evolution API: $apiKeyy"
echo ""
