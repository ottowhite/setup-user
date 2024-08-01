#!/bin/bash

# Check if the user 'ow20' exists
if id "ow20" &>/dev/null; then
    echo "User 'ow20' already exists. Exiting script."
    exit 1
else
    echo "User 'ow20' does not exist. Proceeding with user creation."

    # Create the user 'ow20' with a home directory and bash shell
    useradd -m -s /bin/bash ow20

    # Create the .ssh directory and authorized_keys file
    mkdir /home/ow20/.ssh
    touch /home/ow20/.ssh/authorized_keys

    # Add the SSH public key to the authorized_keys file
	echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDg1mB8+Rrk6beLTjF0AZKdoSWDg3xPPKDS5uHfyCiq29Xy050nbGrxXnRLRc+KD9GVDzPoxAFrnmDUE7zicmuaInAg0CdmS2YT3Hu9G8KTyBoYge1RMcQRPB0DCRodVldrm6nAJoRy+1e7WbLSvtlkkrSxi25iHne4eWlgc0r9yMMaAuwQnkHrvWVOhQLbIWAYda2ohcabhfvNVQ2EP1xxdbmPnJW35Rov3MG3yj3kU+9Y9oaRl/Gt+gjVF0/CHmlSNE/dSsIhfduCwIi2fkJ2rNlB3gDQnlIEEH+Er5/cN6phLfV9WPZX8e8Us1RdNv8qfFRLSlvp0S2FsHWVfHDI/KD7ssqU6EflFOo2IEh/fqeSU7NV4DrZg8xtqeGMd4OyQiSbCQx3KiNMGsHN8aOHaP+dfpFQbIr3elwCSqjroq274wYmQ3rhWQqpcOLnXNfDo3tEl6240unTP2CcFw57jrVger6WP4FTFBUiNV7IqgWxq84wKazCrCQ2iqQzSr0= otto@ottos-spectre" > /home/ow20/.ssh/authorized_keys

    # Set the correct ownership and permissions
    chown ow20:ow20 -R /home/ow20/.ssh
    usermod -aG admin ow20
    usermod -aG sudo ow20

    # Set permissions using runuser to execute as 'ow20'
    runuser -u ow20 -- sudo chmod 0700 /home/ow20/.ssh
    runuser -u ow20 -- sudo chmod 0600 /home/ow20/.ssh/authorized_keys

    echo "User 'ow20' has been created and SSH key configured."
fi