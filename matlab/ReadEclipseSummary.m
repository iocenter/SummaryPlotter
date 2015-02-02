function [ output_data ] = ReadEclipseSummary( name )

% READECLIPSESUMMARY Reads Eclipse summary file using
% MRSTs functions found in deckformat module

%   Uses MRST functions:
%   readRestartLocal.m, readSummaryLocal.m, 
%   readEclipseOutputFileUnFmt.m, and 
%   readEclipseOutputFileUnFmt to read 
%   Eclipse output data files
% 
%   [/mrst-2014a/modules/ad-fi/ecl]:
%   readRestartLocal.m, readSummaryLocal.m, 
% 
%   [/mrst-2014a/modules/deckformat/resultinput]:
%   readEclipseOutputFileUnFmt.m, readEclipseOutputFileUnFmt
% 
%   Selects subset of data fields from raw data, and
%   reorganizes these fields into a matlab structure 
%   variable
%
%   Input is the Eclipse file name without extension
%   Outputs matlab structure variable: output_data
% 
% Reload Eclipse test data:
% cd ~/WORK-3/D-WRKS-A/WplcOpt_PSO_MJ/models\
% /60x60_CGpaper_5_well_model/eclipse
% cp *.EGRID *.INIT *.RSSPEC *.SMSPEC *.UNRST *.UNSMRY\
%  /home/bellout/git/SummaryPlotter/test_data


%%
% ========================================================
% Read Eclipse output data using MRST functions

[rstrt, rsspec] = readRestartLocal(name);
[smry, smspec]  = readSummaryLocal(name);
init = readEclipseOutputFileUnFmt([name '.INIT']);
grd  = readEclipseOutputFileUnFmt([name '.EGRID']);

debug_output = true;

%%
% ========================================================
% Reorganize into structure variable (VOLUMES)

% --------------------------------------------------------
% For debugging purposes:
frmt = repmat([ repmat('%10.20s \t', 1, 4) '\n' ], 1, 12);
fprintf(['CURRENT KEYWORDS:\n' frmt '\n\n' ], ...
    smry.KEYWORDS{:});

% --------------------------------------------------------
% Read these field volume keywords
volume_name  = 'VOLUMES';
volume_keywords = {'FGIP'  'FGIPG' 'FGIPL' 'FOIP' ...
                   'FOIPG' 'FOIPL' 'FWIP'};

for key_num = 1 : length(volume_keywords)
    
    key_index = strcmp(smry.KEYWORDS, volume_keywords{key_num});
    
    if any(key_index)
        
        keyword  = smry.KEYWORDS{ key_index };
        keyspace = smry.getNms(keyword);
        
        vals = smry.get(keyspace, keyword,:);
        evalIn = [volume_name '.' volume_keywords{key_num} ' = vals;'];
        
    else
        
        evalIn = [volume_name '.' volume_keywords{key_num} ' = 0;'];
    
    end
    
    eval(evalIn);    
    
end

% --------------------------------------------------------
% For debugging purposes:
if debug_output
fprintf('\n\n')
fprintf('FGIP  = %9.3E : GAS INIT IN PLACE\n', ...
    max(VOLUMES.FGIP));
fprintf('FGIPG = %9.3E : GAS INIT IN PLACE (GAS PHASE)\n', ...
    max(VOLUMES.FGIPG));
fprintf('FGIPL = %9.3E : GAS INIT IN PLACE (LIQUID PHASE)\n', ...
    max(VOLUMES.FGIPL));
fprintf('FOIP  = %9.3E : OIL INIT IN PLACE\n', ...
    max(VOLUMES.FOIP));
fprintf('FOIPG = %9.3E : OIL INIT IN PLACE (GAS PHASE)\n', ...
    max(VOLUMES.FOIPG));
fprintf('FOIPL = %9.3E : OIL INIT IN PLACE (LIQUID PHASE)\n', ...
    max(VOLUMES.FOIPL));
fprintf('FWIP  = %9.3E : WATER INITIALLY IN PLACE\n', ...
    max(VOLUMES.FWIP));
