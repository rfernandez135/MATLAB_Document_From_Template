%%
% 
% Author: Robert Fernandez
% Date Created: 03/29/2025
% File Name: templatePicker.m
% Developed in MATLAB version:(R2017a)
% Purpose: Choose template file to load and open a new document using
% the template.
% 
%% Inputs
%
% # N/A
%
%
%% Outputs
% #
%
%
%% Notes
% #
%
%
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % %


%% Begin function
function templatePicker

fileExtRegexArray = {'*.m;','MATLAB Template Files (*.m)'};
defaultTemplatePath = getenv('DEFAULT_MATLAB_TEMPLATE_PATH');

if defaultTemplatePath==""
    setupTemplateEnv
end


[templateName,path2Template,filterIndex] = uigetfile(fileExtRegexArray,'Pick Template File to Load',defaultTemplatePath);
outTemp = string(fullfile(path2Template,templateName));

% If user presses cancel when picking file, exit function.
if filterIndex == 0
    return
end

try
    [fid,msg] = fopen(outTemp,'r');
    if fid == -1
        error(msg)
    else
        content = textscan(fid,'%s','EndOfLine',newline,'Delimiter',newline);
        content = content{1};
        content = [content{1:end}];
        matlab.desktop.editor.newDocument(content);
        fclose(fid);
    end
catch ME
    % Display error alert to user if file cannot be opened
    if fid ~= -1
        fclose(fid);
    end
    errorFig = uifigure;
    errorMessage = ['Template file cannot be opened or read for the following reason: ',ME.message];
    uialert(errorFig,errorMessage,'Unable to open or read template file')
    
end



end %end templatePicker.m



