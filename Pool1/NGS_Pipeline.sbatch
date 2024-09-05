#!/bin/bash
#SBATCH --job-name=Pool1NGS
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50gb
#SBATCH --time=12:00:00
#SBATCH --output=logs/Pool2NGS_%j.log
#SBATCH --error=logs/Pool2NGS_%j.error
#SBATCH --account=timgarrett
#SBATCH --qos=timgarrett

module load geomxngspipeline/3.1.1.5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
geomxngspipeline --in=Pool1_fastq_symlinks --out=Pool1_DCC --ini=Pool1.Human_Proteome_atlas_assay_20240615T0242_GNP_config.ini --threads=8
