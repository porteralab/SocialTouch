rd_dr = 'F:\\Trish\\Social Touch Videos\\Fmr1KO Mice\\Revised Pupil and Running Videos';

sd_dr = 'F:\\Trish\\Social Touch Videos\\Fmr1KO Mice\\Revised Pupil and Running Videos\\Analyzed Files';

files = dir(fullfile(rd_dr));

for aa = 1:size(files,1)-2

    a = files(aa+2).name;
    cd(a)
    b = cd;
    filein = dir(fullfile(b));
    c = filein(3).name;
    cd(c)
    
    fulla = a;
    disp(fulla)
    
    mat = dir(fullfile(cd, '*.mat'));
    load(fullfile(cd, mat(1).name), 'pupil');

    bins = dir(fullfile(cd, '*.nidq.bin'));
    binnames = {bins.name};
    apbin1 = string(binnames(1));
    out1 = load_binary_file(apbin1,9,[],[],true);
    realout = out1.Data.data;
    % Read the digital port of the nidaq for the first baseline file in concatenation
    digistr = dec2bin(realout(end,:),16);
    digi = zeros([size(realout,2),16]);
    for i = 1:16
    digi(:,abs(17-i)) = (digistr(:,i)=='0');
    end
    clear digistr

    probeonsets = find(diff(digi(:,1))>0.5)+1;
    frameonsets = find(diff(digi(:,2))>0.5)+1;
    frameonsets2 = frameonsets/10593.271508;


    trialonsets = find(diff(digi(:,3))>0.5)+1;

    if isempty(trialonsets) == 0 & length(trialonsets) == 20
    trialonsets2 = trialonsets/10593.271508;
     
    
    PDfactor = 25.4/615;
    pupilmm = double(pupil{1,1}.area_smooth)*PDfactor; 
    pupildd = (sqrt(pupilmm/pi))*2;

    ddm = mean(pupildd);
    ddstd = std(pupildd);
    
    pupildd2 = pupildd;
    pupildd2(isnan(pupildd2)) = nan;
    pupildd2(pupildd2<(ddm-ddstd*2) | pupildd2>(ddm+ddstd*2)) = nan;
%     
%     if length(pupilmm) > 6000
%     beftime = 110;
%     elseif length(pupilmm) < 6000
%     beftime = 60;
%     end

    %provides prompts for entering the start and end frame where values
    %should be converted to NaN - this is if there are any frames where the
%     %behavior is being interfered with (ie. grooming)
    firstskip = 'first sec to skip'
    secondskip = 'last sec to skip'

   disp('which touch secs to omit')
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    while(1)
        pupildd2(input(firstskip)*120:input(secondskip)*120)=nan;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        if m=='N'
            break
        end
    end

%     
    pupilzscore = (pupildd2 - nanmean(pupildd2))/(nanstd(pupildd2));

    pupilzscoren = smooth(pupilzscore,120);

    n=5;
    [c index] = min(abs(frameonsets2-n));
    n=65;
    [c2 index2] = min(abs(frameonsets2-n));

    n=trialonsets2(1);
    [c indexstim1] = min(abs(frameonsets2-n));
    n=trialonsets2(6);
    [c2 indexstim2] = min(abs(frameonsets2-n));

    
    befpupil = nanmean(pupilzscoren(index:index2));
    aftpupil = nanmean(pupilzscoren(indexstim1:indexstim2));


    for a = 1:20
            n=trialonsets2(a);
            [c indexeachstim1] = min(abs(frameonsets2-n));
            n=trialonsets2(a)+5;
            [c2 indexeachstim2] = min(abs(frameonsets2-n));
            aftpupilstims(a) = nanmean(pupilzscoren(indexeachstim1:indexeachstim2));
    end

    elseif length(trialonsets) < 20 | length(trialonsets) > 20

    trialonsets2 = input("what is the values for each trial");
     
    
    PDfactor = 25.4/615; %pupiltomm conversion
    pupilmm = double(pupil{1,1}.area_smooth)*PDfactor; 
    pupildd = (sqrt(pupilmm/pi))*2;

    ddm = mean(pupildd);
    ddstd = std(pupildd);
    
    pupildd2 = pupildd;
    pupildd2(isnan(pupildd2)) = nan;
    pupildd2(pupildd2<(ddm-ddstd*2) | pupildd2>(ddm+ddstd*2)) = nan;
%     
%     if length(pupilmm) > 6000
%     beftime = 110;
%     elseif length(pupilmm) < 6000
%     beftime = 60;
%     end
%     
%     
%         %provides prompts for entering the start and end frame where values
%     %should be converted to NaN - this is if there are any frames where the
%     %behavior is being interfered with (ie. grooming)
    firstskip = 'first sec to skip'
    secondskip = 'last sec to skip'

    disp('which touch secs to omit')
    %this code goes will keep asking if there are frames that need to be
    %converted to NaN values until you say No (N)
    while(1)
        pupildd2(input(firstskip)*120:input(secondskip)*120)=nan;
        m = input('Do you want to continue, Y/N [Y]:', 's')
        if m=='N'
            break
        end
    end

    pupilzscore = (pupildd2 - nanmean(pupildd2))/(nanstd(pupildd2));

    pupilzscoren = smooth(pupilzscore,120);

    n=5;
    [c index] = min(abs(frameonsets2-n));
    n=65;
    [c2 index2] = min(abs(frameonsets2-n));

    n=trialonsets2(1);
    [c indexstim1] = min(abs(frameonsets2-n));
    n=trialonsets2(6);
    [c2 indexstim2] = min(abs(frameonsets2-n));

    
    befpupil = nanmean(pupilzscoren(index:index2));
    aftpupil = nanmean(pupilzscoren(indexstim1:indexstim2));


    for a = 1:20
            n=trialonsets2(a);
            [c indexeachstim1] = min(abs(frameonsets2-n));
            n=trialonsets2(a)+5;
            [c2 indexeachstim2] = min(abs(frameonsets2-n));
            aftpupilstims(a) = nanmean(pupilzscoren(indexeachstim1:indexeachstim2));
    end
    end
    vidN = append(fulla,"pupilsfilt");
    save(vidN, 'pupilzscoren','befpupil','aftpupil', 'aftpupilstims', 'frameonsets2', 'trialonsets2');
    cd('F:\Trish\Social Touch Videos\Fmr1KO Mice\Revised Pupil and Running Videos')
    
end

    