function [ output_data ] = ReadAdgprsSummary( name )
% READADGPRSSUMMARY Reads AD-GPRS *.H5 file using
% MATLABs built-in functions

debug_output = true;
save_file = true;

output_data = struct;

%%
% ========================================================
% Read AD-GPRS output data using h5 libraries

if debug_output
    fprintf('\n\n')
    fprintf('LOADING PRODUCTION DATA FROM HDF5 FILE ... [USING hdf5read TWICE] \n')
    fprintf('NOW: %s\n', datestr(now))
    tic
end

% --------------------------------------------------------
% Get file info
fileinfo = hdf5info([name '.H5']);
% Read the data of the WELLS states 
WELLS_states = hdf5read(fileinfo.GroupHierarchy.Datasets( 24 ));
% Read the time steps of the simulation
time  = hdf5read(fileinfo.GroupHierarchy.Datasets( 22 ));
dtime = [time( 1 ); diff( time )];

% --------------------------------------------------------
if debug_output
    ttoc = toc;
    fprintf('DONE IN %3.1f SECS | %3.2f MINS \n', ttoc, ttoc/60)
end

%%
% ========================================================
% Extract production data

if debug_output
    fprintf('EXTRACTING PRODUCTION DATA (RATES, TOTALS) ... \n')
    fprintf('NOW: %s\n', datestr(now))
    tic
end

WELLS = [];
FIELD = [];
CELLS = [];

clear WGPR WOPR WWPR WBHP
clear WGPT WOPT WWPT

% --------------------------------------------------------
% Loop through data

[idtmax, iWELLmax] = size( WELLS_states );
widx = ones(1, iWELLmax);

for iWELL = 1 : iWELLmax,

    fprintf('Read rate, bhp for WELLS #%d\n',iWELL);

    % reading phase data into vectors
    for idt = 1 : idtmax,
        
        daccept = 1;
        
        try
            
            WBHP(idt, iWELL) = WELLS_states(idt, iWELL).Data{ 1 }.Data( 1 );
            
        catch exception
                        
            if isempty(exception.cause)
                
                WBHP(idt, iWELL) = 0;
                WGPR(idt, iWELL) = 0;
                WOPR(idt, iWELL) = 0;
                WWPR(idt, iWELL) = 0;
                
                daccept = 0;
                
            end

        end
            
        if daccept
            
            WGPR(idt, iWELL) = WELLS_states(idt, iWELL).Data{ 4 }.Data( 1 );
            WOPR(idt, iWELL) = WELLS_states(idt, iWELL).Data{ 4 }.Data( 2 );
            WWPR(idt, iWELL) = WELLS_states(idt, iWELL).Data{ 4 }.Data( 3 );
            WLPR(idt, iWELL) = WOPR(idt, iWELL) + WWPR(idt, iWELL);
        
        end
    
    end
   
%     FIX 2
%     WGPR(1, :) = WGPR(1, :) .* 0;
    
    fprintf('Cumulative values for WELLS #%d\n',iWELL);
    WGPT(1:idtmax, iWELL) = cumsum(WGPR(1:idtmax, iWELL) .* dtime); %#ok<*SAGROW>
    WOPT(1:idtmax, iWELL) = cumsum(WOPR(1:idtmax, iWELL) .* dtime);
    WWPT(1:idtmax, iWELL) = cumsum(WWPR(1:idtmax, iWELL) .* dtime);
    WLPT(1:idtmax, iWELL) = cumsum(WLPR(1:idtmax, iWELL) .* dtime);
   
    % Set injector/producer indices based on WOPR and WWPR values    
    if sum(WOPR(:, iWELL))<1e-3 && sum(WWPR(:, iWELL))<1e-3
		widx(1, iWELL) = 0;
    end	

end

%%
% ========================================================
% Compute field rates

FGPR = sum(WGPR, 2);
FOPR = sum(WOPR, 2);
FWPR = sum(WWPR, 2);
FLPR = sum(WLPR, 2);

FGPT = sum(WGPT, 2);
FOPT = sum(WOPT, 2);
FWPT = sum(WWPT, 2);
FLPT = sum(WLPT, 2);

WWCT = WWPR ./ (WOPR + WWPR);

%%
% ========================================================
% Store variables

WELLS.TIME = time; 
WELLS.WIDX = widx; 

WELLS.WGPR = WGPR;
WELLS.WOPR = WOPR;
WELLS.WWPR = WWPR;
WELLS.WLPR = WLPR;

WELLS.WBHP = WBHP;
WELLS.WGPT = WGPT;
WELLS.WOPT = WOPT;
WELLS.WWPT = WWPT;
WELLS.WLPT = WLPT;

WELLS.WWCT = WWCT;

transpose_all = true;

if transpose_all

FIELD.FGPR = FGPR';
FIELD.FOPR = FOPR';
FIELD.FWPR = FWPR';
FIELD.FLPR = FLPR';

FIELD.FGPT = FGPT';
FIELD.FOPT = FOPT';
FIELD.FWPT = FWPT';
FIELD.FLPT = FLPT';

else

FIELD.FGPR = FGPR;
FIELD.FOPR = FOPR;
FIELD.FWPR = FWPR;
FIELD.FLPR = FLPR;

FIELD.FGPT = FGPT;
FIELD.FOPT = FOPT;
FIELD.FWPT = FWPT;
FIELD.FLPT = FLPT;

end

% --------------------------------------------------------
if debug_output
    ttoc = toc;
    fprintf('DONE IN %3.1f SECS | %3.2f MINS \n', ttoc, ttoc/60)    
