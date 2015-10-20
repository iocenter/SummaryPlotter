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

mdata = size(summary_name_path, 2) == 1;

if mdata

    summary_data =  MakeSinglePlots(summary_file_path, ...
        ext, summary_name_path);

else
    
    summary_data = MakeMultiplePlots(summary_file_path, ...
        ext, summary_name_path);

end 

end % end function



function summary_data = MakeMultiplePlots(...
    summary_file_path, ext, summary_name_path)

summary_data = {};

% Saved data
if strcmp(ext, { 'mat' 'UNSMRY' })

    % {1} Read MRST files 
    fprintf('Reading %s.\n', ext{1});
    summary_data{1} = load(summary_file_path{1});

    % {2} Read Eclipse summary files
    fprintf('Reading %s.\n', ext{2});
    summary_data{2} = ReadEclipseSummary(summary_name_path{2});    
    
% Read Eclipse summary file
elseif strcmp(ext, { 'H5' 'UNSMRY' })

    % {1} Read ADGPRS
    fprintf('Reading %s.\n', ext{1});
    summary_data{1} = ReadAdgprsSummary(summary_name_path{1});

    % {2} Read Eclipse summary files
    fprintf('Reading %s.\n', ext{2});
    summary_data{2} = ReadEclipseSummary(summary_name_path{2});

% Catch exception    
else
    fprintf([ 'File extensions/formats not '...
        'reconized. The allowed extensions ' ...
        'are .mat, .UNSMRY and .H5\' ])
end

end % end function




function MakeSinglePlots(summary_file_path, ...
    ext, summary_name_path)

% Saved data
if strcmp(ext, 'mat')
    fprintf('Reading saved matlab variable (*.mat).\n');
    summary_data = load(summary_file_path);
    
% Read Eclipse summary file
elseif strcmp(ext, 'UNSMRY')
    
    % Read Eclipse summary files
    summary_data = ReadEclipseSummary(summary_name_path);
    
% Read AD-GPRS summary file    
elseif strcmp(ext, 'H5')
    
    summary_data = ReadAdgprsSummary(summary_name_path);
    
% Catch exception    
else
    fprintf([ 'File extensions/formats not '...
        'reconized. The allowed extensions ' ...
        'are .mat, .UNSMRY and .H5\' ])
end

end % end function
