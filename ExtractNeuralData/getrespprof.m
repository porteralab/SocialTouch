function [newmeansortedcells, newmeansortedcellsS1, newmeansortedcellsstr, newmeansortedcellsbla, binsize, newlength, newlengthS1, newlengthstr, newlengthbla, indxS1, indxstr, indxbla, normmeanswS1, normmeanswstr, normmeanswbla] = getrespprof(mmtype, S1depths, striataldepths, bladepths, goodcludepths, goodtruclu)

binsize = 0.05;

for a = 1:length(mmtype)
    if isempty(mmtype{a}) == 0
        newmeans(:,a) = mmtype{a};
    elseif isempty(mmtype{a}) == 1
        newmeans(:,a) = [];
    end
end

%% Get normalized firing rates for S1 and BLA
%calculate normalized firing rate for BLA
newmeansize = size(newmeans);

for n = 1:(newmeansize(2));
normmean(:,n) = ((newmeans(:,n))-(mean(newmeans(:,n))))/(std(newmeans(:,n)));
end
% 


%% Plot each neuron in BLA and S1 across time relative to stimulus onset
%Sorting each of the BLA cells relative to time of stimulus onset (early
%neurons first)
%close all

for n = 1:length(mmtype)
    sortmean(:,n) = normmean(:,n);
    sortmean(:,n) = sort(sortmean(:,n));
end


%goodcludepths = goodcludepths(all(~isnan(normmean)));
%newnorm = normmean(:,all(~isnan(normmean)));
%goodcludepths = goodcludepths(all(~isinf(newnorm)));
%newnewnorm = newnorm(:,all(~isinf(newnorm)));
newnorm = normmean;
newnewnorm = newnorm;
normmeansw = newnewnorm';
%goodtruclu = goodtruclu(all(~isnan(normmean)));
%goodtruclu= goodtruclu(all(~isinf(newnorm)));

[~,Indexofmax] = max(normmeansw,[],2);

[minum, indxall] = sort(Indexofmax,'ascend');


for i = 1:length(Indexofmax)
    newindex = indxall(i);
    newmeansortedcells(i,:) = normmeansw(newindex,:);
end

newmeansortedcells(:,end) = [];
binning = -2:binsize:7;

for a = 1:size(newmeansortedcells,1)
    newmeansortedcellsmax(a,:) = newmeansortedcells(a,:)/(max(newmeansortedcells(a,:)));
end
%%
newlength = length(mmtype);
% figure(11);
% imagesc(-2:binsize:7,[1:newlength],newmeansortedcells);
% colormap jet
% hold on
% plot([0,0],[0,(newlength)],'--r')
% plot([5,5],[0,(newlength)],'--r')
% ylabel('Cell #')
% c = colorbar;
% c.Label.String = 'Normalized firing rate';
% title('All Single Cell Tuning to Social Touch')

%% S1, BLA and Striatum RESPONSE PROFILE

%% S1
S1good = find(goodcludepths >= S1depths(1) & goodcludepths <= S1depths(end));


for b = 1:length(S1good)
normmeanswS1(b,:) = normmeansw(S1good(b),:);
end

[~,IndexofmaxS1] = max(normmeanswS1,[],2);

[minumS1, indxS1] = sort(IndexofmaxS1,'ascend');


for i = 1:length(IndexofmaxS1)
    newindexS1 = indxS1(i);
    newmeansortedcellsS1(i,:) = normmeanswS1(newindexS1,:);
end

newmeansortedcellsS1(:,end) = [];
binning = -2:binsize:7;

for a = 1:size(newmeansortedcellsS1,1)
    newmeansortedcellsmaxS1(a,:) = newmeansortedcellsS1(a,:)/(max(newmeansortedcellsS1(a,:)));
end
%%
newlengthS1 = size(normmeanswS1,1);
% figure(12);
% imagesc(-2:binsize:7,[1:newlengthS1],newmeansortedcellsS1);
% colormap jet
% hold on
% plot([0,0],[0,(newlengthS1)],'--r')
% plot([5,5],[0,(newlengthS1)],'--r')
% ylabel('Cell #')
% c = colorbar;
% c.Label.String = 'Normalized firing rate';
% title('All Single Cell Tuning of S1 to Social Touch')

%% STRIATUM

strgood = find(goodcludepths >= striataldepths(1) & goodcludepths <= striataldepths(end));


for b = 1:length(strgood)
normmeanswstr(b,:) = normmeansw(strgood(b),:);
end

[~,Indexofmaxstr] = max(normmeanswstr,[],2);

[minumstr, indxstr] = sort(Indexofmaxstr,'ascend');


for i = 1:length(Indexofmaxstr)
    newindexstr = indxstr(i);
    newmeansortedcellsstr(i,:) = normmeanswstr(newindexstr,:);
end

newmeansortedcellsstr(:,end) = [];
binning = -2:binsize:7;

for a = 1:size(newmeansortedcellsstr,1)
    newmeansortedcellsmaxstr(a,:) = newmeansortedcellsstr(a,:)/(max(newmeansortedcellsstr(a,:)));
end
%%
newlengthstr = size(normmeanswstr,1);
% figure(13);
% imagesc(-2:binsize:7,[1:newlengthstr],newmeansortedcellsstr);
% colormap jet
% hold on
% plot([0,0],[0,(newlengthstr)],'--r')
% plot([5,5],[0,(newlengthstr)],'--r')
% ylabel('Cell #')
% c = colorbar;
% c.Label.String = 'Normalized firing rate';
% title('All Single Cell Tuning of Striatum to Social Touch')

%% BLA

blagood = find(goodcludepths >= bladepths(1) & goodcludepths <= bladepths(end));


for b = 1:length(blagood)
normmeanswbla(b,:) = normmeansw(blagood(b),:);
end

[~,Indexofmaxbla] = max(normmeanswbla,[],2);

[minumbla, indxbla] = sort(Indexofmaxbla,'ascend');


for i = 1:length(Indexofmaxbla)
    newindexbla = indxbla(i);
    newmeansortedcellsbla(i,:) = normmeanswbla(newindexbla,:);
end

newmeansortedcellsbla(:,end) = [];
binning = -2:binsize:7;

for a = 1:size(newmeansortedcellsbla,1)
    newmeansortedcellsmaxbla(a,:) = newmeansortedcellsbla(a,:)/(max(newmeansortedcellsbla(a,:)));
end
%%
newlengthbla = size(normmeanswbla,1);
% figure(14);
% imagesc(-2:binsize:7,[1:newlengthbla],newmeansortedcellsbla);
% colormap jet
% hold on
% plot([0,0],[0,(newlengthbla)],'--r')
% plot([5,5],[0,(newlengthbla)],'--r')
% ylabel('Cell #')
% c = colorbar;
% c.Label.String = 'Normalized firing rate';
% title('All Single Cell Tuning of BLA to Social Touch')
end