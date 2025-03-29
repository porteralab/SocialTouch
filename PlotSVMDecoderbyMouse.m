
clear testitmouse
for a = 1:9
    n = nanmean(allaccuraciesSHUFS1bymouseWT{a});
    testit(a,:) = smoothdata(n,'movmean', 2);
end

figure; shadedErrorBar(-1.95:0.05:7, nanmean(testit), nanstd(testit)/sqrt(9), 'lineprops', 'k')


clear testit2
for a = 1:10
    n = nanmean(allaccuraciesSHUFS1bymouseKO{a});
    testit2(a,:) = smoothdata(n,'movmean', 2);
end

hold on; shadedErrorBar(-1.95:0.05:7, nanmean(testit2), nanstd(testit2)/sqrt(10), 'lineprops', 'r')

xlim([-1 2])

ylim([45 75])

clear testit3
for a = 1:9
    n = nanmean(allaccuraciesSHUFSTRbymouseWT{a});
    testit3(a,:) = smoothdata(n,'movmean', 2);
end

figure; shadedErrorBar(-1.95:0.05:7, nanmean(testit3), nanstd(testit3)/sqrt(9), 'lineprops', 'k')


clear testit4
for a = 1:10
    n = nanmean(allaccuraciesSHUFSTRbymouseKO{a});
    testit4(a,:) = smoothdata(n,'movmean', 2);
end

hold on; shadedErrorBar(-1.95:0.05:7, nanmean(testit4), nanstd(testit4)/sqrt(10), 'lineprops', 'r')

xlim([-1 2])

ylim([45 75])

clear testit5
for a = 1:9
    n = nanmean(allaccuraciesSHUFBLAbymouseWT{a});
    testit5(a,:) = smoothdata(n,'movmean', 2);
end

figure; shadedErrorBar(-1.95:0.05:7, nanmean(testit5), nanstd(testit5)/sqrt(9), 'lineprops', 'k')


clear testit6
for a = 1:10
    n = nanmean(allaccuraciesSHUFBLAbymouseKO{a});
    testit6(a,:) = smoothdata(n,'movmean', 2);
end

hold on; shadedErrorBar(-1.95:0.05:7, nanmean(testit6), nanstd(testit6)/sqrt(10), 'lineprops', 'r')



xlim([-1 2])

ylim([45 75])