end

%%
% ========================================================
% Reorganize into structure variable (FIELD)

% --------------------------------------------------------
% Read field production keywords
field_name = 'FIELD';
field_keywords = {...
    'TIME' 'FPR'  'FGPR' 'FOPR' 'FWPR' ...
    'FLPR' 'FGPT' 'FOPT' 'FWPT' 'FLPT' ...
    'FOE' };

for key_num = 1 : length(field_keywords)
    
    if debug_output
    fprintf('READING %s ... ', field_keywords{key_num});
    end
    
    key_index = strcmp(smry.KEYWORDS, field_keywords{key_num});
    
    if any(key_index)
        
        keyword  = smry.KEYWORDS{ key_index };
        keyspace = smry.getNms(keyword);
       
        if debug_output
        fprintf('(%s/%s) ... ', keyword, keyspace{1});
        end
    
        vals = smry.get(keyspace, keyword,:);
        evalIn = [ field_name '.' field_keywords{key_num} ' = vals;' ];
    
    else
    
        % MSG
        fprintf('KYWRD NOT FOUND');         
        evalIn = [ field_name '.' field_keywords{key_num} ' = 0;' ];
        
    end
    
    eval( evalIn );
    
    if strcmp(field_keywords{ key_num }, 'FPR')
        
        evalIn = [ field_name '.FPRH = vals;' ];
        eval( evalIn );
        
    end
    
    fprintf('\n');
    
    if rem(key_num, 10) == 0
        
        fprintf('\n');
        
    end

end

% ========================================================
% Reorganize into structure variable (WELL)
%%
% --------------------------------------------------------
% Read well production keywords   
well_names = or(strncmp(smry.WGNAMES,'I',1), ...
                strncmp(smry.WGNAMES,'P',1));
WELLS.WNMS = smry.WGNAMES(well_names);

well_keywords = { ...
    'TIME' 'TIMESTEP' 'WGPR' 'WOPR' 'WWPR' 'WLPR' ...
    'WBHP' 'WTHP'     'WGPT' 'WOPT' 'WWPT' 'WLPT' ...
    'WWCT'};

valsz = size(smry.get(smry.getNms('TIME'),'TIME',:)'); %#ok<*NASGU>

for iwell = 1 : size(WELLS.WNMS, 1)
    
    well_name  = WELLS.WNMS{ iwell };
    
    fprintf('\nWELL NUM %d, WELL NAME: %s \n', iwell, well_name);
    fprintf('============================\n')

    for key_num = 1 : length( well_keywords )
        
        key_index = strcmp(smry.KEYWORDS, well_keywords{ key_num });
        fprintf('READING KYWRD %s ... ', well_keywords{ key_num });       
        
        if any(key_index)
        
            keyword  = smry.KEYWORDS{ key_index };
            keyspace = smry.getNms(keyword);
            keymatch = strcmp(well_name, keyspace);
            
            if any(keymatch)
                
                vals = smry.get(keyspace(keymatch), keyword,:)';
                vals = vals(:, 1);
                
                % MSG
                fprintf('%s (SZ.VALS %d %d)', ...
                    keyspace{keymatch}, size(vals));
            
                evalIn = ['WELLS.' well_keywords{ key_num } ...
                '(1:length(vals), iwell) = vals;'];
            
            else
               
                % MSG
                fprintf('NO %s FOR %s', keyword, well_name);                
                evalIn = ['WELLS.' well_keywords{ key_num } ...
                    ' = zeros(valsz(1),1);'];
                
            end
            
        else

            % MSG
            fprintf('KYWRD NOT FOUND');
            evalIn = ['WELLS.' well_keywords{key_num} ' = 0;'];

        end        

        eval(evalIn);
        fprintf('\n')
        
    end
    
end

% ========================================================
% Reorganize into structure variable ()
%%
% --------------------------------------------------------
% Read well production keywords   

% ========================================================
% Reorganize into structure variable: output_data
output_data.WELLS   = WELLS;
output_data.FIELD   = FIELD;
output_data.VOLUMES = VOLUMES;

end

