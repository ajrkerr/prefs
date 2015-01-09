GROUPS=groups | sed -e 's/ /,/g'

useradd -G $GROUPS -m ajrkerr


# Generate SSH Key
#ssh-keygen -t rsa -C your_email@`hostname`


