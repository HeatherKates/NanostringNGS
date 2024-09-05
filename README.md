\# NanostringNGS

\## Setup Instructions

\### 1. Copy configuration files to the config files folder (`config_files`)

\### 2. Create symbolic links for the fastq file paths

The \`geomxngspipeline\` requires all fastq files to be in one directory, but they are located in different directories. Use the following commands to create symbolic links for each pool:

\```bash
\# Pool 1
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool1-10B-22N2M2LT3-Lane1-2/ -name "*.fastq.gz" -exec ln -s {} Pool1_fastq_symlinks \;

\# Pool 2
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool2-10B-22N2M2LT3-Lane3-4/ -name "*.fastq.gz" -exec ln -s {} Pool2_fastq_symlinks \;

\# Pool 3
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool3-10B-22N2M2LT3-Lane5-6/ -name "*.fastq.gz" -exec ln -s {} Pool3_fastq_symlinks \;

\# Pool 4
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool4-10B-22N2M2LT3-Lane7-8/ -name "*.fastq.gz" -exec ln -s {} Pool4_fastq_symlinks \;
\```

\## Running the Pipeline

\### 1. Test the pipeline

If you specify too few or too many threads, the process will quit. First, test the pipeline by running it interactively, then kill the process, and run it again with the correct number of threads:

\```bash
srundev --mem=40gb --ntasks=1 --cpus-per-task=8 --time=01:00:00
\```

\### 2. Load the module and run the pipeline

\```bash
module load geomxngspipeline/3.1.1.5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
geomxngspipeline --in=path/to/fastq --out=path/to/output --ini=path/to/config/file --threads=8
\```

\### 3. Adjust the threads in the `.ini` file

Edit the `threads` line in the `.ini` file to match the number recommended by the pipeline after your test run.

\### 4. Run the SBATCH script

Submit the SBATCH script to run the pipeline on the cluster.

\## Post-run Checks

After the pipeline finishes, run the following checks to verify the outputs:

\```bash
check_outputs.bash > check_outputs.txt
\```

