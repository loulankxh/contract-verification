#! /bin/bash

PROJECT_PATH=~/projects/contract-verification/
#solidity
PATH_TO_CONTRACTS=${PROJECT_PATH}solidity
#CONTRACT_NAME=auction.sol

for CONTRACT_NAME in `ls $PATH_TO_CONTRACTS/`
do 
	if [[ "$CONTRACT_NAME" == *".sol" ]]; 
	then
		echo $PATH_TO_CONTRACTS
		output_file=${CONTRACT_NAME%.*}.txt
		echo $CONTRACT_NAME
		(time docker run --rm -v $PATH_TO_CONTRACTS:/contracts solc-verify:latest /contracts/$CONTRACT_NAME) >& ./output/solidity/${output_file}
	fi
done

PATH_TO_CONTRACTS=${PROJECT_PATH}dsc-instrument

for CONTRACT_NAME in `ls $PATH_TO_CONTRACTS/`
do
        if [[ "$CONTRACT_NAME" == *".sol" ]];
        then
		echo $PATH_TO_CONTRACTS
		output_file=${CONTRACT_NAME%.*}.txt
                echo $CONTRACT_NAME
                (time docker run --rm -v $PATH_TO_CONTRACTS:/contracts solc-verify:latest /contracts/$CONTRACT_NAME) >& ./output/dsc-instrument/${output_file}
        fi
done

