#!/usr/bin/env bash

if [ ! -d kenlm ]; then
    git clone https://github.com/kpu/kenlm.git
    echo -e "\n"
fi

if [ ! -d kenlm/build ]; then
    mkdir kenlm/build
    cd kenlm/build
    cmake ..
    make
    cd ../..
    echo -e "\n"
fi

if [ ! -d openfst-1.6.3 ]; then
    echo "Download and extract openfst ..."
    wget https://src.fedoraproject.org/lookaside/extras/openfst/openfst-1.6.3.tar.gz/sha512/06514fb06aa865d2527dec7095930217d7acb423fb295ed4a4bd7975f652a891940cb701e36ed383218782d922008b2164ce1a1df0590684799ad41707814257/openfst-1.6.3.tar.gz
    tar -xzvf openfst-1.6.3.tar.gz
    echo -e "\n"
fi

if [ ! -d ThreadPool ]; then
    git clone https://github.com/progschj/ThreadPool.git
    echo -e "\n"
fi

echo "Install decoders ..."
python setup.py install --num_processes 4
echo "Testing installation ..."
python ctc_decoders_test.py
