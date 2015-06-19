cd /root/python-3.4

# Untar python binary
if [ -e python-3.4.0.tgz ]
then
    tar -zxvf python-3.4.0.tgz
    rm python-3.4.0.tgz
else
    echo "TGZ already extracted...skipping..."
fi

# Build from source code
if [ -d /root/python-3.4/Python-3.4.0 ]
then
    if [ ! -e /usr/local/bin/python3.4 ]
    then
        cd /root/python-3.4/Python-3.4.0
        ./configure
        make
        # make test - only useful if testing manually on new OS config
        make altinstall
    else
        echo "Python 3.4 already installed...skipping..."
    fi
else
    echo "ERROR: Python-3.4.0 directory does not exist!" 1>&2
    exit 1
fi

# Install virtualenv 
if [ -e /usr/local/bin/pip3.4 ]
then
    /usr/local/bin/pip3.4 install virtualenv
else
    echo "ERROR: pip3.4 does not exist!" 1>&2
    exit 1
fi
