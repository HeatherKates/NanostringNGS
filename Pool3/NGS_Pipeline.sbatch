#!/bin/bash
#SBATCH --job-name=Pool3NGS
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=50gb
#SBATCH --time=12:00:00
#SBATCH --output=logs/Pool3NGS_%j.log
#SBATCH --error=logs/Pool3NGS_%j.error
#SBATCH --account=timgarrett
#SBATCH --qos=timgarrett-b

module load geomxngspipeline/3.1.1.5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
geomxngspipeline --in=Pool3_fastq_symlinks --out=Pool3_DCC --ini=Pool3.HubMAP_Proteome_Assay_project_20240711T1507_GNP_config.ini --threads=8
