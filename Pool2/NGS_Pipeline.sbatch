#!/bin/bash
#SBATCH --job-name=Pool2NGS
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
geomxngspipeline --in=Pool2_fastq_symlinks --out=Pool2_DCC --ini=Pool2.Proteome_HubMAP_20240620T1851_GNP_config.ini  --threads=8
