function [spikes,ln]=plotrastersTC(raster,trial_index,offset,color)
%
if ~iscell(raster)
    trials = unique(trial_index);
    spikes = cell(1,length(trials));
    for ii = trials
        spikes{ii} = raster(trial_index==trials(ii));
    end
else
    spikes = raster;
end
if ~exist('color','var')
    color = 'k';
end

if ~exist('offset','var')
    offset = 0;
end
%
linesize = 1;
minimum=-20;
maximum=20;
ln = [];

for ii=1:length(spikes)
    for jj=1:length(spikes{ii})
        ln = [ln,line(spikes{ii}(jj).*[1,1],...
            [minimum,maximum]+trial_index,...
            'color','k','linewidth',0.2)];
    end
    offset=offset+1;
end

%xlabel('Time (s)','fontname','Arial','fontsize',12,'fontweight','bold')
%ylabel('Trials','fontname','Arial','fontsize'
