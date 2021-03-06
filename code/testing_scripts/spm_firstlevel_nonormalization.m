% This batch script analyses the Face fMRI dataset available from the SPM site:
% http://www.fil.ion.ucl.ac.uk/spm/data/face_rep/face_rep_SPM5.html
% as described in the manual Chapter 29.

% Copyright (C) 2008 Wellcome Trust Centre for Neuroimaging

% Guillaume Flandin
% $Id: face_repetition_single_spm5_batch.m 30 2008-05-20 11:16:55Z guillaume $

%% Path containing data
%--------------------------------------------------------------------------

clear all
clc
close all

tic

if ispc
    addpath('C:\spm8')
    data_path = 'C:\OpenfMRI\RhymeJudgment\ds003\sub001\';
    results_directory = '/data/andek/BROCCOLI_test_data/SPM/';
elseif isunix
    addpath('/data/andek/spm8/')
    data_path = '/data/andek/BROCCOLI_test_data/Cambridge/';
    %results_directory = '/data/andek/BROCCOLI_test_data/SPM/segment/';
    results_directory = '/data/andek/BROCCOLI_test_data/SPM/temp/';
end

%% Initialise SPM defaults
%--------------------------------------------------------------------------
spm('Defaults','fMRI');

spm_jobman('initcfg'); % SPM8 only

%% WORKING DIRECTORY (useful for .ps only)
%--------------------------------------------------------------------------
clear jobs
jobs{1}.util{1}.cdir.directory = cellstr(data_path);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SPATIAL PREPROCESSING
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% REALIGN (motion correction)
%--------------------------------------------------------------------------

% Gives rbold.nii
filename = [data_path 'BOLD/task001_run001/bold.nii'];
jobs{2}.spatial{1}.realign{1}.estwrite.data{1} = cellstr(filename);

%% SLICE TIMING CORRECTION
%--------------------------------------------------------------------------

% Gives arbold.nii
jobs{3}.temporal{1}.st.scans = {
    {
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,1'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,2'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,3'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,4'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,5'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,6'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,7'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,8'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,9'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,10'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,11'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,12'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,13'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,14'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,15'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,16'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,17'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,18'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,19'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,20'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,21'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,22'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,23'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,24'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,25'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,26'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,27'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,28'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,29'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,30'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,31'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,32'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,33'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,34'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,35'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,36'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,37'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,38'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,39'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,40'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,41'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,42'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,43'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,44'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,45'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,46'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,47'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,48'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,49'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,50'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,51'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,52'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,53'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,54'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,55'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,56'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,57'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,58'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,59'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,60'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,61'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,62'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,63'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,64'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,65'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,66'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,67'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,68'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,69'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,70'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,71'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,72'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,73'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,74'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,75'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,76'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,77'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,78'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,79'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,80'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,81'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,82'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,83'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,84'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,85'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,86'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,87'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,88'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,89'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,90'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,91'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,92'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,93'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,94'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,95'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,96'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,97'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,98'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,99'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,100'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,101'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,102'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,103'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,104'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,105'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,106'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,107'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,108'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,109'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,110'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,111'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,112'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,113'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,114'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,115'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,116'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,117'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,118'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,119'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,120'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,121'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,122'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,123'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,124'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,125'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,126'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,127'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,128'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,129'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,130'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,131'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,132'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,133'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,134'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,135'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,136'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,137'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,138'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,139'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,140'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,141'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,142'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,143'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,144'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,145'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,146'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,147'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,148'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,149'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,150'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,151'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,152'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,153'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,154'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,155'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,156'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,157'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,158'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,159'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\rbold.nii,160'
    }
    }';

jobs{3}.temporal{1}.st.nslices = 33;
jobs{3}.temporal{1}.st.tr = 2;
jobs{3}.temporal{1}.st.ta = 2-2/33;
jobs{3}.temporal{1}.st.so = 33:-1:1;
jobs{3}.temporal{1}.st.refslice = 17;
jobs{3}.temporal{1}.st.prefix = 'a';

%% SMOOTHING
%--------------------------------------------------------------------------

filename = [data_path 'BOLD/task001_run001/arbold.nii'];
jobs{4}.spatial{1}.smooth.data = cellstr(filename);
jobs{4}.spatial{1}.smooth.fwhm = [6 6 6];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% RUN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
save('batch_preprocessing.mat','jobs');
% %spm_jobman('interactive',jobs);
spm_jobman('run',jobs);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CLASSICAL STATISTICAL ANALYSIS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

spm_file = 'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\classical\SPM.mat';
if exist(spm_file,'file')==2
    %system(['rm' spm_file]); % Linux
    delete(spm_file)
end

