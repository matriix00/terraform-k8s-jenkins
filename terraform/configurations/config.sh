#!/bin/bash
apt update

apt install kubectl

apt-get install google-cloud-sdk-gke-gcloud-auth-plugin 

gcloud container clusters get-credentials cluster-jenkins --region europe-west1

apt install git -y
