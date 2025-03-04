#!/bin/sh
accountNo=211125586466 # enter account number to use here
region=ap-south-1 # enter region of ecr repo created
ecrRepoName=ingest-sftp-to-s3 # enter name of ecr repo created

docker build . -t ${accountNo}.dkr.ecr.${region}.amazonaws.com/${ecrRepoName}:latest
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${accountNo}.dkr.ecr.${region}.amazonaws.com
docker push ${accountNo}.dkr.ecr.${region}.amazonaws.com/${ecrRepoName}:latest
