#!/bin/bash
dataFileName="../Storage/15MBData.csv"
./DataAudit Setup
echo "Setup Done..."
./DataAudit TagGen Params.bin alpha.bin $dataFileName
echo "Metadata generated for the data file $dataFileName"



