# Ansible

This setup is supposed to work "out of the box" thanks to docker containerization.

## SSH setup (on local machine)

1. Generate ssh key on control node

    ```bash
        ssh-keygen -t ed25519 -C "ansible default"
    ```

2. Send key to remote node

    **Linux**

    ```bash
        ssh-copy-id -i ~/.ssh/id_ed25519.pub 185.188.249.54
    ```

    **Windows**

    Copy public key to the remote node manually.

    File: authorized_keys under ~/.ssh/

    ```bash
    echo "<contenuto_della_tua_chiave_pubblica>" >> ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```

3. Check ssh connection

    ```bash
        ssh -i ansible 185.188.249.54
    ```

4. **IMPORTANT**: copy the generated ssh keys under `ansible-control-node/ssh-keys` so they can be copied into the container.

This setup provides instant connection to remote node.

## Docker

1. Run docker container
   Under `/ansible-control-node`

    ```bash
    docker compose build
    docker compose up -d
    docker compose exec ansible bash
    ```

2. Ping remote node

    ```bash
    ansible vps -m ping
    ```

    If python is not installed on remote host:

    ```bash
    ssh -i ~/.ssh/ansible root@185.188.249.54
    apt update && apt install -y python3
    which python3
    ```

    or run the bootstrap-python.yml playbook:

    ```bash
    ansible-playbook -i inventory.ini bootstrap-python.yml
    ```

3. Run playbooks

    ```bash
    
    ```
