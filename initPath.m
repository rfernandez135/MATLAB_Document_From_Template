%%
%
% Author: Robert Fernandez
% Date Created:04/18/2025
% File Name: initPath.m
% Developed in MATLAB version:(R2017a)
% Purpose: Initializes paths necessary to run MATLAB Template Generator
% 
%% Inputs
%
% # N/A
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
function initPath


path2Repo = fileparts(mfilename('fullpath'));
addpath(genpath(path2Repo));



end %end initPath.m



