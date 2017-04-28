%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 3599 $)
%-----------------------------------------------------------------------
clear all; close all; clc
cd /Users/danielkoo/Documents/DATA/Batches

n_img = 84; % number of images to be realigned

% need to modify scripts for different hands used
% for children (filename structure requires changing %s values to 49 and 50)
load 1_Realign_IR_DA_Batch.mat
subjlist = [11732	27527	28197	44153	48868	55075	62904	65908	70548	72525	73138	73320	74345	74732	77636	86684	93644];
%subjlist = ['4'; '5'; '6'; '8'; '9'; '10'; '11'; '12'; '14'; '18'; '20'; '22']; 

% for adults (filename structure requires changing %s values to 47 and 48)
% load 1Realign_a01R.mat
% subjlist = ['01'; '02'; '03'; '04'; '05'; '07'; '08'; '09'; '10'; '11'; '12'; '13'; '14'; '15'; '16'; '17'];
matlabbatch = repmat(matlabbatch,1,length(subjlist));

for j = 1:length(subjlist);
              
%              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.stats.fmri_spec.dir{1,1},''SVM4'',''SVM%d'');',j,subjlist(j)));
%              eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.dir{1,1} = k;',j));
%              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.stats.fmri_spec.sess(1).multi_reg{1,1},''SVM4'',''SVM%d'');',j,subjlist(j)));
%              eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(1).multi_reg{1,1} = k;',j));
%              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1},''SVM4'',''SVM%d'');',j,subjlist(j)));
%              eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1} = k;',j));
             %eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(1).multi_reg{1,1}(58) = ''%d'';',j,subjlist(j)));
%             eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1}(58) = ''%d'';',j,subjlist(j)));
             for g = 1:n_img;
                    eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.spatial.realign.estwrite.data{1,1}{%d,1},''11732'',''%d'');',j,g,subjlist(j)));
                    eval(sprintf('matlabbatch{1,%d}.spm.spatial.realign.estwrite.data{1,1}{%d,1} = k;',j,g));
                    eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.spatial.realign.estwrite.data{1,2}{%d,1},''11732'',''%d'');',j,g,subjlist(j)));
                    eval(sprintf('matlabbatch{1,%d}.spm.spatial.realign.estwrite.data{1,2}{%d,1} = k;',j,g));
%                 eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(1).scans{%d,1}(58) = ''%d'';',j,g,subjlist(j)));
%                 eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).scans{%d,1}(58) = ''%d'';',j,g,subjlist(j)));
             end
end

save 1_Realign_IR_DA_All.mat matlabbatch