clear jobs
jobs{1}.util{1}.cdir.directory = cellstr(data_path);
jobs{1}.util{1}.md.basedir = cellstr(data_path);
jobs{1}.util{1}.md.name = 'classical';

%% MODEL SPECIFICATION AND ESTIMATION
%--------------------------------------------------------------------------
data_path = 'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\classical\';
filename = [data_path ];
jobs{2}.stats{1}.fmri_spec.dir = cellstr(filename);
jobs{2}.stats{1}.fmri_spec.timing.units = 'secs';
jobs{2}.stats{1}.fmri_spec.timing.RT = 2;

scans = {
    {
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,1'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,2'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,3'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,4'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,5'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,6'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,7'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,8'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,9'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,10'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,11'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,12'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,13'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,14'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,15'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,16'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,17'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,18'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,19'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,20'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,21'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,22'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,23'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,24'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,25'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,26'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,27'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,28'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,29'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,30'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,31'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,32'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,33'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,34'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,35'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,36'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,37'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,38'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,39'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,40'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,41'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,42'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,43'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,44'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,45'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,46'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,47'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,48'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,49'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,50'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,51'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,52'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,53'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,54'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,55'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,56'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,57'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,58'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,59'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,60'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,61'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,62'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,63'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,64'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,65'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,66'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,67'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,68'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,69'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,70'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,71'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,72'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,73'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,74'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,75'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,76'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,77'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,78'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,79'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,80'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,81'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,82'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,83'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,84'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,85'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,86'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,87'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,88'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,89'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,90'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,91'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,92'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,93'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,94'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,95'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,96'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,97'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,98'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,99'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,100'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,101'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,102'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,103'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,104'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,105'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,106'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,107'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,108'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,109'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,110'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,111'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,112'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,113'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,114'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,115'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,116'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,117'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,118'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,119'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,120'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,121'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,122'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,123'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,124'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,125'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,126'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,127'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,128'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,129'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,130'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,131'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,132'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,133'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,134'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,135'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,136'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,137'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,138'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,139'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,140'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,141'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,142'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,143'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,144'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,145'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,146'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,147'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,148'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,149'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,150'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,151'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,152'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,153'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,154'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,155'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,156'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,157'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,158'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,159'
    'C:\OpenfMRI\RhymeJudgment\ds003\sub001\BOLD\task001_run001\sarbold.nii,160'
    }
    }';

jobs{2}.stats{1}.fmri_spec.sess.scans = scans{1};
jobs{2}.stats{1}.fmri_spec.sess.cond(1).name = 'task1';
jobs{2}.stats{1}.fmri_spec.sess.cond(1).onset = [20.001 22.501	25.001 27.501 30.001 32.501 35.001 37.501 60.002 62.502	65.002 67.502 70.002 72.502	75.002 77.503 100.003 102.503 105.003 107.503 110.004 112.504 115.004 117.504 140.004 142.504 145.005 147.505 150.005 152.505 155.005 157.505];
jobs{2}.stats{1}.fmri_spec.sess.cond(1).duration = 2;

jobs{2}.stats{1}.fmri_spec.sess.cond(2).name = 'task2';
jobs{2}.stats{1}.fmri_spec.sess.cond(2).onset = [180.006 182.506 185.006 187.506 190.006 192.506 195.006 197.507 220.007 222.507 225.007 227.507 230.007 232.508 235.008 237.508 260.008 262.508 265.009 267.509 270.009 272.509 275.009 277.509 300.010 302.510 305.010 307.510 310.010 312.510 315.010 317.510];
jobs{2}.stats{1}.fmri_spec.sess.cond(2).duration = 2;

data_path2 = 'C:\OpenfMRI\RhymeJudgment\ds003\sub001\';
jobs{2}.stats{1}.fmri_spec.sess.multi_reg = {[data_path2 'BOLD/task001_run001/rp_bold.txt']};
jobs{2}.stats{1}.fmri_spec.bases.hrf.derivs = [1 0];

filename = [data_path 'SPM.mat'];
jobs{2}.stats{2}.fmri_est.spmmat = cellstr(filename);

filename = [data_path 'SPM.mat'];
jobs{2}.stats{3}.con.spmmat = cellstr(filename);
jobs{2}.stats{3}.con.consess{1}.tcon = struct('name','task1','convec', 1,'sessrep','none');

filename = [data_path 'SPM.mat'];
jobs{2}.stats{4}.results.spmmat = cellstr(filename);
jobs{2}.stats{4}.results.conspec.contrasts = Inf;
jobs{2}.stats{4}.results.conspec.threshdesc = 'none';
jobs{2}.stats{4}.results.conspec.thresh = 1e-6; % for cluster based threshold
jobs{2}.stats{4}.results.conspec.extent = 0;

save('batch_analysis.mat','jobs');
spm_jobman('run',jobs);

toc
