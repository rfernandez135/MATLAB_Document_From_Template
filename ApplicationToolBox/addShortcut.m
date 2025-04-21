%%
%
% Author: Robert Fernandez
% Date Created:04/18/2025
% File Name: addShortcut.m
% Developed in MATLAB version:(R2017a)
% Purpose: Adds shortcut for using template picker
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
function addShortcut

    matVer = ver('matlab');
    matVer = regexprep(matVer.Release,'[()]','');
    pathToTemplatePicker = fileparts(mfilename('fullpath'));
    
    % Direct shortcut manipulation functionality did not come out until
    % R2018a. Adding shortcut will be completed based off matlab version.
    
    switch matVer
        case 'R2017a'
            addShortcut2017a(pathToTemplatePicker);
    end
    
           
    
end %end addShortcut.m


%% Start Local Functions
function addShortcut2017a(pathToTemplatePicker)
    % Define shortcut content
    shortcutName = 'Load New Doc From Template';
    shortcutCommand = ['addpath(genpath(''',pathToTemplatePicker,'''));','templatePicker'];
    shortcutHelp = 'Create a new file using custom template';

    % Define the path to the XML file
    shortcutFile = fullfile(prefdir, 'shortcuts_2.xml');
    
    % Read existing content
    if exist(shortcutFile, 'file')
        xmlText = fileread(shortcutFile);
    else
        xmlText = '<FAVORITE></FAVORITE>';
    end

    % Check if shortcut already exists
    if contains(xmlText, shortcutName)
        disp('Shortcut already exists.');
        return;
    end

    % Define shortcut XML snippet
    shortcutEntry = sprintf([...
        '<FAVORITE>\n' ...
        '  <label>%s</label>\n' ...
        '  <callback>%s</callback>\n' ...
        '  <icon>Upper Case T</icon>\n' ...
        '  <help>%s</help>\n' ...
        '  <editable>true</editable>\n'...
        '</FAVORITE>\n'], ...
        shortcutName, shortcutCommand, shortcutHelp);

    % Insert new shortcut before </shortcuts>
    updatedXml = strrep(xmlText, '</FAVORITESROOT>', [shortcutEntry '</FAVORITESROOT>']);

    % Write updated XML
    fid = fopen(shortcutFile, 'w');
    fwrite(fid, updatedXml);
    fclose(fid);
    fprintf('Shortcut "%s" added. Restart MATLAB to see it.\n', shortcutName);
    
end










