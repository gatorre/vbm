%-----------------------------------------------------------------------
% Job configuration created by cfg_util (rev $Rev: 3599 $)
%-----------------------------------------------------------------------
clear all; close all; clcexit
cd /Volumes/GT/PedMRI07202016/PreProcData2

n_img = 281; % number of images to be realigned

% need to modify scripts for different hands used
% for children (filename structure requires changing %s values to 49 and 50)
load 1.Preproc-Coreg.mat
subjlist = ['ped_001'; 'ped_002'; 'ped_004'; 'ped_005'; 'ped_006'; 'ped_007'; 'ped_009'; 'ped_011'; 'ped_013'; 'ped_014'; 'ped_015'; 'ped_016'; 'ped_017'; 'ped_018'; 'ped_019'; 'ped_021';  
    'ped_022'; 'ped_023'; 'ped_024'; 'ped_025'; 'ped_026'; 'ped_030'; 'ped_031'; 'ped_032'; 'ped_033'; 'ped_038'; 'ped_041'; 'ped_042'; 'ped_044'; 'ped_047'; 'ped_049'; 'ped_054'; 'ped_058'; 'ped_060';  
    'ped_061'; 'ped_064'; 'ped_066'; 'ped_067'; 'ped_068'; 'ped_069'; 'ped_071'; 'ped_072'; 'ped_074'; 'ped_075'; 'ped_076'; 'ped_077'; 'ped_078'; 'ped_079'; 'ped_080'; 'ped_082'; 'ped_084'; 'ped_085';  
    'ped_086'; 'ped_088'; 'ped_089'; 'ped_090'; 'ped_092'; 'ped_094'; 'ped_095'; 'ped_096'; 'ped_097'; 'ped_099'; 'ped_100'; ];

%subjlist = ['4'; '5'; '6'; '8'; '9'; '10'; '11'; '12'; '14'; '18'; '20'; '22']; 

% for adults (filename structure requires changing %s values to 47 and 48)
% load 1Realign_a01R.mat
% subjlist = ['01'; '02'; '03'; '04'; '05'; '07'; '08'; '09'; '10'; '11'; '12'; '13'; '14'; '15'; '16'; '17'];
matlabbatch = repmat(matlabbatch,1,length(subjlist));

for j = 1:length(subjlist);
              
              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.spatial.coreg.estimate.ref{1,1},''ped_001'',''%s'');',j,subjlist(j,:)));
              eval(sprintf('matlabbatch{1,%d}.spm.spatial.coreg.estimate.ref{1,1} = k;',j));
              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.spatial.coreg.estimate.source{1,1},''ped_001'',''%s'');',j,subjlist(j,:)));
              eval(sprintf('matlabbatch{1,%d}.spm.spatial.coreg.estimate.source{1,1} = k;',j));
%              eval(sprintf('k= strrep(matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1},''SVM4'',''SVM%d'');',j,subjlist(j)));
%              eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1} = k;',j));
             %eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(1).multi_reg{1,1}(58) = ''%d'';',j,subjlist(j)));
%             eval(sprintf('matlabbatch{1,%d}.spm.stats.fmri_spec.sess(2).multi_reg{1,1}(58) = ''%d'';',j,subjlist(j)));
             
end

save 4.PreprocCoreg_GT.mat matlabbatch