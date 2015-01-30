function [ file_path, folder_path, file_name, name, ext ] = ...
    GetMRSTPath()
%GETMRSTPATH Get MRST path
%   Asks the user to find startup.m in their MRST directory
%   through a uigetfile window.
%   Returns the full file path, as well as the folder path, 
%   file name and extension in separate variables.
%
%   At the end of the function, the created variables contain
%   the following:
% 
%   * file_path: Contains the full path to the file.
%     Example: 
%     /work/bellout/WORK-3/D-WRKS-A/tools/mrst-2014a/startup.m
% 
%   * file_name: The file name, including extension.
%     Example: startup.m
% 
%   * folder_path: The path to the directory containing the file.
%     Example: 
%     /work/bellout/WORK-3/D-WRKS-A/tools/mrst-2014a

%   * name: The name of the file, excluding extension.
%     Example: startup

%   * ext: The file extension.
%     Example: .m

fprintf('Please select startup.m file in MRST directory.\n');
[file_name, folder_path, ~] = uigetfile( ...
    {'*.m'},'Select startup.m file');

if file_name == 0
    
    file_path = '/work/bellout/WORK-3/D-WRKS-A/tools/mrst-2014a/startup.m';
    file_name = 'startup.m';
    folder_path = '/work/bellout/WORK-3/D-WRKS-A/tools/mrst-2014a';
    name = 'startup';
    ext = 'm';
    
else
    
    C = strsplit(file_name, '.');
    name = C{1};
    ext = C{2};
    file_path = strcat(folder_path, file_name);

end

end