end

%%
% ========================================================
% Loading cell data (pressures, saturations, etc

% --------------------------------------------------------
if debug_output
    fprintf('LOADING CELL DATA FROM HDF5 FILE [USING hdf5read TWICE] ... \n')
    fprintf('NOW: %s\n', datestr(now))
    tic
end

active_cells       = hdf5read(fileinfo.GroupHierarchy.Datasets( 1 ));
grid_prop_time     = hdf5read(fileinfo.GroupHierarchy.Datasets( 12 ));
[idtmax, icellmax] = size(active_cells);

% CELLS.active_cells   = active_cells;
% CELLS.grid_prop_time = grid_prop_time;
CELLS.idtmax       = idtmax;
CELLS.icellmax     = icellmax;
CELLS.iWELSmax     = iWELLmax;

% --------------------------------------------------------
if debug_output
    ttoc = toc;
    fprintf('DONE IN %3.1f SECS | %3.2f MINS \n', ttoc, ttoc/60)    
end    

%%
% ========================================================
% Extracting data for each timestep

% --------------------------------------------------------
if debug_output
    fprintf('EXTRACTING STATE DATA (PRESSURES, SATURATIONS) FOR EACH TIMESTEP [FOR LOOP] ... \n')
    fprintf('NOW: %s\n', datestr( now ))
    tic
end

pres_index = 2;
sgas_index = 5;
soil_index = 6;

ltime = length( WELLS.TIME );
[r c1 c2] = size( grid_prop_time );

% PRE-ALLOCATE MEMORY
FPR  = zeros(ltime, 1);
FPRH = FPR;
SGAS = zeros(ltime, c2);
SOIL = SGAS;
SWAT = SGAS;

% --------------------------------------------------------
% Extract reservoir pressure, sgas, soil,, swat

for tt = 1 : ltime

    pressure = grid_prop_time(tt, pres_index, :);
    pressure = squeeze( pressure );
    FPR(tt) = mean( pressure );
    
    gsat = grid_prop_time(tt, sgas_index, :);
    gsat = squeeze(gsat);
    SGAS(tt,:) = gsat';

    osat = grid_prop_time(tt, soil_index, :);
    osat = squeeze(osat);
    SOIL(tt,:) = osat';

    % ------------------------------------------------------
    % RESERVOIR PRESSURE WEIGHTED BY HYDROCARBON PORE VOLUME    
    hsat = osat + gsat;
    FPRH(tt) = sum(hsat .* pressure) ./ sum(hsat);
    
    wsat = ones(length(osat), 1) - hsat;
    SWAT(tt,:) = wsat';
    
    if ~rem(tt,50)

       if ~rem(tt,50)

           fprintf('.  %03.0f  \n',tt);

       else

           fprintf('.  %03.0f  ',tt);

       end

    else

       fprintf('.');

    end
    
    clear pressure gsat osat hsat wsat
    
end        

if transpose_all

FIELD.FPR  = FPR(:)';
FIELD.FPRH = FPRH(:)'; % >> RESERVOIR PRESSURE WEIGHTED BY HYDROCARBON PORE VOLUME    
FIELD.TIME = time';

else
	
FIELD.FPR  = FPR(:);
FIELD.FPRH = FPRH(:); % >> RESERVOIR PRESSURE WEIGHTED BY HYDROCARBON PORE VOLUME    
FIELD.TIME = time';

end

CELLS.SGAS = SGAS;
CELLS.SOIL = SOIL;
CELLS.SWAT = SWAT;
CELLS.TIME = time;

% --------------------------------------------------------
if debug_output
    ttoc = toc;
    fprintf('DONE IN %3.1f SECS | %3.2f MINS \n', ttoc, ttoc/60)    
end

%%
% ========================================================
% Size of variables / structures

if debug_output
    
STRUCT = 'WELLS'; sz = whos(STRUCT);
fprintf(['SIZE OF --' STRUCT '-- STRUCTURE IS %6.0f KB | %5.1f MB' ... 
    ' | %3.1f GB \n'], sz.bytes / 1e3, sz.bytes / 1e6, sz.bytes / 1e9 );

STRUCT = 'FIELD'; sz = whos(STRUCT);
fprintf(['SIZE OF --' STRUCT '-- STRUCTURE IS %6.0f KB | %5.1f MB' ... 
    ' | %3.1f GB \n'], sz.bytes / 1e3, sz.bytes / 1e6, sz.bytes / 1e9 );

STRUCT = 'CELLS'; sz = whos(STRUCT);
fprintf(['SIZE OF --' STRUCT '-- STRUCTURE IS %6.0f KB | %5.1f MB' ... 
    ' | %3.1f GB \n'], sz.bytes / 1e3, sz.bytes / 1e6, sz.bytes / 1e9 );

end

%%
% ========================================================
% Save read data

if debug_output
    
    fprintf('SAVING DATA ... \n')
    fprintf('NOW: %s\n', datestr(now))
    tic

end
    
if nargout > 0
   
    output_data.WELLS = WELLS;
    output_data.FIELD = FIELD;
    output_data.CELLS = CELLS;
    
end

if debug_output
    ttoc = toc;
    fprintf('DONE IN %3.1f SECS | %3.2f MINS \n', ttoc, ttoc/60)
end

if save_file
	fn = [name '.mat'];
    save(fn, 'WELLS', 'FIELD', 'CELLS');
    fprintf('FILE SAVED IN %s\n', fn);    
end

end

