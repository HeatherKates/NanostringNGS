#!/bin/bash
#SBATCH --job-name=Pool4NGS
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50gb
#SBATCH --time=12:00:00
#SBATCH --output=logs/Pool4NGS_%j.log
#SBATCH --error=logs/Pool4NGS_%j.error
#SBATCH --account=timgarrett
#SBATCH --qos=timgarrett-b

module load geomxngspipeline/3.1.1.5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
geomxngspipeline --in=Pool4_fastq_symlinks --out=Pool4_DCC --ini=Pool4.HubMAP_Proteome_assay_20240711T1509_GNP_config.ini --threads=8
