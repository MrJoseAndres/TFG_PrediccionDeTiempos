#!/bin/bash

# Variante pasada como argumento
variant="AllSelfCrossAttentionModelTFG"

# Lista de datasets
datasets=("env_permit" "Helpdesk" "SEPSIS" \
        "BPI_Challenge_2013_closed_problems" "BPI_Challenge_2013_incidents" \
        "BPI_Challenge_2012_A" "BPI_Challenge_2012_O" \
        "BPI_Challenge_2012" "BPI_Challenge_2012_A" "BPI_Challenge_2012_Complete" \
        "BPI_Challenge_2012_O" "BPI_Challenge_2012_W" "BPI_Challenge_2012_W_Complete")

# Bucle externo para recorrer la lista de datasets
for dataset in "${datasets[@]}"; do
    echo "Procesando dataset: $dataset"

    # Bucle interno para recorrer la lista de números del 0 al 4
    for i in {0..4}; do
        #ts -G 1 python train_model_TFG.py --variant $variant --dataset $dataset --fold $i -lr 0.001 -ao TAA -t 0 #Ejecutado en el experimento 1
        ts -G 1 python train_model_TFG.py --variant $variant --dataset $dataset --fold $i -lr 0.001 -ao TAT -t 1
        ts -G 1 python train_model_TFG.py --variant $variant --dataset $dataset --fold $i -lr 0.001 -ao TAT -t 2

    done
done
echo "All experiments have been lauched for $variant"