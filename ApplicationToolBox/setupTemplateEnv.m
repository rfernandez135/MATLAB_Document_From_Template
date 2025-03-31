%%
%
% Author: Robert Fernandez
% Date Created: 03/30/2025
% File Name: setupTemplateEnv.m
% Developed in MATLAB version: (2017a)
% Purpose: set-up environment needed for running template loader.
% 
%% Inputs
%
% # default_path(str,optional): default path to folder that is storing
% template files.
%
%
%% Outputs
% # N/A
%
%
%% Notes
% #
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


%% Begin function
function setupTemplateEnv(default_path)

% Assumes this file is saved in folder one level below the top level folder
% of repo.
if nargin < 1
    % Check if default template path is saved from previous call.
    path2storageFile = fullfile(fileparts(mfilename('fullpath')),'default_path_storage.txt');
    if exist(path2storageFile,'file')
        try
            fid = fopen(path2storageFile,'r');
            default_path = fgetl(fid);
            fclose(fid);
        catch
            warning('Could not open default_path_storage.txt. Setting template directory to default')
            default_path = fullfile(fileparts(fileparts(mfilename('fullpath'))),'TemplateFiles');

        end
    else
        default_path = fullfile(fileparts(fileparts(mfilename('fullpath'))),'TemplateFiles');        
    end
    
   
else
    path2storageFile = fullfile(fileparts(mfilename('fullpath')),'default_path_storage.txt');    
    fid = fopen(path2storageFile,'w');
    fprintf(fid,default_path);
    fclose(fid);
end

setenv('DEFAULT_MATLAB_TEMPLATE_PATH',default_path);





end %end setupTemplateEnv.m



