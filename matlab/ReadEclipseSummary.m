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

% ========================================================
% Read Eclipse output data using MRST functions

[rstrt, rsspec] = readRestartLocal(name);
[smry, smspec]  = readSummaryLocal(name);
init = readEclipseOutputFileUnFmt([name '.INIT']);
grd  = readEclipseOutputFileUnFmt([name '.EGRID']);

% ========================================================
% Reorganize into structure variable (FIELD VOLUMES)

% --------------------------------------------------------
% For debugging purposes:
frmt = repmat([ repmat('%10.20s \t', 1, 4) '\n' ], 1, 12);
fprintf(['CURRENT KEYWORDS:\n' frmt '\n\n' ], smry.KEYWORDS{:});

% --------------------------------------------------------
% Read these field volume keywords
nm  = 'FIELD';
kwd = {'FGIP' 'FGIPG' 'FGIPL' 'FOIP' 'FOIPG' 'FOIPL' 'FOIP' 'FWIP'};

for key = 1 : length(kwd)
    
    indx = strcmp(smry.KEYWORDS, kwd{key});
    
    if any(indx)
        
        vals = smry.get(nm,smry.KEYWORDS{indx},:);
        evalIn = ['VOLUMES.' kwd{key} ' = vals;'];
        
    else
        
        evalIn = ['VOLUMES.' kwd{key} ' = 0;'];
    
    end
    
    eval(evalIn);    
    
end

% --------------------------------------------------------
% For debugging purposes:
fprintf('FGIP  = %9.3E : GAS INITIALLY IN PLACE\n', max(VOLUMES.FGIP));
fprintf('FGIPG = %9.3E : GAS INITIALLY IN PLACE, GAS PHASE\n', max(VOLUMES.FGIPG));
fprintf('FGIPL = %9.3E : GAS INITIALLY IN PLACE, LIQUID PHASE\n', max(VOLUMES.FGIPL));
fprintf('FOIP  = %9.3E : OIL INITIALLY IN PLACE\n', max(VOLUMES.FOIP));
fprintf('FOIPG = %9.3E : OIL INITIALLY IN PLACE, GAS PHASE\n', max(VOLUMES.FOIPG));
fprintf('FOIPL = %9.3E : OIL INITIALLY IN PLACE, LIQUID PHASE\n', max(VOLUMES.FOIPL));
fprintf('FWIP  = %9.3E : WATER INITIALLY IN PLACE\n', max(VOLUMES.FWIP));

% ========================================================
% Reorganize into structure variable (FIELD PRODUCTION)

% --------------------------------------------------------
% Read field production keywords
nm  = 'FIELD';
kwd = {'TIME' 'FPR'  'FGPR' 'FOPR' 'FWPR' ...
       'FLPR' 'FGPT' 'FOPT' 'FWPT' 'FLPT'};

for key = 1 : length(kwd)
    
    % Debug:
    % fprintf('%s ... ', kwd{key});
    
    indx = strcmp(smry.KEYWORDS, kwd{key});
    
    if any(indx)
        
        vals = smry.get(nm,smry.KEYWORDS{indx},:);
        evalIn = ['FIELD.' kwd{key} ' = vals;'];
    
    else
    
        evalIn = ['FIELD.' kwd{key} ' = 0;'];
        
    end
    
    eval( evalIn );
    
    if strcmp(kwd{ key }, 'FPR')
        
        evalIn = 'FIELD.FPRH = vals;';
        eval( evalIn );
        
    end
    
    if rem(key, 10) == 0
        
        fprintf('\n');
        
    end
end

% ========================================================
% Reorganize into structure variable (WELL PRODUCTION)

% --------------------------------------------------------
% Read well production keywords   
wns = or(strncmp(smry.WGNAMES,'I',1), strncmp(smry.WGNAMES,'P',1));
WELL.WNMS = smry.WGNAMES(wns);

kwd = {'TIME' 'TIMESTEP' 'WGPR' 'WOPR' 'WWPR' 'WLPR' ... 
       'WBHP' 'WTHP'     'WGPT' 'WOPT' 'WWPT' 'WLPT' ...
       'WWCT'};

for iwell = 1 : 4
    
    nm  = WELL.WNMS{iwell};
    
    fprintf('WELL NUM %d, WELL NAME ... %s \n', iwell, nm);        

    for key = 1 : length( kwd )
        
        if key == 1
            
            fprintf('%s ... \n', kwd{ key });        
            tn = smry.getNms('TIME');
            WELLS.TIME = smry.get(tn( 1 ),'TIME',:)';
            
        elseif key == 2
        
            fprintf('%s ... \n', kwd{key});        
            tn = smry.getNms('TIMESTEP');
            WELLS.STEP = smry.get(tn( 1 ),'TIMESTEP',:)';
            
        else

            fprintf('%s ... ', kwd{ key });        
            indx = strcmp(smry.KEYWORDS, kwd{ key }); 
            vals = smry.get(nm,smry.KEYWORDS{ indx },:);
            vals = vals';
            fprintf('READING KEYWORD ... %s (FOUND? %d) (SZ.VALS %d %d) \n', ...
                kwd{key}, any(indx), size(vals));  

            vals = vals(:, 1);
            evalIn = ['WELLS.' kwd{ key } ...
            '(1:length(vals), iwell) = vals'';'];
            eval(evalIn);

        end

    end
    
end


end

