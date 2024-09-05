# NanostringNGS
#Copy configuration files to the config files folder config_files

#make symlinks for fastq file paths because geomxngspipeline wants them in one dir and they're not
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool1-10B-22N2M2LT3-Lane1-2/ -name "*.fastq.gz" -exec ln -s {} Pool
1_fastq_symlinks \;
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool2-10B-22N2M2LT3-Lane3-4/ -name "*.fastq.gz" -exec ln -s {} Pool
2_fastq_symlinks \;
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool3-10B-22N2M2LT3-Lane5-6/ -name "*.fastq.gz" -exec ln -s {} Pool
3_fastq_symlinks \;
find /orange/timgarrett/Mathews/GE7647/GE7647-CMathews/GE-7647-CMathews-Pool4-10B-22N2M2LT3-Lane7-8/ -name "*.fastq.gz" -exec ln -s {} Pool
4_fastq_symlinks \;

#Run the pipeline
#If you specify too few or too many threads, it will quit because it needs interactive adjustment. Test first, then kill the process, then 
run with the correct number.
srundev --mem=40gb --ntasks=1 --cpus-per-task=8 --time=01:00:00

module load geomxngspipeline/3.1.1.5
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1
geomxngspipeline --in=path/to/fastq --out=path/to/output --ini=path/to/config/file --threads=8

#Edit the threads line in the *ini file to match what it said was best

#Run the sbatch script

#Run some checks
check_outputs.bash > check_outputs.txt
