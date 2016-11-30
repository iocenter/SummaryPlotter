function summary_data  = ReadSummaryData(...
    summary_file_path, summary_name_path, ext)

%% READSUMMARYDATA Either reads simulation data saved in mat
% file, or reads this data from summary files
% 
% Uses functions:
% 
%    GetMRSTPath: 
%    input: none
%    ouput: mrst_file_path, mrst_folder_path
%    
%    ReadEclipseSummary:
%    input: name
%    output: summary_data
% 
%    ReadAdgprsSummary:
%    input: name
%    output: summary_data

%% Load/read data based on extension of file

% Saved data
if strcmp(ext, 'mat')
    fprintf('Reading saved matlab variable (*.mat).\n');
    summary_data = load(summary_file_path);
    
% Read Eclipse summary file
elseif strcmp(ext, 'UNSMRY')
    
    fprintf([ 'Using MRST libraries to read '...
        'Eclipse summary file (*.UNSMRY).\n' ]);
    
    % Load mrst libraries if not already loaded
    if exist('readEclipseOutputFileUnFmt', 'file') == 0
    
        fprintf('Path to MRST libraries not found.\n');
        
        [ mrst_file_path, mrst_folder_path, ~, ~, ~ ] = ...
        GetMRSTPath();
    
        fprintf('MRST libraries found in: %s\n', mrst_folder_path);
        
        run(mrst_file_path);
        
        fprintf('Adding ad-fi and deckformat modules...\n');
        
        mrstModule add ad-fi deckformat
        
    end
    
    % Read Eclipse summary files
    summary_data = ReadEclipseSummary(summary_name_path);
    
    
% Read AD-GPRS summary file    
elseif strcmp(ext, 'H5')
    
    summary_data = ReadAdgprsSummary(summary_name_path);
    
% Catch exception    
else
    fprintf([ 'File extension/format not '...
        'reconized. The allowed extensions' ])
    fprintf('are .mat, .UNSMRY and .H5\');
end


