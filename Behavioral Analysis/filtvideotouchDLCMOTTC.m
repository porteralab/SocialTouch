function[filteredzscore,filtereddata, zscore, data] = filtvideotouchDLCMOTTC(data, type, firstskip, secondskip, badbouts)
%     hsecmouth = transpose(hsecmouth);
    filtereddata = data;    

    if size(badbouts,1) > 0
    i = 1;
    allbadybouts = badbouts(:,1);
    for m = 1:size(badbouts, 1)/2
        filtereddata(allbadybouts(i):allbadybouts(i+1,:)) = nan;
        i = i+2;
    end
    end


    for a = 1:length(firstskip)
        filtereddata(firstskip(a)*60:secondskip(a)*60)=nan;
    end

    filteredzscore= (filtereddata - nanmean(filtereddata))/nanstd(filtereddata);
    zscore = (data -nanmean(data))/nanstd(data);